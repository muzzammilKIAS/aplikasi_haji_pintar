import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'app_theme.dart';
import 'certificate_constants.dart';

/// Data yang dicetak di atas templat sijil.
class CertificateContent {
  const CertificateContent({
    required this.name,
    required this.achievementLevel,
    required this.date,
    required this.certificateNumber,
  });

  final String name;
  final String achievementLevel;
  final String date;
  final String certificateNumber;
}

ui.Image? _templateCache;

Future<ui.Image> loadCertificateTemplate() async {
  final ui.Image? cached = _templateCache;
  if (cached != null) {
    return cached;
  }
  final ByteData data = await rootBundle.load(CertificateLayout.templateAsset);
  final ui.Codec codec = await ui.instantiateImageCodec(
    data.buffer.asUint8List(),
  );
  final ui.FrameInfo frame = await codec.getNextFrame();
  return _templateCache = frame.image;
}

/// Melukis templat dan semua teks dalam koordinat piksel templat, lalu
/// diskalakan sekata ke saiz sasaran. Digunakan oleh pratonton dan PDF
/// supaya kedua-duanya sentiasa sepadan.
class CertificatePainter extends CustomPainter {
  CertificatePainter({required this.template, required this.content});

  final ui.Image template;
  final CertificateContent content;

  @override
  void paint(Canvas canvas, Size size) {
    final double scale = size.width / CertificateLayout.templateWidth;
    canvas.save();
    canvas.scale(scale);

    paintImage(
      canvas: canvas,
      rect: const Rect.fromLTWH(
        0,
        0,
        CertificateLayout.templateWidth,
        CertificateLayout.templateHeight,
      ),
      image: template,
      filterQuality: FilterQuality.high,
    );

    _drawSlot(
      canvas,
      CertificateLayout.name,
      content.name.toUpperCase(),
      AppFonts.display,
      FontWeight.w700,
      CertificateLayout.nameColor,
    );
    _drawSlot(
      canvas,
      CertificateLayout.achievement,
      _titleCase(content.achievementLevel),
      AppFonts.display,
      FontWeight.w700,
      CertificateLayout.achievementColor,
    );
    _drawSlot(
      canvas,
      CertificateLayout.date,
      content.date,
      AppFonts.body,
      FontWeight.w700,
      CertificateLayout.detailColor,
    );
    _drawSlot(
      canvas,
      CertificateLayout.number,
      content.certificateNumber,
      AppFonts.body,
      FontWeight.w700,
      CertificateLayout.detailColor,
    );

    canvas.restore();
  }

  void _drawSlot(
    Canvas canvas,
    CertificateSlot slot,
    String text,
    String family,
    FontWeight weight,
    Color color,
  ) {
    if (text.trim().isEmpty) {
      return;
    }

    TextPainter layout(double fontSize) {
      return TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(
            fontFamily: family,
            fontFamilyFallback: const <String>[AppFonts.arabic],
            fontSize: fontSize,
            fontWeight: weight,
            color: color,
            height: 1.0,
          ),
        ),
        textDirection: TextDirection.ltr,
        maxLines: 1,
      )..layout();
    }

    TextPainter painter = layout(slot.fontSize);
    if (painter.width > slot.width) {
      painter = layout(slot.fontSize * slot.width / painter.width);
    }

    final double dx = switch (slot.align) {
      TextAlign.center => slot.left + (slot.width - painter.width) / 2,
      TextAlign.right => slot.left + slot.width - painter.width,
      _ => slot.left,
    };
    final double ascent = painter.computeDistanceToActualBaseline(
      TextBaseline.alphabetic,
    );
    painter.paint(canvas, Offset(dx, slot.baseline - ascent));
  }

  static String _titleCase(String value) {
    return value
        .toLowerCase()
        .split(' ')
        .map((String w) => w.isEmpty ? w : w[0].toUpperCase() + w.substring(1))
        .join(' ');
  }

  @override
  bool shouldRepaint(covariant CertificatePainter oldDelegate) {
    return oldDelegate.template != template ||
        oldDelegate.content.name != content.name ||
        oldDelegate.content.achievementLevel != content.achievementLevel ||
        oldDelegate.content.date != content.date ||
        oldDelegate.content.certificateNumber != content.certificateNumber;
  }
}

/// Imej PNG sijil pada [pixelRatio] × saiz templat (2 = ~255 dpi pada A4).
Future<Uint8List> renderCertificatePng(
  CertificateContent content, {
  double pixelRatio = 2,
}) async {
  final ui.Image template = await loadCertificateTemplate();
  final Size size = Size(
    CertificateLayout.templateWidth * pixelRatio,
    CertificateLayout.templateHeight * pixelRatio,
  );
  final ui.PictureRecorder recorder = ui.PictureRecorder();
  CertificatePainter(
    template: template,
    content: content,
  ).paint(Canvas(recorder), size);
  final ui.Image image = await recorder.endRecording().toImage(
    size.width.round(),
    size.height.round(),
  );
  final ByteData? png = await image.toByteData(format: ui.ImageByteFormat.png);
  image.dispose();
  return png!.buffer.asUint8List();
}

Future<Uint8List> buildCertificatePdf(CertificateContent content) async {
  final Uint8List png = await renderCertificatePng(content);
  final pw.Document document = pw.Document(
    title: 'Sijil Pencapaian Haji Pintar',
    author: 'Haji Pintar',
    creator: 'Aplikasi Haji Pintar',
    subject: 'Sijil pencapaian pembelajaran kendiri',
  );
  document.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4.landscape,
      margin: pw.EdgeInsets.zero,
      build: (pw.Context context) {
        return pw.SizedBox.expand(
          child: pw.Image(pw.MemoryImage(png), fit: pw.BoxFit.fill),
        );
      },
    ),
  );
  return document.save();
}

/// Pratonton sijil dalam app — lukisan yang sama seperti PDF.
class CertificatePreview extends StatelessWidget {
  const CertificatePreview({required this.content, super.key});

  final CertificateContent content;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio:
          CertificateLayout.templateWidth / CertificateLayout.templateHeight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: context.hajjColors.gold.withValues(alpha: 0.20),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: FutureBuilder<ui.Image>(
            future: loadCertificateTemplate(),
            builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
              final ui.Image? template = snapshot.data;
              if (template == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return Semantics(
                image: true,
                label:
                    'Sijil Pencapaian Haji Pintar untuk ${content.name}, '
                    'tahap ${content.achievementLevel}, '
                    'tarikh ${content.date}, '
                    'nombor ${content.certificateNumber}',
                child: CustomPaint(
                  painter: CertificatePainter(
                    template: template,
                    content: content,
                  ),
                  size: Size.infinite,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
