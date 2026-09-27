import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'package:aplikasi_haji_pintar/certificate_renderer.dart';
import 'package:aplikasi_haji_pintar/certificate_screen.dart';
import 'package:aplikasi_haji_pintar/home_dashboard.dart';
import 'package:aplikasi_haji_pintar/main.dart';
import 'package:aplikasi_haji_pintar/theme_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    final Directory dir = await Directory.systemTemp.createTemp('haji_pintar_test');
    Hive.init(dir.path);

    tawafBox = await Hive.openBox<dynamic>('test_tawaf_progress');
    saiBox = await Hive.openBox<dynamic>('test_sai_progress');
    settingsBox = await Hive.openBox<dynamic>('test_app_settings');
    guideBox = await Hive.openBox<dynamic>('test_guide_progress');
    assessmentBox = await Hive.openBox<dynamic>('test_assessment_progress');
    certificatesBox = await Hive.openBox<dynamic>('test_certificates');
  });

  tearDown(() async {
    await Hive.deleteBoxFromDisk('test_tawaf_progress');
    await Hive.deleteBoxFromDisk('test_sai_progress');
    await Hive.deleteBoxFromDisk('test_app_settings');
    await Hive.deleteBoxFromDisk('test_guide_progress');
    await Hive.deleteBoxFromDisk('test_assessment_progress');
    await Hive.deleteBoxFromDisk('test_certificates');
  });

  testWidgets('menunjukkan kad Simulasi Haji 3D pada dashboard', (WidgetTester tester) async {
    final ThemeController themeController = ThemeController(settingsBox);

    await tester.pumpWidget(
      MaterialApp(
        home: HalamanUtama(themeController: themeController),
      ),
    );

    expect(find.text('Simulasi Haji 3D'), findsOneWidget);
  });

  testWidgets('dashboard terus dipaparkan penuh bila animasi dikurangkan', (
    WidgetTester tester,
  ) async {
    final ThemeController themeController = ThemeController(settingsBox);

    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(disableAnimations: true),
          child: HalamanUtama(themeController: themeController),
        ),
      ),
    );

    final Iterable<FadeTransition> fades = tester.widgetList<FadeTransition>(
      find.descendant(
        of: find.byType(HalamanUtama),
        matching: find.byType(FadeTransition),
      ),
    );
    expect(fades, isNotEmpty);
    for (final FadeTransition fade in fades) {
      expect(fade.opacity.value, 1.0);
    }
  });

  testWidgets('sijil guna markah terbaik, bukan percubaan terakhir', (
    WidgetTester tester,
  ) async {
    // Hive writes real files; they must run outside the fake-async zone.
    await tester.runAsync(() async {
      await assessmentBox.putAll(<String, dynamic>{
        'passed': true,
        'best_score': 96,
        'achievement_level': 'TIDAK LULUS',
        'certificate_name': 'Aminah binti Ali',
        'certificate_number': 'HP-2026-0001',
      });
    });

    await tester.pumpWidget(
      MaterialApp(
        home: CertificateScreen(
          assessmentBox: assessmentBox,
          certificatesBox: certificatesBox,
          score: 60,
        ),
      ),
    );

    final CertificatePreview preview = tester.widget<CertificatePreview>(
      find.byType(CertificatePreview),
    );
    expect(preview.content.achievementLevel, 'CEMERLANG');
    expect(preview.content.name, 'Aminah binti Ali');
    expect(preview.content.certificateNumber, 'HP-2026-0001');
  });

  testWidgets('kad Akses Pantas diumumkan sebagai butang', (
    WidgetTester tester,
  ) async {
    final SemanticsHandle semantics = tester.ensureSemantics();
    final ThemeController themeController = ThemeController(settingsBox);

    await tester.pumpWidget(
      MaterialApp(home: HalamanUtama(themeController: themeController)),
    );
    await tester.pump(const Duration(seconds: 2));

    final SemanticsNode node = tester.getSemantics(
      find.text('Kaunter Tawaf').first,
    );
    SemanticsNode? current = node;
    bool isButton = false;
    while (current != null && !isButton) {
      isButton = current.getSemanticsData().flagsCollection.isButton;
      current = current.parent;
    }
    expect(isButton, isTrue);
    semantics.dispose();
  });
}
