import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

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
}
