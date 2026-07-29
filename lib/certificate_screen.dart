import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'app_theme.dart';
import 'shared_widgets.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({
    required this.assessmentBox,
    required this.score,
    super.key,
  });

  final Box<dynamic> assessmentBox;
  final int score;

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;

  bool isBusy = false;

  bool get hasPassed =>
      widget.assessmentBox.get('passed', defaultValue: false) == true;

  int get certificateScore {
    final dynamic savedBest = widget.assessmentBox.get(
      'best_score',
      defaultValue: widget.score,
    );

    if (savedBest is int) {
      return savedBest;
    }

    return widget.score;
  }

  @override
  void initState() {
    super.initState();

    final dynamic savedName = widget.assessmentBox.get(
      'certificate_name',
      defaultValue: '',
    );

    nameController = TextEditingController(
      text: savedName is String ? savedName : '',
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Future<_CertificateData> _prepareCertificateData() async {
    final String name = nameController.text.trim();

    final DateTime now = DateTime.now();

    final dynamic existingNumber = widget.assessmentBox.get(
      'certificate_number',
    );

    final dynamic existingDate = widget.assessmentBox.get(
      'certificate_issued_at',
    );

    final String certificateNumber =
        existingNumber is String && existingNumber.isNotEmpty
        ? existingNumber
        : _generateCertificateNumber(now);

    final DateTime issuedAt = existingDate is String
        ? DateTime.tryParse(existingDate) ?? now
        : now;

    await widget.assessmentBox.putAll(<String, dynamic>{
      'certificate_name': name,
      'certificate_number': certificateNumber,
      'certificate_issued_at': issuedAt.toIso8601String(),
      'certificate_score': certificateScore,
    });

    return _CertificateData(
      name: name,
      score: certificateScore,
      certificateNumber: certificateNumber,
      issuedAt: issuedAt,
    );
  }

  String _generateCertificateNumber(DateTime date) {
    final String raw = date.millisecondsSinceEpoch.toString();

    final String suffix = raw.length > 7
        ? raw.substring(raw.length - 7)
        : raw.padLeft(7, '0');

    return 'HP-${date.year}-$suffix';
  }

  String _formatDate(DateTime date) {
    const List<String> months = <String>[
      'Januari',
      'Februari',
      'Mac',
      'April',
      'Mei',
      'Jun',
      'Julai',
      'Ogos',
      'September',
      'Oktober',
      'November',
      'Disember',
    ];

    return '${date.day} '
        '${months[date.month - 1]} '
        '${date.year}';
  }

  String _safeFileName(String name) {
    final String cleaned = name
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9]+'), '_')
        .replaceAll(RegExp(r'^_+|_+$'), '');

    return cleaned.isEmpty ? 'jemaah_haji' : cleaned;
  }

  Future<Uint8List> _buildPdf(_CertificateData data) async {
    final pw.Document document = pw.Document(
      title: 'Sijil Pencapaian Pembelajaran Kendiri Haji',
      author: 'Haji Pintar',
      creator: 'Aplikasi Haji Pintar',
      subject: 'Sijil pencapaian pembelajaran kendiri',
    );

    // Font serif (Playfair Display) untuk tajuk/nama, dan sans (Plus Jakarta
    // Sans) untuk teks badan — sepadan dengan tipografi aplikasi. Jika
    // muat turun font Google Fonts gagal (tiada internet semasa jana PDF),
    // kembali guna fon lalai supaya sijil tetap boleh dijana.
    pw.Font? serifBold;
    pw.Font? serifRegular;
    pw.Font? sansRegular;
    pw.Font? sansBold;

    try {
      serifBold = await PdfGoogleFonts.playfairDisplayBold();
      serifRegular = await PdfGoogleFonts.playfairDisplayRegular();
      sansRegular = await PdfGoogleFonts.plusJakartaSansRegular();
      sansBold = await PdfGoogleFonts.plusJakartaSansBold();
    } catch (_) {
      serifBold = null;
      serifRegular = null;
      sansRegular = null;
      sansBold = null;
    }

    // Logo aplikasi sebenar (assets/images/app_icon.png, sama fail yang
    // digunakan untuk ikon apps). Jika tiada / gagal dimuat, kembali guna
    // monogram "HP" supaya sijil tetap lengkap.
    pw.MemoryImage? logoImage;
    try {
      final ByteData logoData = await rootBundle.load(
        'assets/images/app_icon.png',
      );
      logoImage = pw.MemoryImage(logoData.buffer.asUint8List());
    } catch (_) {
      logoImage = null;
    }

    const PdfColor ivory = PdfColor.fromInt(0xFFFBF7EE);
    const PdfColor white = PdfColor.fromInt(0xFFFFFFFF);
    const PdfColor teal = PdfColor.fromInt(0xFF0E5C4F);
    const PdfColor tealSoft = PdfColor.fromInt(0xFFE4F0EB);
    const PdfColor gold = PdfColor.fromInt(0xFFAD7B27);
    const PdfColor goldSoft = PdfColor.fromInt(0xFFF3EAD8);
    const PdfColor text = PdfColor.fromInt(0xFF25332E);
    const PdfColor muted = PdfColor.fromInt(0xFF687A73);
    const PdfColor goldFaint = PdfColor.fromInt(0xFFDCC79A);
    const PdfColor tealFaint = PdfColor.fromInt(0xFF9AB8B0);

    pw.TextStyle serif({
      double size = 12,
      PdfColor color = text,
      double letterSpacing = 0,
    }) {
      return pw.TextStyle(
        font: serifBold,
        fontFallback: serifRegular != null
            ? <pw.Font>[serifRegular]
            : <pw.Font>[],
        fontWeight: pw.FontWeight.bold,
        fontSize: size,
        color: color,
        letterSpacing: letterSpacing,
      );
    }

    pw.TextStyle sans({
      double size = 10,
      PdfColor color = text,
      bool bold = false,
      double letterSpacing = 0,
      double? lineSpacing,
    }) {
      return pw.TextStyle(
        font: bold ? sansBold : sansRegular,
        fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
        fontSize: size,
        color: color,
        letterSpacing: letterSpacing,
        lineSpacing: lineSpacing,
      );
    }

    // Pembahagi hiasan pendek: garis - berlian kecil - garis. Padanan
    // dengan `HajjOrnamentDivider` yang digunakan dalam UI aplikasi supaya
    // sijil dan aplikasi berkongsi satu bahasa reka bentuk.
    pw.Widget ornamentDivider({double width = 150}) {
      return pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: <pw.Widget>[
          pw.Container(width: width, height: 1, color: gold),
          pw.Container(
            margin: const pw.EdgeInsets.symmetric(horizontal: 7),
            width: 5,
            height: 5,
            decoration: const pw.BoxDecoration(
              color: gold,
              shape: pw.BoxShape.circle,
            ),
          ),
          pw.Container(width: width, height: 1, color: gold),
        ],
      );
    }

    // Bulatan hiasan kecil di setiap penjuru bingkai dalam — sentuhan
    // "permata" yang halus, lazim pada sijil bergaya klasik/Islamik.
    pw.Widget cornerJewel() {
      return pw.Container(
        width: 7,
        height: 7,
        decoration: const pw.BoxDecoration(
          color: gold,
          shape: pw.BoxShape.circle,
        ),
      );
    }

    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4.landscape,
        margin: const pw.EdgeInsets.all(16),
        build: (pw.Context context) {
          return pw.Stack(
            children: <pw.Widget>[
              // Bingkai berlapis tiga: emas tebal (luar) → putih → emas
              // nipis (dalam) — memberi kesan "kertas rasmi" yang lebih
              // bertaraf berbanding satu garis sempadan sahaja.
              pw.Container(
                decoration: pw.BoxDecoration(
                  color: ivory,
                  border: pw.Border.all(color: gold, width: 2.6),
                ),
                padding: const pw.EdgeInsets.all(9),
                child: pw.Container(
                  decoration: pw.BoxDecoration(
                    color: white,
                    border: pw.Border.all(color: teal, width: 1.1),
                  ),
                  padding: const pw.EdgeInsets.all(5),
                  child: pw.Container(
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: goldFaint, width: 0.6),
                    ),
                    padding: const pw.EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 26,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: <pw.Widget>[
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: <pw.Widget>[
                            pw.Row(
                              children: <pw.Widget>[
                                pw.Container(
                                  width: 50,
                                  height: 50,
                                  alignment: pw.Alignment.center,
                                  decoration: pw.BoxDecoration(
                                    color: logoImage != null ? white : teal,
                                    shape: pw.BoxShape.circle,
                                    border: pw.Border.all(
                                      color: gold,
                                      width: 1.3,
                                    ),
                                  ),
                                  child: logoImage != null
                                      ? pw.ClipRRect(
                                          horizontalRadius: 25,
                                          verticalRadius: 25,
                                          child: pw.Image(
                                            logoImage,
                                            width: 42,
                                            height: 42,
                                            fit: pw.BoxFit.cover,
                                          ),
                                        )
                                      : pw.Text(
                                          'HP',
                                          style: serif(size: 18, color: white),
                                        ),
                                ),
                                pw.SizedBox(width: 13),
                                pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: <pw.Widget>[
                                    pw.Text(
                                      'HAJI PINTAR',
                                      style: serif(
                                        size: 17,
                                        color: teal,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                    pw.SizedBox(height: 3),
                                    pw.Text(
                                      'Pembelajaran Kendiri Haji & Umrah',
                                      style: sans(size: 9, color: muted),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            pw.Container(
                              padding: const pw.EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 8,
                              ),
                              decoration: pw.BoxDecoration(
                                color: goldSoft,
                                borderRadius: pw.BorderRadius.circular(24),
                                border: pw.Border.all(color: gold, width: 0.8),
                              ),
                              child: pw.Text(
                                'MARKAH ${data.score}%',
                                style: sans(
                                  size: 10,
                                  color: gold,
                                  bold: true,
                                  letterSpacing: 0.6,
                                ),
                              ),
                            ),
                          ],
                        ),
                        pw.SizedBox(height: 22),
                        ornamentDivider(width: 46),
                        pw.SizedBox(height: 16),
                        pw.Text(
                          'SIJIL PENCAPAIAN',
                          textAlign: pw.TextAlign.center,
                          style: serif(size: 32, color: teal, letterSpacing: 3),
                        ),
                        pw.SizedBox(height: 6),
                        pw.Text(
                          'PROGRAM PEMBELAJARAN KENDIRI ASAS IBADAH HAJI',
                          textAlign: pw.TextAlign.center,
                          style: sans(
                            size: 11,
                            color: gold,
                            bold: true,
                            letterSpacing: 1.6,
                          ),
                        ),
                        pw.SizedBox(height: 20),
                        pw.Text(
                          'Dengan ini diperakui bahawa',
                          style: sans(size: 11.5, color: muted),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Container(
                          width: 580,
                          padding: const pw.EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          child: pw.FittedBox(
                            fit: pw.BoxFit.scaleDown,
                            child: pw.Text(
                              data.name,
                              style: serif(size: 34, color: text),
                            ),
                          ),
                        ),
                        pw.SizedBox(height: 8),
                        pw.Column(
                          children: <pw.Widget>[
                            pw.Container(width: 460, height: 1.4, color: gold),
                            pw.SizedBox(height: 2),
                            pw.Container(width: 460, height: 0.6, color: gold),
                          ],
                        ),
                        pw.SizedBox(height: 16),
                        pw.Container(
                          width: 620,
                          child: pw.Text(
                            'telah berjaya menamatkan program pembelajaran '
                            'kendiri dan memperoleh markah sekurang-kurangnya '
                            '80 peratus dalam Penilaian Akhir Asas Ibadah Haji.',
                            textAlign: pw.TextAlign.center,
                            style: sans(size: 11, color: text, lineSpacing: 3),
                          ),
                        ),
                        pw.SizedBox(height: 18),
                        pw.Container(
                          padding: const pw.EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 11,
                          ),
                          decoration: pw.BoxDecoration(
                            color: tealSoft,
                            borderRadius: pw.BorderRadius.circular(9),
                            border: pw.Border.all(color: teal, width: 0.8),
                          ),
                          child: pw.Row(
                            mainAxisSize: pw.MainAxisSize.min,
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: <pw.Widget>[
                              pw.Text(
                                'STATUS  ',
                                style: sans(size: 9, color: muted),
                              ),
                              pw.Text(
                                'LULUS',
                                style: sans(
                                  size: 12,
                                  color: teal,
                                  bold: true,
                                  letterSpacing: 0.8,
                                ),
                              ),
                              pw.SizedBox(width: 14),
                              pw.Container(
                                width: 1,
                                height: 16,
                                color: tealFaint,
                              ),
                              pw.SizedBox(width: 14),
                              pw.Text(
                                '${data.score}%',
                                style: sans(size: 12, color: teal, bold: true),
                              ),
                            ],
                          ),
                        ),
                        pw.Spacer(),
                        pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.end,
                          children: <pw.Widget>[
                            pw.Expanded(
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: <pw.Widget>[
                                  pw.Text(
                                    'TARIKH DIKELUARKAN',
                                    style: sans(
                                      size: 7.5,
                                      color: muted,
                                      letterSpacing: 0.8,
                                    ),
                                  ),
                                  pw.SizedBox(height: 5),
                                  pw.Text(
                                    _formatDate(data.issuedAt),
                                    style: sans(
                                      size: 10.5,
                                      color: text,
                                      bold: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // "Meterai" pengesahan di tengah — cincin emas
                            // berlapis dengan label SAH, gantian kepada
                            // tandatangan fizikal untuk sijil digital.
                            pw.Column(
                              children: <pw.Widget>[
                                pw.Container(
                                  width: 60,
                                  height: 60,
                                  alignment: pw.Alignment.center,
                                  decoration: pw.BoxDecoration(
                                    shape: pw.BoxShape.circle,
                                    color: goldSoft,
                                    border: pw.Border.all(
                                      color: gold,
                                      width: 1.4,
                                    ),
                                  ),
                                  child: pw.Container(
                                    width: 48,
                                    height: 48,
                                    alignment: pw.Alignment.center,
                                    decoration: pw.BoxDecoration(
                                      shape: pw.BoxShape.circle,
                                      border: pw.Border.all(
                                        color: gold,
                                        width: 0.6,
                                      ),
                                    ),
                                    child: pw.Text(
                                      'SAH',
                                      style: serif(size: 12, color: gold),
                                    ),
                                  ),
                                ),
                                pw.SizedBox(height: 6),
                                pw.Text(
                                  'Program Haji Pintar',
                                  style: sans(
                                    size: 8.5,
                                    color: text,
                                    bold: true,
                                  ),
                                ),
                              ],
                            ),
                            pw.Expanded(
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.end,
                                children: <pw.Widget>[
                                  pw.Text(
                                    'NO. SIJIL',
                                    style: sans(
                                      size: 7.5,
                                      color: muted,
                                      letterSpacing: 0.8,
                                    ),
                                  ),
                                  pw.SizedBox(height: 5),
                                  pw.Text(
                                    data.certificateNumber,
                                    style: sans(
                                      size: 10.5,
                                      color: text,
                                      bold: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        pw.SizedBox(height: 14),
                        pw.Container(
                          width: double.infinity,
                          padding: const pw.EdgeInsets.only(top: 8),
                          decoration: const pw.BoxDecoration(
                            border: pw.Border(
                              top: pw.BorderSide(color: goldSoft, width: 1),
                            ),
                          ),
                          child: pw.Text(
                            'Sijil ini ialah sijil pencapaian yang dijana '
                            'oleh Aplikasi Haji Pintar dan bukan sijil rasmi '
                            'mana-mana pihak berkuasa atau agensi pengelola '
                            'Haji.',
                            textAlign: pw.TextAlign.center,
                            style: sans(size: 6.5, color: muted),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Permata hiasan pada keempat-empat penjuru bingkai dalam.
              pw.Positioned(top: 20, left: 20, child: cornerJewel()),
              pw.Positioned(top: 20, right: 20, child: cornerJewel()),
              pw.Positioned(bottom: 20, left: 20, child: cornerJewel()),
              pw.Positioned(bottom: 20, right: 20, child: cornerJewel()),
            ],
          );
        },
      ),
    );

    return document.save();
  }

  Future<void> _previewCertificate() async {
    if (!_validateForm()) {
      return;
    }

    await _runBusyAction(() async {
      final _CertificateData data = await _prepareCertificateData();

      await Printing.layoutPdf(
        name: 'Sijil Pencapaian Haji Pintar',
        format: PdfPageFormat.a4.landscape,
        onLayout: (PdfPageFormat format) {
          return _buildPdf(data);
        },
      );
    });
  }

  Future<void> _shareCertificate() async {
    if (!_validateForm()) {
      return;
    }

    await _runBusyAction(() async {
      final _CertificateData data = await _prepareCertificateData();

      final Uint8List bytes = await _buildPdf(data);

      await Printing.sharePdf(
        bytes: bytes,
        filename:
            'sijil_haji_pintar_'
            '${_safeFileName(data.name)}.pdf',
        subject: 'Sijil Pencapaian Haji Pintar',
        body: 'Sijil pencapaian pembelajaran kendiri Haji.',
      );
    });
  }

  bool _validateForm() {
    if (!hasPassed) {
      _showMessage(
        'Sijil hanya boleh dijana selepas '
        'lulus penilaian akhir.',
      );
      return false;
    }

    return formKey.currentState?.validate() ?? false;
  }

  Future<void> _runBusyAction(Future<void> Function() action) async {
    setState(() {
      isBusy = true;
    });

    try {
      await action();
    } catch (error) {
      if (mounted) {
        _showMessage(
          'Sijil tidak dapat dijana. '
          'Cuba semula.',
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          isBusy = false;
        });
      }
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 320),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              palette.gradientStart,
              palette.gradientMiddle,
              palette.gradientEnd,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 780),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        HajjIconButton(
                          tooltip: 'Kembali',
                          icon: Icons.arrow_back_rounded,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'SIJIL PENCAPAIAN',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: colors.onSurface,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.4,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Pembelajaran Kendiri Haji',
                                style: TextStyle(
                                  color: palette.mutedText,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 46),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: palette.glassSurface,
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(
                          color: palette.gold.withValues(alpha: 0.30),
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: palette.shadow,
                            blurRadius: 28,
                            offset: const Offset(0, 14),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 76,
                            height: 76,
                            decoration: BoxDecoration(
                              color: palette.gold.withValues(alpha: 0.11),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: palette.gold.withValues(alpha: 0.28),
                              ),
                            ),
                            child: Icon(
                              Icons.workspace_premium_rounded,
                              color: palette.gold,
                              size: 39,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            hasPassed
                                ? 'Tahniah! Anda layak menjana sijil.'
                                : 'Sijil masih dikunci.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: colors.onSurface,
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            hasPassed
                                ? 'Markah terbaik anda ialah '
                                      '$certificateScore%.'
                                : 'Lengkapkan penilaian akhir '
                                      'dan capai sekurang-kurangnya 80%.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: palette.mutedText,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: palette.glassSurface,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: palette.glassBorder),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: palette.shadow,
                            blurRadius: 24,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Nama pada sijil',
                              style: TextStyle(
                                color: colors.onSurface,
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Masukkan nama penuh '
                              'seperti yang mahu dipaparkan.',
                              style: TextStyle(
                                color: palette.mutedText,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 14),
                            TextFormField(
                              controller: nameController,
                              enabled: hasPassed && !isBusy,
                              textCapitalization: TextCapitalization.words,
                              decoration: const InputDecoration(
                                labelText: 'Nama penuh',
                                hintText: 'Contoh: Ahmad bin Abdullah',
                                prefixIcon: Icon(Icons.person_outline_rounded),
                                border: OutlineInputBorder(),
                              ),
                              validator: (String? value) {
                                final String name = value?.trim() ?? '';

                                if (name.isEmpty) {
                                  return 'Masukkan nama penuh.';
                                }

                                if (name.length < 3) {
                                  return 'Nama terlalu pendek.';
                                }

                                return null;
                              },
                            ),
                            const SizedBox(height: 18),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: palette.emerald.withValues(alpha: 0.08),
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: palette.emerald.withValues(
                                    alpha: 0.20,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.verified_rounded,
                                    color: palette.emerald,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      'Status: '
                                      '${hasPassed ? 'Lulus' : 'Belum lulus'}'
                                      '  •  Markah: '
                                      '$certificateScore%',
                                      style: TextStyle(
                                        color: colors.onSurface,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: FilledButton.icon(
                        onPressed: hasPassed && !isBusy
                            ? _previewCertificate
                            : null,
                        icon: isBusy
                            ? const SizedBox(
                                width: 19,
                                height: 19,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.picture_as_pdf_rounded),
                        label: const Text('Pratonton / Cetak PDF'),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: OutlinedButton.icon(
                        onPressed: hasPassed && !isBusy
                            ? _shareCertificate
                            : null,
                        icon: const Icon(Icons.download_rounded),
                        label: const Text('Muat Turun / Kongsi PDF'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: palette.gold.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: palette.gold.withValues(alpha: 0.20),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.info_outline_rounded,
                            color: palette.gold,
                            size: 20,
                          ),
                          const SizedBox(width: 11),
                          Expanded(
                            child: Text(
                              'Sijil ini ialah sijil '
                              'pencapaian aplikasi dan '
                              'bukan sijil rasmi pihak '
                              'berkuasa atau agensi '
                              'pengelola Haji.',
                              style: TextStyle(
                                color: palette.mutedText,
                                fontSize: 12,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CertificateData {
  const _CertificateData({
    required this.name,
    required this.score,
    required this.certificateNumber,
    required this.issuedAt,
  });

  final String name;
  final int score;
  final String certificateNumber;
  final DateTime issuedAt;
}
