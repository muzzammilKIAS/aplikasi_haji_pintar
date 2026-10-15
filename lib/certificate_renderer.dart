import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'app_theme.dart';
import 'certificate_constants.dart';

/// Data yang dicetak pada sijil.
class CertificateContent {
  const CertificateContent({
    required this.name,
    required this.achievementLevel,
    required this.date,
    required this.certificateNumber,
    this.score,
  });

  final String name;
  final String achievementLevel;
  final String date;
  final String certificateNumber;
  final int? score;
}

class _Ink {
  static const Color paper = Color(0xFFFCF9F2);
  static const Color paperEdge = Color(0xFFF2EAD8);
  static const Color green = Color(0xFF0E4A3B);
  static const Color greenDeep = Color(0xFF0A372C);
  static const Color greenSoft = Color(0xFF2F6F5C);
  static const Color gold = Color(0xFFB08537);
  static const Color goldLight = Color(0xFFE2C78A);
  static const Color kaaba = Color(0xFF1B1D1C);
  static const Color ink = Color(0xFF1C2A24);
  static const Color muted = Color(0xFF5B6862);
}

/// Melukis keseluruhan sijil secara vektor dalam koordinat
/// [CertificateLayout], lalu diskalakan sekata ke saiz sasaran.
class CertificatePainter extends CustomPainter {
  CertificatePainter({required this.content});

  final CertificateContent content;

  static const double _w = CertificateLayout.width;
  static const double _h = CertificateLayout.height;
  static const double _cx = _w / 2;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(size.width / _w);

    _paintFrame(canvas);
    _paintHeader(canvas);
    _paintRecipient(canvas);
    _paintSealAndDetails(canvas);
    _paintFooter(canvas);

