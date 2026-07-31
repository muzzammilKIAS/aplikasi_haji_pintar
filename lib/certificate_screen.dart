import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'app_theme.dart';
import 'certificate_constants.dart';
import 'shared_widgets.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({
    required this.assessmentBox,
    required this.certificatesBox,
    required this.score,
    super.key,
  });

  final Box<dynamic> assessmentBox;
  final Box<dynamic> certificatesBox;
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

    nameController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
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

    final ByteData templateData = await rootBundle.load(
      'assets/images/sijil-pencapaian-hajipintar.png',
    );

    final ByteData playfairBoldData = await rootBundle.load(
      'assets/fonts/PlayfairDisplay-Bold.ttf',
    );
    final ByteData jakartaBoldData = await rootBundle.load(
      'assets/fonts/PlusJakartaSans-Bold.ttf',
    );

    final pw.Font playfairBold = pw.Font.ttf(playfairBoldData);
    final pw.Font jakartaBold = pw.Font.ttf(jakartaBoldData);

    final pw.MemoryImage templateImage = pw.MemoryImage(
      templateData.buffer.asUint8List(),
    );

    final String name = data.name.toUpperCase();
    final String date = _formatDate(data.issuedAt);
    final String certNumber = data.certificateNumber;

    const double pageWidth = 297.0 * PdfPageFormat.mm;
    const double pageHeight = 210.0 * PdfPageFormat.mm;
    const double scaleX = pageWidth / CertificateCoordinates.templateWidth;
    const double scaleY = pageHeight / CertificateCoordinates.templateHeight;

    final double nameSize = CertificateCoordinates.nameFontSizeForLength(
      name.length,
    );

    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4.landscape,
        margin: pw.EdgeInsets.zero,
        build: (pw.Context context) {
          return pw.Stack(
            children: <pw.Widget>[
              pw.Positioned.fill(
                child: pw.Image(templateImage, fit: pw.BoxFit.cover),
              ),
              // Nama peserta — text-anchor middle, dominant-baseline middle.
              pw.Positioned(
                top: CertificateCoordinates.nameY * scaleY - nameSize * scaleY * 0.4,
                left: CertificateCoordinates.nameX * scaleX - 200 * scaleX,
                child: pw.Container(
                  width: 400 * scaleX,
                  alignment: pw.Alignment.center,
                  child: pw.Text(
                    name,
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      font: playfairBold,
                      fontSize: nameSize * scaleY,
                      color: const PdfColor.fromInt(0xFF006B57),
                    ),
                  ),
                ),
              ),
              // Tahap pencapaian — text-anchor start.
              pw.Positioned(
                top: CertificateCoordinates.achievementY * scaleY -
                    CertificateCoordinates.achievementFontSize * scaleY * 0.4,
                left: CertificateCoordinates.achievementX * scaleX,
                child: pw.Text(
                  data.score >= 95
                      ? 'CEMERLANG'
                      : data.score >= 90
                          ? 'SANGAT BAIK'
                          : 'LULUS',
                  style: pw.TextStyle(
                    font: playfairBold,
                    fontSize: CertificateCoordinates.achievementFontSize * scaleY,
                    color: const PdfColor.fromInt(0xFFB46A16),
                  ),
                ),
              ),
              // Tarikh — text-anchor middle.
              pw.Positioned(
                top: CertificateCoordinates.dateY * scaleY -
                    CertificateCoordinates.dateFontSize * scaleY * 0.4,
                left: CertificateCoordinates.dateX * scaleX - 80 * scaleX,
                child: pw.Container(
                  width: 160 * scaleX,
                  alignment: pw.Alignment.center,
                  child: pw.Text(
                    date,
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      font: jakartaBold,
                      fontSize: CertificateCoordinates.dateFontSize * scaleY,
                      color: const PdfColor.fromInt(0xFF16231F),
                    ),
                  ),
                ),
              ),
              // Nombor sijil — text-anchor middle.
              pw.Positioned(
                top: CertificateCoordinates.certificateNumberY * scaleY -
                    CertificateCoordinates.certificateNumberFontSize * scaleY * 0.4,
                left: CertificateCoordinates.certificateNumberX * scaleX - 80 * scaleX,
                child: pw.Container(
                  width: 160 * scaleX,
                  alignment: pw.Alignment.center,
                  child: pw.Text(
                    certNumber,
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      font: jakartaBold,
                      fontSize: CertificateCoordinates.certificateNumberFontSize * scaleY,
                      color: const PdfColor.fromInt(0xFF16231F),
                    ),
                  ),
                ),
              ),
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
                    _CertificatePreview(
                      name: nameController.text.trim().toUpperCase(),
                      achievementLevel: widget.assessmentBox.get(
                        'achievement_level',
                        defaultValue: 'LULUS',
                      ),
                      date: _formatDate(DateTime.now()),
                      certificateNumber: widget.assessmentBox.get(
                        'certificate_number',
                        defaultValue: '',
                      ),
                    ),
                    const SizedBox(height: 24),
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

