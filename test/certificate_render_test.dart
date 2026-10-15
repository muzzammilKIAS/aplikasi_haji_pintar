import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:aplikasi_haji_pintar/certificate_renderer.dart';

// Set CERT_OUT to a folder to also write the rendered PNGs for inspection.
void main() {
  Future<void> loadFonts() async {
    const Map<String, List<String>> families = <String, List<String>>{
      'SourceSerif4': <String>[
        'SourceSerif4-SemiBold.ttf',
        'SourceSerif4-Bold.ttf',
      ],
      'Inter': <String>[
        'Inter-Regular.ttf',
        'Inter-Italic.ttf',
        'Inter-SemiBold.ttf',
      ],
      'Amiri': <String>['Amiri-Regular.ttf'],
    };
    for (final MapEntry<String, List<String>> family in families.entries) {
      final FontLoader loader = FontLoader(family.key);
      for (final String file in family.value) {
        loader.addFont(rootBundle.load('assets/fonts/$file'));
      }
      await loader.load();
    }
  }

  const List<CertificateContent> samples = <CertificateContent>[
    CertificateContent(
      name: 'Aminah binti Ali',
      achievementLevel: 'CEMERLANG',
      date: '3 Mac 2026',
      certificateNumber: 'HP-2026-0001',
      score: 100,
    ),
    CertificateContent(
      name: 'Ahmad Muzzammil bin Mohammad Najib al-Kelantani',
      achievementLevel: 'SANGAT BAIK',
      date: '27 September 2026',
      certificateNumber: 'HP-2026-1234567',
      score: 90,
    ),
    CertificateContent(
      name: 'Siti',
      achievementLevel: 'LULUS',
      date: '30 Disember 2026',
      certificateNumber: 'HP-2026-0042',
    ),
  ];

  testWidgets('sijil dijana sebagai PNG dan PDF', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await loadFonts();
      final String? out = Platform.environment['CERT_OUT'];
      for (int i = 0; i < samples.length; i++) {
        final Uint8List png = await renderCertificatePng(
          samples[i],
          pixelRatio: 1,
        );
        expect(png.sublist(1, 4), <int>[0x50, 0x4E, 0x47]);
        if (out != null) {
          File('$out/sijil_$i.png').writeAsBytesSync(png);
        }
      }
      final Uint8List pdf = await buildCertificatePdf(samples.first);
      expect(String.fromCharCodes(pdf.sublist(0, 5)), '%PDF-');
    });
  });
}
