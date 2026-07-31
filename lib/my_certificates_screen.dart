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

class MyCertificatesScreen extends StatelessWidget {
  const MyCertificatesScreen({
    required this.certificatesBox,
    required this.assessmentBox,
    super.key,
  });

  final Box<dynamic> certificatesBox;
  final Box<dynamic> assessmentBox;

  Future<List<Map<dynamic, dynamic>>> _loadCertificates() async {
    final List<Map<dynamic, dynamic>> items = <Map<dynamic, dynamic>>[];

    for (final dynamic key in certificatesBox.keys) {
      final dynamic value = certificatesBox.get(key);
      if (value is Map) {
        items.add(Map<dynamic, dynamic>.from(value));
      }
    }

    items.sort(
      (Map<dynamic, dynamic> a, Map<dynamic, dynamic> b) =>
          (b['issued_at'] ?? '').toString().compareTo(
            (a['issued_at'] ?? '').toString(),
          ),
    );

    return items;
  }

  Future<Uint8List> _buildCertificatePdf(
    Map<dynamic, dynamic> certificate,
  ) async {
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

    final String name = (certificate['participant_name'] ?? '')
        .toString()
        .toUpperCase();
    final String date = _formatDate(
      DateTime.tryParse(certificate['exam_completed_at']?.toString() ?? '') ??
          DateTime.now(),
    );
    final String certNumber =
        certificate['certificate_number']?.toString() ?? '';
    final String level =
        certificate['achievement_level']?.toString() ?? 'LULUS';

    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4.landscape,
        margin: pw.EdgeInsets.zero,
        build: (pw.Context context) {
          const double pageWidth = 297.0 * PdfPageFormat.mm;
          const double pageHeight = 210.0 * PdfPageFormat.mm;
          const double scaleX = pageWidth / CertificateCoordinates.templateWidth;
          const double scaleY =
              pageHeight / CertificateCoordinates.templateHeight;

          final double nameSize = CertificateCoordinates.nameFontSizeForLength(
            name.length,
          );

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
                  level,
                  style: pw.TextStyle(
                    font: playfairBold,
                    fontSize: CertificateCoordinates.achievementFontSize *
                        scaleY,
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
                    CertificateCoordinates.certificateNumberFontSize *
                        scaleY *
                        0.4,
                left: CertificateCoordinates.certificateNumberX * scaleX -
                    80 * scaleX,
                child: pw.Container(
                  width: 160 * scaleX,
                  alignment: pw.Alignment.center,
                  child: pw.Text(
                    certNumber,
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      font: jakartaBold,
                      fontSize: CertificateCoordinates
                              .certificateNumberFontSize *
                          scaleY,
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

    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  Future<void> _previewCertificate(
    BuildContext context,
    Map<dynamic, dynamic> certificate,
  ) async {
    final Uint8List bytes = await _buildCertificatePdf(certificate);

    await Printing.layoutPdf(
      name: 'Sijil Haji Pintar',
      format: const PdfPageFormat(297, 210),
      onLayout: (PdfPageFormat format) => bytes,
    );
  }

  Future<void> _shareCertificate(
    BuildContext context,
    Map<dynamic, dynamic> certificate,
  ) async {
    final Uint8List bytes = await _buildCertificatePdf(certificate);

    final String certNumber =
        certificate['certificate_number']?.toString() ?? '';
    final String name = (certificate['participant_name'] ?? '')
        .toString()
        .toLowerCase();

    final String safeName = name
        .replaceAll(RegExp(r'[^a-z0-9]+'), '_')
        .replaceAll(RegExp(r'^_+|_+$'), '');

    final String fileName =
        'Sijil-HajiPintar-${safeName.isEmpty ? "jemaah" : safeName}-$certNumber.pdf';

    await Printing.sharePdf(
      bytes: bytes,
      filename: fileName,
      subject: 'Sijil Pencapaian Haji Pintar',
      body: 'Sijil pencapaian pembelajaran kendiri Haji.',
    );
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
                          child: Text(
                            'SIJIL SAYA',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: colors.onSurface,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.4,
                            ),
                          ),
                        ),
                        const SizedBox(width: 46),
                      ],
                    ),
                    const SizedBox(height: 24),
                    FutureBuilder<List<Map<dynamic, dynamic>>>(
                      future: _loadCertificates(),
                      builder:
                          (
                            BuildContext context,
                            AsyncSnapshot<List<Map<dynamic, dynamic>>> snapshot,
                          ) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(24),
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }

                            final List<Map<dynamic, dynamic>> certificates =
                                snapshot.data ?? <Map<dynamic, dynamic>>[];

                            if (certificates.isEmpty) {
                              return Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(28),
                                decoration: BoxDecoration(
                                  color: palette.glassSurface,
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: palette.glassBorder,
                                  ),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.workspace_premium_outlined,
                                      size: 48,
                                      color: palette.mutedText,
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'Anda belum mempunyai sijil.',
                                      style: TextStyle(
                                        color: colors.onSurface,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Selesaikan penilaian akhir dengan markah '
                                      'sekurang-kurangnya 80% untuk menerima sijil.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: palette.mutedText,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }

                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: certificates.length,
                              itemBuilder: (BuildContext context, int index) {
                                final Map<dynamic, dynamic> cert =
                                    certificates[index];
                                final String name =
                                    (cert['participant_name'] ?? 'Peserta')
                                        .toString();
                                final String certNumber =
                                    cert['certificate_number']?.toString() ??
                                    '-';
                                final int score = (cert['score'] is int)
                                    ? cert['score'] as int
                                    : 0;
                                final String level =
                                    (cert['achievement_level']?.toString() ??
                                            'LULUS')
                                        .toUpperCase();

                                return Container(
                                  margin: const EdgeInsets.only(bottom: 16),
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                    color: palette.glassSurface,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: palette.glassBorder,
                                    ),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: palette.gold.withValues(
                                            alpha: 0.11,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          border: Border.all(
                                            color: palette.gold.withValues(
                                              alpha: 0.24,
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            level == 'CEMERLANG' ? '🏆' : '🎖️',
                                            style: const TextStyle(
                                              fontSize: 22,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 14),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              name,
                                              style: TextStyle(
                                                color: colors.onSurface,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              '$certNumber  •  $score%  •  $level',
                                              style: TextStyle(
                                                color: palette.mutedText,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        tooltip: 'Pratonton',
                                        onPressed: () =>
                                            _previewCertificate(context, cert),
                                        icon: Icon(
                                          Icons.visibility_rounded,
                                          color: palette.emerald,
                                        ),
                                      ),
                                      IconButton(
                                        tooltip: 'Muat turun',
                                        onPressed: () =>
                                            _shareCertificate(context, cert),
                                        icon: Icon(
                                          Icons.download_rounded,
                                          color: palette.gold,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
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
