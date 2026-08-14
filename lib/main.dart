import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'app_theme.dart';
import 'home_dashboard.dart';
import 'splash_screen.dart';
import 'theme_controller.dart';

// Kotak Hive global digunakan merentasi skrin (dashboard, kaunter Tawaf,
// kaunter Sa'i, modul belajar, penilaian, sijil, panduan Haji).
late Box<dynamic> tawafBox;
late Box<dynamic> saiBox;
late Box<dynamic> settingsBox;
late Box<dynamic> guideBox;
late Box<dynamic> assessmentBox;
late Box<dynamic> certificatesBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  tawafBox = await Hive.openBox<dynamic>('tawaf_progress');
  saiBox = await Hive.openBox<dynamic>('sai_progress');
  settingsBox = await Hive.openBox<dynamic>('app_settings');
  guideBox = await Hive.openBox<dynamic>('hajj_guide_progress');
  assessmentBox = await Hive.openBox<dynamic>('hajj_assessment_progress');
  certificatesBox = await Hive.openBox<dynamic>('hajj_certificates');

  final ThemeController themeController = ThemeController(settingsBox);

  runApp(AplikasiHajiPintar(themeController: themeController));
}

class AplikasiHajiPintar extends StatelessWidget {
  const AplikasiHajiPintar({required this.themeController, super.key});

  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'hajipintar',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeController.themeMode,
          home: _AppRoot(themeController: themeController),
        );
      },
    );
  }
}

class _AppRoot extends StatefulWidget {
  const _AppRoot({required this.themeController});

  final ThemeController themeController;

  @override
  State<_AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<_AppRoot> {
  bool _splashSelesai = false;

  @override
  Widget build(BuildContext context) {
    if (!_splashSelesai) {
      return SplashScreen(
        onComplete: () {
          setState(() {
            _splashSelesai = true;
          });
        },
      );
    }

    return HalamanUtama(themeController: widget.themeController);
  }
}