    canvas.restore();
  }

  void _paintFrame(Canvas canvas) {
    const Rect full = Rect.fromLTWH(0, 0, _w, _h);
    canvas.drawRect(
      full,
      Paint()
        ..shader = ui.Gradient.linear(
          Offset.zero,
          const Offset(_w, _h),
          <Color>[_Ink.green, _Ink.greenDeep],
        ),
    );
    canvas.drawRect(
      full.deflate(14),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..color = _Ink.goldLight.withValues(alpha: 0.55),
    );

    final Rect paper = full.deflate(30);
    canvas.drawRect(
      paper,
      Paint()
        ..shader = ui.Gradient.radial(paper.center, _w * 0.62, <Color>[
          _Ink.paper,
          _Ink.paperEdge,
        ]),
    );

    // Corak bintang lapan yang pudar ke arah tengah supaya teks kekal jelas.
    canvas.save();
    canvas.clipRect(paper);
    canvas.saveLayer(paper, Paint());
    final Paint lattice = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.1
      ..color = _Ink.gold.withValues(alpha: 0.22);
    const double cell = 84;
    int row = 0;
    for (double y = paper.top; y < paper.bottom + cell; y += cell * 0.5) {
      final double shift = row.isOdd ? cell / 2 : 0;
      for (double x = paper.left - cell; x < paper.right + cell; x += cell) {
        canvas.drawPath(_rubElHizb(Offset(x + shift, y), cell * 0.27), lattice);
      }
      row++;
    }
    canvas.drawRect(
      paper,
      Paint()
        ..blendMode = BlendMode.dstIn
        ..shader = ui.Gradient.radial(
          paper.center,
          _w * 0.58,
          <Color>[
            const Color(0x00000000),
            const Color(0x14000000),
            const Color(0xFF000000),
          ],
          <double>[0.0, 0.55, 1.0],
        ),
    );
    canvas.restore();
    canvas.restore();

    // Roset besar tera air di belakang nama.
    final Paint watermark = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..color = _Ink.green.withValues(alpha: 0.03);
    const Offset rosette = Offset(_cx, 560);
    canvas.drawPath(_rubElHizb(rosette, 270), watermark);
    canvas.drawPath(_rubElHizb(rosette, 270, rotation: math.pi / 8), watermark);
    canvas.drawCircle(rosette, 196, watermark);

    final Paint goldStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.6
      ..color = _Ink.gold;
    canvas.drawRect(full.deflate(44), goldStroke);
    canvas.drawRect(
      full.deflate(52),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.9
        ..color = _Ink.gold.withValues(alpha: 0.75),
    );

    final Rect corners = full.deflate(48);
    for (final Offset corner in <Offset>[
      corners.topLeft,
      corners.topRight,
      corners.bottomLeft,
      corners.bottomRight,
    ]) {
      _medallion(canvas, corner, 27);
    }
    _medallion(canvas, Offset(_cx, corners.bottom), 14);
    _medallion(canvas, Offset(corners.left, _h / 2), 14);
    _medallion(canvas, Offset(corners.right, _h / 2), 14);
  }

  void _paintHeader(Canvas canvas) {
    const Offset emblem = Offset(_cx, 116);
    canvas.drawCircle(
      emblem,
      54,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..color = _Ink.gold.withValues(alpha: 0.7),
    );
    canvas.drawCircle(emblem, 47, Paint()..color = _Ink.green);
    canvas.drawCircle(
      emblem,
      47,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.6
        ..color = _Ink.gold,
    );
    canvas.drawPath(
      _rubElHizb(emblem, 35),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.6
        ..color = _Ink.goldLight,
    );
    final Rect kaaba = Rect.fromCenter(center: emblem, width: 26, height: 28);
    canvas.drawRect(kaaba, Paint()..color = _Ink.kaaba);
    canvas.drawRect(
      Rect.fromLTWH(kaaba.left, kaaba.top + 7, kaaba.width, 3.6),
      Paint()..color = _Ink.goldLight,
    );
    canvas.drawRect(
      Rect.fromLTWH(kaaba.right - 9, kaaba.bottom - 11, 5, 11),
      Paint()..color = _Ink.gold.withValues(alpha: 0.9),
    );

    _text(
      canvas,
      TextSpan(
        text: 'HAJI PINTAR',
        style: _body(15, FontWeight.w600, _Ink.gold, letterSpacing: 6),
      ),
      top: 184,
    );
    _text(
      canvas,
      TextSpan(
        text: 'Sijil Pencapaian',
        style: _display(76, FontWeight.w700, _Ink.green, letterSpacing: -0.5),
      ),
      top: 208,
    );
    _text(
      canvas,
      TextSpan(
        text: 'شَهَادَةُ إِنْجَازٍ',
        style: TextStyle(
          fontFamily: AppFonts.arabic,
          fontSize: 30,
          height: 1.4,
          color: _Ink.gold,
        ),
      ),
      top: 300,
      direction: TextDirection.rtl,
    );
    _divider(canvas, 368, 300);
  }

  void _paintRecipient(Canvas canvas) {
    _text(
      canvas,
      TextSpan(
        text: 'Dengan sukacitanya diperakui bahawa',
        style: _body(21, FontWeight.w400, _Ink.muted),
      ),
      top: 388,
    );

    final String name = content.name.trim().isEmpty
        ? 'Nama Peserta'
        : content.name.trim();
    double nameSize = 58;
    TextPainter namePainter;
    do {
      namePainter = TextPainter(
        text: TextSpan(
          text: name,
          style: _display(nameSize, FontWeight.w600, _Ink.green),
        ),
        textDirection: TextDirection.ltr,
        maxLines: 1,
      )..layout();
      nameSize -= 2;
    } while (namePainter.width > 1040 && nameSize > 26);
    namePainter.paint(
      canvas,
      Offset(_cx - namePainter.width / 2, 470 - namePainter.height / 2),
    );

    final double lineHalf = math.max(260, namePainter.width / 2 + 40);
    canvas.drawLine(
      Offset(_cx - lineHalf, 516),
      Offset(_cx + lineHalf, 516),
      Paint()
        ..strokeWidth = 1.2
        ..shader = ui.Gradient.linear(
          Offset(_cx - lineHalf, 516),
          Offset(_cx + lineHalf, 516),
          <Color>[
            _Ink.gold.withValues(alpha: 0),
            _Ink.gold,
            _Ink.gold.withValues(alpha: 0),
          ],
          <double>[0, 0.5, 1],
        ),
    );

    final String withLevel = switch (_level) {
      'CEMERLANG' => ' dengan cemerlang',
      'SANGAT BAIK' => ' dengan sangat baik',
      _ => '',
    };
    final TextStyle base = _body(21, FontWeight.w400, _Ink.ink, height: 1.6);
    _text(
      canvas,
      TextSpan(
        style: base,
        children: <InlineSpan>[
          TextSpan(
            text:
                'telah melengkapkan pembelajaran kendiri Modul Belajar Haji '
                'dalam aplikasi Haji Pintar dan lulus Penilaian Akhir'
                '$withLevel. Kandungannya disusun berpandukan kitab ',
          ),
          TextSpan(
            text: 'al-Idah fi Manasik al-Hajj wa al-Umrah',
            style: base.copyWith(fontStyle: FontStyle.italic),
          ),
          const TextSpan(text: ' karangan Imam an-Nawawi.'),
        ],
      ),
      top: 538,
      left: _cx - 490,
      width: 980,
    );
  }

  void _paintSealAndDetails(Canvas canvas) {
    const Offset seal = Offset(_cx, 790);
    final (Color fillTop, Color fillBottom) = switch (_level) {
      'CEMERLANG' => (const Color(0xFFC59A45), const Color(0xFF8E6522)),
      'SANGAT BAIK' => (_Ink.greenSoft, _Ink.green),
      _ => (const Color(0xFF3F7F6B), const Color(0xFF235847)),
    };

    final Path badge = _star(seal, 100, points: 32, innerRatio: 0.92);
    canvas.drawPath(
      badge,
      Paint()..color = _Ink.goldLight.withValues(alpha: 0.45),
    );
    canvas.drawPath(
      badge,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2
        ..color = _Ink.gold,
    );
    canvas.drawCircle(
      seal,
      88,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..color = _Ink.gold,
    );
    canvas.drawCircle(
      seal,
      80,
      Paint()
        ..shader = ui.Gradient.linear(
          seal.translate(0, -80),
          seal.translate(0, 80),
          <Color>[fillTop, fillBottom],
        ),
    );
    canvas.drawCircle(
      seal,
      80,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..color = _Ink.goldLight,
    );
    final Paint dot = Paint()..color = _Ink.goldLight.withValues(alpha: 0.85);
    for (int i = 0; i < 40; i++) {
      final double a = i * 2 * math.pi / 40;
      canvas.drawCircle(
        seal + Offset(math.cos(a) * 70, math.sin(a) * 70),
        1.4,
        dot,
      );
    }

    final bool hasScore = content.score != null;
    _text(
      canvas,
      TextSpan(
        text: 'TAHAP',
        style: _body(12, FontWeight.w600, _Ink.goldLight, letterSpacing: 3),
      ),
      top: seal.dy - (hasScore ? 44 : 36),
    );
    final TextPainter level = _fit(
      _titleCase(_level),
      _display(27, FontWeight.w700, Colors.white),
      maxWidth: 124,
    );
    level.paint(
      canvas,
      Offset(
        seal.dx - level.width / 2,
        seal.dy - level.height / 2 - (hasScore ? 4 : 0),
      ),
    );
    if (hasScore) {
      _text(
        canvas,
        TextSpan(
          text: 'Markah ${content.score}%',
          style: _body(14, FontWeight.w600, _Ink.goldLight),
        ),
        top: seal.dy + 22,
      );
    }

    _detail(canvas, 'TARIKH', content.date, 405);
    _detail(
      canvas,
      'NO. SIJIL',
      content.certificateNumber.trim().isEmpty
          ? '—'
          : content.certificateNumber,
      _w - 405,
    );
  }

  void _paintFooter(Canvas canvas) {
    _text(
      canvas,
      TextSpan(
        text:
            'Sijil pembelajaran kendiri dalam aplikasi Haji Pintar — bukan '
            'pentauliahan rasmi agensi pengurusan Haji atau pihak berkuasa '
            'agama.',
        style: _body(13.5, FontWeight.w400, _Ink.muted, height: 1.5),
      ),
      top: 952,
      left: _cx - 560,
      width: 1120,
    );
  }

  void _detail(Canvas canvas, String label, String value, double centerX) {
    _text(
      canvas,
      TextSpan(
        text: label,
        style: _body(13, FontWeight.w600, _Ink.gold, letterSpacing: 3),
      ),
      top: 760,
      left: centerX - 150,
      width: 300,
    );
    final TextPainter valuePainter = _fit(
      value,
      _display(25, FontWeight.w600, _Ink.ink),
      maxWidth: 280,
    );
    valuePainter.paint(canvas, Offset(centerX - valuePainter.width / 2, 784));
    canvas.drawLine(
      Offset(centerX - 135, 828),
      Offset(centerX + 135, 828),
      Paint()
        ..strokeWidth = 1
        ..color = _Ink.gold.withValues(alpha: 0.8),
    );
  }

  void _divider(Canvas canvas, double y, double halfWidth) {
    final Paint line = Paint()
      ..strokeWidth = 1.2
      ..color = _Ink.gold;
    canvas.drawLine(Offset(_cx - halfWidth, y), Offset(_cx - 18, y), line);
    canvas.drawLine(Offset(_cx + 18, y), Offset(_cx + halfWidth, y), line);
    canvas.drawPath(_rubElHizb(Offset(_cx, y), 9), Paint()..color = _Ink.gold);
    canvas.drawCircle(
      Offset(_cx - halfWidth, y),
      2.4,
      Paint()..color = _Ink.gold,
    );
    canvas.drawCircle(
      Offset(_cx + halfWidth, y),
      2.4,
      Paint()..color = _Ink.gold,
    );
  }

  void _medallion(Canvas canvas, Offset center, double radius) {
    canvas.drawPath(_rubElHizb(center, radius), Paint()..color = _Ink.green);
    canvas.drawPath(
      _rubElHizb(center, radius),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = radius > 20 ? 2 : 1.4
        ..color = _Ink.gold,
    );
    canvas.drawCircle(center, radius * 0.24, Paint()..color = _Ink.goldLight);
  }

  /// Bintang lapan (dua segi empat bertindih), motif Rub el Hizb.
  static Path _rubElHizb(Offset c, double r, {double rotation = 0}) {
    return _star(c, r, points: 8, innerRatio: 0.7654, rotation: rotation);
  }

  static Path _star(
    Offset c,
    double r, {
    required int points,
    required double innerRatio,
    double rotation = 0,
  }) {
    final Path path = Path();
    for (int i = 0; i < points * 2; i++) {
      final double a = rotation - math.pi / 2 + i * math.pi / points;
      final double radius = i.isEven ? r : r * innerRatio;
      final Offset p = c + Offset(math.cos(a) * radius, math.sin(a) * radius);
      if (i == 0) {
        path.moveTo(p.dx, p.dy);
      } else {
        path.lineTo(p.dx, p.dy);
      }
    }
    return path..close();
  }

  static void _text(
    Canvas canvas,
    InlineSpan span, {
    required double top,
    double left = 0,
    double width = _w,
    TextDirection direction = TextDirection.ltr,
  }) {
    final TextPainter painter = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: direction,
    )..layout(minWidth: width, maxWidth: width);
    painter.paint(canvas, Offset(left, top));
  }

  static TextPainter _fit(
    String text,
    TextStyle style, {
    required double maxWidth,
  }) {
    TextPainter painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout();
    if (painter.width > maxWidth) {
      painter = TextPainter(
        text: TextSpan(
          text: text,
          style: style.copyWith(
            fontSize: style.fontSize! * maxWidth / painter.width,
          ),
        ),
        textDirection: TextDirection.ltr,
        maxLines: 1,
      )..layout();
    }
    return painter;
  }

  static TextStyle _display(
    double size,
    FontWeight weight,
    Color color, {
    double letterSpacing = 0,
  }) {
    return TextStyle(
      fontFamily: AppFonts.display,
      fontFamilyFallback: const <String>[AppFonts.arabic],
      fontSize: size,
      fontWeight: weight,
      color: color,
      letterSpacing: letterSpacing,
      height: 1.2,
    );
  }

  static TextStyle _body(
    double size,
    FontWeight weight,
    Color color, {
    double letterSpacing = 0,
    double height = 1.3,
  }) {
    return TextStyle(
      fontFamily: AppFonts.body,
      fontFamilyFallback: const <String>[AppFonts.arabic],
      fontSize: size,
      fontWeight: weight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  String get _level => content.achievementLevel.trim().toUpperCase();

  static String _titleCase(String value) {
    return value
        .toLowerCase()
        .split(' ')
        .map((String w) => w.isEmpty ? w : w[0].toUpperCase() + w.substring(1))
        .join(' ');
  }

  @override
  bool shouldRepaint(covariant CertificatePainter oldDelegate) {
    final CertificateContent a = oldDelegate.content;
    return a.name != content.name ||
        a.achievementLevel != content.achievementLevel ||
        a.date != content.date ||
        a.certificateNumber != content.certificateNumber ||
        a.score != content.score;
  }
}

/// Imej PNG sijil pada [pixelRatio] × saiz reka bentuk (2 = ~255 dpi pada A4).
Future<Uint8List> renderCertificatePng(
  CertificateContent content, {
  double pixelRatio = 2,
}) async {
  final Size size = Size(
    CertificateLayout.width * pixelRatio,
    CertificateLayout.height * pixelRatio,
  );
  final ui.PictureRecorder recorder = ui.PictureRecorder();
  CertificatePainter(content: content).paint(Canvas(recorder), size);
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
      aspectRatio: CertificateLayout.width / CertificateLayout.height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: context.hajjColors.shadow,
              blurRadius: 24,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Semantics(
            image: true,
            label:
                'Sijil Pencapaian Haji Pintar untuk ${content.name}, '
                'tahap ${content.achievementLevel}, '
                'tarikh ${content.date}, '
                'nombor ${content.certificateNumber}',
            child: RepaintBoundary(
              child: CustomPaint(
                painter: CertificatePainter(content: content),
                size: Size.infinite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