class _CertificatePreview extends StatelessWidget {
  const _CertificatePreview({
    required this.name,
    required this.achievementLevel,
    required this.date,
    required this.certificateNumber,
  });

  final String name;
  final String achievementLevel;
  final String date;
  final String certificateNumber;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: CertificateCoordinates.templateWidth /
          CertificateCoordinates.templateHeight,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: context.hajjColors.gold.withValues(alpha: 0.20),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double width = constraints.maxWidth;
              final double height = constraints.maxHeight;

              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    'assets/images/sijil-pencapaian-hajipintar.png',
                    fit: BoxFit.contain,
                  ),
                  // Nama peserta — text-anchor middle, dominant-baseline middle.
                  if (name.isNotEmpty)
                    Positioned(
                      left: width * CertificateCoordinates.nameX /
                              CertificateCoordinates.templateWidth -
                          350,
                      top: height * CertificateCoordinates.nameY /
                              CertificateCoordinates.templateHeight -
                          CertificateCoordinates.nameFontSizeForLength(
                                name.length,
                              ) /
                              2,
                      child: SizedBox(
                        width: 700,
                        child: Text(
                          name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: CertificateCoordinates.nameFontFamily,
                            fontSize: CertificateCoordinates
                                .nameFontSizeForLength(name.length),
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF006B57),
                            height: 1.0,
                          ),
                        ),
                      ),
                    ),
                  // Tahap pencapaian — text-anchor start, dominant-baseline middle.
                  Positioned(
                    left: width * CertificateCoordinates.achievementX /
                        CertificateCoordinates.templateWidth,
                    top: height * CertificateCoordinates.achievementY /
                            CertificateCoordinates.templateHeight -
                        CertificateCoordinates.achievementFontSize / 2,
                    child: Text(
                      achievementLevel,
                      style: const TextStyle(
                        fontFamily: CertificateCoordinates
                            .achievementFontFamily,
                        fontSize: CertificateCoordinates
                            .achievementFontSize,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFB46A16),
                        height: 1.0,
                      ),
                    ),
                  ),
                  // Tarikh — text-anchor middle, dominant-baseline middle.
                  Positioned(
                    left: width * CertificateCoordinates.dateX /
                            CertificateCoordinates.templateWidth -
                        120,
                    top: height * CertificateCoordinates.dateY /
                            CertificateCoordinates.templateHeight -
                        CertificateCoordinates.dateFontSize / 2,
                    child: SizedBox(
                      width: 240,
                      child: Text(
                        date,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: CertificateCoordinates.dateFontFamily,
                          fontSize: CertificateCoordinates.dateFontSize,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF16231F),
                          height: 1.0,
                        ),
                      ),
                    ),
                  ),
                  // Nombor sijil — text-anchor middle, dominant-baseline middle.
                  Positioned(
                    left: width * CertificateCoordinates.certificateNumberX /
                            CertificateCoordinates.templateWidth -
                        120,
                    top: height * CertificateCoordinates.certificateNumberY /
                            CertificateCoordinates.templateHeight -
                        CertificateCoordinates.certificateNumberFontSize / 2,
                    child: SizedBox(
                      width: 240,
                      child: Text(
                        certificateNumber,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: CertificateCoordinates
                              .certificateNumberFontFamily,
                          fontSize: CertificateCoordinates
                              .certificateNumberFontSize,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF16231F),
                          height: 1.0,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
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
