import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'app_theme.dart';

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

    const PdfColor ivory = PdfColor.fromInt(0xFFFAF7F0);
    const PdfColor white = PdfColor.fromInt(0xFFFFFFFF);
    const PdfColor teal = PdfColor.fromInt(0xFF176D5D);
    const PdfColor tealSoft = PdfColor.fromInt(0xFFE4F0EB);
    const PdfColor gold = PdfColor.fromInt(0xFFB28A46);
    const PdfColor goldSoft = PdfColor.fromInt(0xFFF3EAD8);
    const PdfColor text = PdfColor.fromInt(0xFF25332E);
    const PdfColor muted = PdfColor.fromInt(0xFF687A73);

    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4.landscape,
        margin: const pw.EdgeInsets.all(18),
        build: (pw.Context context) {
          return pw.Container(
            decoration: pw.BoxDecoration(
              color: ivory,
              border: pw.Border.all(color: gold, width: 3),
            ),
            padding: const pw.EdgeInsets.all(10),
            child: pw.Container(
              decoration: pw.BoxDecoration(
                color: white,
                border: pw.Border.all(color: teal, width: 1.4),
              ),
              padding: const pw.EdgeInsets.symmetric(
                horizontal: 34,
                vertical: 24,
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: <pw.Widget>[
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Row(
                        children: <pw.Widget>[
                          pw.Container(
                            width: 48,
                            height: 48,
                            alignment: pw.Alignment.center,
                            decoration: const pw.BoxDecoration(
                              color: teal,
                              shape: pw.BoxShape.circle,
                            ),
                            child: pw.Text(
                              'HP',
                              style: pw.TextStyle(
                                color: white,
                                fontSize: 18,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ),
                          pw.SizedBox(width: 12),
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: <pw.Widget>[
                              pw.Text(
                                'HAJI PINTAR',
                                style: pw.TextStyle(
                                  color: teal,
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                              ),
                              pw.SizedBox(height: 3),
                              pw.Text(
                                'Pembelajaran Kendiri Haji',
                                style: const pw.TextStyle(
                                  color: muted,
                                  fontSize: 9,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.symmetric(
                          horizontal: 13,
                          vertical: 7,
                        ),
                        decoration: pw.BoxDecoration(
                          color: goldSoft,
                          borderRadius: pw.BorderRadius.circular(20),
                          border: pw.Border.all(color: gold, width: 0.8),
                        ),
                        child: pw.Text(
                          'MARKAH ${data.score}%',
                          style: pw.TextStyle(
                            color: gold,
                            fontSize: 10,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 16),
                  pw.Container(width: 78, height: 3, color: gold),
                  pw.SizedBox(height: 13),
                  pw.Text(
                    'SIJIL PENCAPAIAN',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      color: teal,
                      fontSize: 29,
                      fontWeight: pw.FontWeight.bold,
                      letterSpacing: 2.2,
                    ),
                  ),
                  pw.SizedBox(height: 5),
                  pw.Text(
                    'PROGRAM PEMBELAJARAN KENDIRI ASAS IBADAH HAJI',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      color: gold,
                      fontSize: 12,
                      fontWeight: pw.FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                  ),
                  pw.SizedBox(height: 17),
                  pw.Text(
                    'Dengan ini diperakui bahawa',
                    style: const pw.TextStyle(color: muted, fontSize: 11),
                  ),
                  pw.SizedBox(height: 9),
                  pw.Container(
                    width: 560,
                    padding: const pw.EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: pw.FittedBox(
                      fit: pw.BoxFit.scaleDown,
                      child: pw.Text(
                        data.name,
                        style: pw.TextStyle(
                          color: text,
                          fontSize: 31,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  pw.Container(width: 510, height: 1, color: gold),
                  pw.SizedBox(height: 13),
                  pw.Text(
                    'telah berjaya menamatkan program pembelajaran kendiri '
                    'dan memperoleh markah sekurang-kurangnya 80 peratus '
                    'dalam Penilaian Akhir Asas Ibadah Haji.',
                    textAlign: pw.TextAlign.center,
                    style: const pw.TextStyle(
                      color: text,
                      fontSize: 11,
                      lineSpacing: 3,
                    ),
                  ),
                  pw.SizedBox(height: 17),
                  pw.Container(
                    width: 250,
                    padding: const pw.EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    decoration: pw.BoxDecoration(
                      color: tealSoft,
                      borderRadius: pw.BorderRadius.circular(8),
                      border: pw.Border.all(color: teal, width: 0.8),
                    ),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: <pw.Widget>[
                        pw.Text(
                          'STATUS: ',
                          style: const pw.TextStyle(color: muted, fontSize: 9),
                        ),
                        pw.Text(
                          'LULUS',
                          style: pw.TextStyle(
                            color: teal,
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(width: 13),
                        pw.Container(width: 1, height: 17, color: teal),
                        pw.SizedBox(width: 13),
                        pw.Text(
                          '${data.score}%',
                          style: pw.TextStyle(
                            color: teal,
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
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
                              'Tarikh dikeluarkan',
                              style: const pw.TextStyle(
                                color: muted,
                                fontSize: 8,
                              ),
                            ),
                            pw.SizedBox(height: 4),
                            pw.Text(
                              _formatDate(data.issuedAt),
                              style: pw.TextStyle(
                                color: text,
                                fontSize: 10,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Column(
                          children: <pw.Widget>[
                            pw.Container(width: 145, height: 1, color: gold),
                            pw.SizedBox(height: 5),
                            pw.Text(
                              'Program Haji Pintar',
                              style: pw.TextStyle(
                                color: text,
                                fontSize: 9,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            pw.Text(
                              'Penyedia pembelajaran',
                              style: const pw.TextStyle(
                                color: muted,
                                fontSize: 7,
                              ),
                            ),
                          ],
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.end,
                          children: <pw.Widget>[
                            pw.Text(
                              'No. sijil',
                              style: const pw.TextStyle(
                                color: muted,
                                fontSize: 8,
                              ),
                            ),
                            pw.SizedBox(height: 4),
                            pw.Text(
                              data.certificateNumber,
                              style: pw.TextStyle(
                                color: text,
                                fontSize: 10,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 11),
                  pw.Container(
                    width: double.infinity,
                    padding: const pw.EdgeInsets.only(top: 7),
                    decoration: const pw.BoxDecoration(
                      border: pw.Border(
                        top: pw.BorderSide(color: goldSoft, width: 1),
                      ),
                    ),
                    child: pw.Text(
                      'Sijil ini ialah sijil pencapaian yang dijana oleh '
                      'Aplikasi Haji Pintar dan bukan sijil rasmi mana-mana '
                      'pihak berkuasa atau agensi pengelola Haji.',
                      textAlign: pw.TextAlign.center,
                      style: const pw.TextStyle(color: muted, fontSize: 6.5),
                    ),
                  ),
                ],
              ),
            ),
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
                        _CertificateIconButton(
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

class _CertificateIconButton extends StatelessWidget {
  const _CertificateIconButton({
    required this.tooltip,
    required this.icon,
    required this.onPressed,
  });

  final String tooltip;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;

    return IconButton(
      tooltip: tooltip,
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: palette.glassSurface,
        foregroundColor: context.appColorScheme.onSurface,
        side: BorderSide(color: palette.glassBorder),
      ),
      icon: Icon(icon),
    );
  }
}
