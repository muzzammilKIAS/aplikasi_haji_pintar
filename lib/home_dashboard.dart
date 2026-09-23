import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijri/hijri_calendar.dart';

import 'app_theme.dart';
import 'final_assessment_screen.dart';
import 'hajj_guide_screen.dart';
import 'hajj_journey_viewer.dart';
import 'islamic_icons.dart';
import 'learning_module_screen.dart';
import 'main.dart';
import 'my_certificates_screen.dart';
import 'offline_map_screen.dart';
import 'sai_counter_screen.dart';
import 'shared_widgets.dart';
import 'tawaf_counter_screen.dart';
import 'theme_controller.dart';

Map<String, int> _tarikhMasihiKeHijrahTabular(DateTime tarikh) {
  final int jd =
      ((tarikh.millisecondsSinceEpoch / 86400000) + 2440587.5 + 0.5).floor();
  int l = jd - 1948440 + 10632;
  final int n = ((l - 1) / 10631).floor();
  l = l - 10631 * n + 354;
  final int j = (((10985 - l) / 5316).floor()) * (((50 * l) / 17719).floor()) +
      ((l / 5670).floor()) * (((43 * l) / 15238).floor());
  l = l -
      (((30 - j) / 15).floor()) * (((17719 * j) / 50).floor()) -
      ((j / 16).floor()) * (((15238 * j) / 43).floor()) +
      29;
  final int bulan = ((24 * l) / 709).floor();
  final int hari = l - ((709 * bulan) / 24).floor();
  final int tahun = 30 * n + j - 30;
  return <String, int>{'tahun': tahun, 'bulan': bulan, 'hari': hari};
}

int _hijrahKeJulianDay(int tahun, int bulan, int hari) {
  return ((11 * tahun + 3) / 30).floor() +
      354 * tahun +
      30 * bulan -
      ((bulan - 1) / 2).floor() +
      hari +
      1948440 -
      385;
}

DateTime _julianDayKeMasihi(int jd) {
  final DateTime utc = DateTime.fromMillisecondsSinceEpoch(
    ((jd - 2440587.5) * 86400000).round(),
    isUtc: true,
  );
  return DateTime(utc.year, utc.month, utc.day);
}

DateTime kiraTarikhWukufAkanDatang(DateTime sekarang) {
  final Map<String, int> hSekarang = _tarikhMasihiKeHijrahTabular(sekarang);
  int tahunHijrah = hSekarang['tahun']!;

  DateTime calonWukuf = _julianDayKeMasihi(
    _hijrahKeJulianDay(tahunHijrah, 12, 9),
  );

  final DateTime hariIni = DateTime(sekarang.year, sekarang.month, sekarang.day);

  if (calonWukuf.isBefore(hariIni)) {
    tahunHijrah += 1;
    calonWukuf = _julianDayKeMasihi(_hijrahKeJulianDay(tahunHijrah, 12, 9));
  }

  return calonWukuf;
}

String sapaanMengikutMasa() {
  final int jam = DateTime.now().hour;

  if (jam >= 5 && jam < 11) {
    return 'Selamat Pagi';
  }
  if (jam >= 11 && jam < 15) {
    return 'Selamat Tengah Hari';
  }
  if (jam >= 15 && jam < 19) {
    return 'Selamat Petang';
  }
  return 'Selamat Malam';
}

/// Palet biru elegan + aksen pelbagai warna (pelangi lembut) khusus untuk
/// papan pemuka. Berasingan daripada [HajjColors] sedia ada (zamrud/emas)
/// supaya skrin lain dalam aplikasi kekal tidak terjejas.
class _DashPalette {
  const _DashPalette({
    required this.bgTop,
    required this.bgMiddle,
    required this.bgBottom,
    required this.cardSurface,
    required this.cardBorder,
    required this.textPrimary,
    required this.textMuted,
    required this.shadow,
    required this.blue,
    required this.pink,
    required this.gold,
    required this.teal,
    required this.purple,
  });

  final Color bgTop;
  final Color bgMiddle;
  final Color bgBottom;
  final Color cardSurface;
  final Color cardBorder;
  final Color textPrimary;
  final Color textMuted;
  final Color shadow;

  // Aksen "pelangi" — dikongsi merentasi kad, carta bar, graf donut.
  final Color blue;
  final Color pink;
  final Color gold;
  final Color teal;
  final Color purple;

  List<Color> get rainbow => <Color>[blue, pink, gold, teal, purple];

  static const _DashPalette light = _DashPalette(
    bgTop: Color(0xFFBFE0FA),
    bgMiddle: Color(0xFFDCEEFB),
    bgBottom: Color(0xFFF3F9FE),
    cardSurface: Color(0xFFFFFFFF),
    cardBorder: Color(0xFFE1EDF8),
    textPrimary: Color(0xFF152A47),
    textMuted: Color(0xFF6C7E96),
    shadow: Color(0x1A1D4C8A),
    blue: Color(0xFF3E8BFF),
    pink: Color(0xFFFF6FA8),
    gold: Color(0xFFFFB648),
    teal: Color(0xFF2FC6B6),
    purple: Color(0xFF9B7BFF),
  );

  static const _DashPalette dark = _DashPalette(
    bgTop: Color(0xFF060B1A),
    bgMiddle: Color(0xFF0B1636),
    bgBottom: Color(0xFF060B1A),
    cardSurface: Color(0xFF121B3B),
    cardBorder: Color(0x26FFFFFF),
    textPrimary: Color(0xFFF2F6FF),
    textMuted: Color(0xFFA6B3D0),
    shadow: Color(0x66000B2E),
    blue: Color(0xFF6FA8FF),
    pink: Color(0xFFFF8FC5),
    gold: Color(0xFFFFC96B),
    teal: Color(0xFF4FE0CC),
    purple: Color(0xFFB79CFF),
  );

  static _DashPalette of(BuildContext context) {
    return context.isDarkMode ? dark : light;
  }
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({required this.themeController, super.key});

  final ThemeController themeController;

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama>
    with TickerProviderStateMixin {
  late final AnimationController _entranceController;
  late final AnimationController _breatheController;
  late final Animation<double> _breathe;

  /// Bina animasi fade + slide-up bagi satu bahagian dashboard, dengan
  /// selang masa (`start`-`end`) tersendiri supaya bahagian muncul
  /// berperingkat (staggered) dari atas ke bawah — bukan sekaligus statik.
  Animation<double> _fadeFor(double start, double end) {
    return CurvedAnimation(
      parent: _entranceController,
      curve: Interval(start, end, curve: Curves.easeOutCubic),
    );
  }

  @override
  void initState() {
    super.initState();
    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();

    _breatheController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3600),
    )..repeat(reverse: true);
    _breathe = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _breatheController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _entranceController.dispose();
    _breatheController.dispose();
    super.dispose();
  }

  Widget _staggered(Widget child, double start, double end) {
    final Animation<double> fade = _fadeFor(start, end);
    return FadeTransition(
      opacity: fade,
      child: AnimatedBuilder(
        animation: fade,
        builder: (BuildContext context, Widget? innerChild) {
          return Transform.translate(
            offset: Offset(0, (1 - fade.value) * 18),
            child: innerChild,
          );
        },
        child: child,
      ),
    );
  }

  void _bukaTawaf(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => TawafCounterScreen(tawafBox: tawafBox),
      ),
    );
  }

  void _bukaModulBelajar(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) {
          return LearningModuleScreen(
            assessmentBox: assessmentBox,
            certificatesBox: certificatesBox,
          );
        },
      ),
    );
  }

  void _bukaModulBelajarUmrah(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => const UmrahLearningModuleScreen(),
      ),
    );
  }

  void _bukaPenilaianAkhir(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) {
          return FinalAssessmentScreen(
            assessmentBox: assessmentBox,
            certificatesBox: certificatesBox,
          );
        },
      ),
    );
  }

  void _bukaSijilSaya(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) {
          return MyCertificatesScreen(
            certificatesBox: certificatesBox,
            assessmentBox: assessmentBox,
          );
        },
      ),
    );
  }

  void _bukaPanduanHaji(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) {
          return HajjGuideScreen(guideBox: guideBox);
        },
      ),
    );
  }

  void _bukaPanduanUmrah(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) {
          return UmrahGuideScreen(guideBox: guideBox);
        },
      ),
    );
  }

  void _bukaPeta(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => const OfflineMapScreen(),
      ),
    );
  }

  void _bukaSimulasiHaji3D(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => const HajjJourneyViewer(),
      ),
    );
  }

  void _bukaSai(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => SaiCounterScreen(saiBox: saiBox),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _DashPalette palette = _DashPalette.of(context);

    // Data sebenar diambil terus daripada kotak Hive sedia ada supaya
    // dashboard mencerminkan kemajuan ibadah/pembelajaran yang benar.
    final int tawafRounds = (tawafBox.get(
              TawafCounterScreen.storageKey,
              defaultValue: 0,
            )
            as int)
        .clamp(0, TawafCounterScreen.totalRounds);
    final int saiTrips = (saiBox.get(
              SaiCounterScreen.storageKey,
              defaultValue: 0,
            )
            as int)
        .clamp(0, SaiCounterScreen.totalTrips);

    final dynamic savedGuideSteps = guideBox.get(
      HajjGuideScreen.storageKey,
      defaultValue: <int>[],
    );
    final int guideCompleted = savedGuideSteps is List<dynamic>
        ? savedGuideSteps.length
        : 0;
    final int guideTotal = HajjGuideScreen.totalSteps;

    final dynamic savedUmrahSteps = guideBox.get(
      UmrahGuideScreen.storageKey,
      defaultValue: <int>[],
    );
    final int umrahCompleted = savedUmrahSteps is List<dynamic>
        ? savedUmrahSteps.length
        : 0;
    final int umrahTotal = UmrahGuideScreen.totalSteps;

    final dynamic savedBestScore = assessmentBox.get(
      'best_score',
      defaultValue: 0,
    );
    final int bestScore = savedBestScore is int ? savedBestScore : 0;
    final bool passedAssessment =
        assessmentBox.get('passed', defaultValue: false) == true;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 320),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[palette.bgTop, palette.bgMiddle, palette.bgBottom],
          ),
        ),
        child: Stack(
          children: <Widget>[
            const IslamicPatternOverlay(),
            AnimatedBuilder(
              animation: _breatheController,
              builder: (BuildContext context, Widget? child) {
                final double breathe = _breathe.value;
                return Stack(
                  children: <Widget>[
                    Positioned(
                      top: -130 + breathe * 14,
                      right: -100 - breathe * 10,
                      child: GlowCircle(
                        size: 320 + breathe * 18,
                        color: palette.blue.withValues(
                          alpha: 0.16 + breathe * 0.06,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 140 - breathe * 10,
                      left: -120 + breathe * 14,
                      child: GlowCircle(
                        size: 260,
                        color: palette.purple.withValues(
                          alpha: 0.10 + breathe * 0.05,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -180 + breathe * 16,
                      left: -100 + breathe * 12,
                      child: GlowCircle(
                        size: 360 - breathe * 20,
                        color: palette.pink.withValues(
                          alpha: 0.10 + breathe * 0.05,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 60 - breathe * 10,
                      right: -80 - breathe * 10,
                      child: GlowCircle(
                        size: 240,
                        color: palette.teal.withValues(
                          alpha: 0.10 + breathe * 0.05,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 44),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1180),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _staggered(
                          _DashHeader(themeController: widget.themeController),
                          0.00,
                          0.45,
                        ),
                        const SizedBox(height: 22),
                        _staggered(const _DashGreeting(), 0.04, 0.50),
                        const SizedBox(height: 16),
                        _staggered(const _DateCountdownStrip(), 0.06, 0.52),
                        const SizedBox(height: 22),
                        _staggered(
                          LayoutBuilder(
                            builder: (BuildContext context, BoxConstraints constraints) {
                              final bool stack = constraints.maxWidth < 560;
                              final List<Widget> charts = <Widget>[
                                _StatBarCard(
                                  title: 'Tawaf',
                                  subtitle: 'Pusingan mengelilingi Kaabah',
                                  icon: HajjIconType.tawaf,
                                  accent: palette.blue,
                                  completed: tawafRounds,
                                  total: TawafCounterScreen.totalRounds,
                                  palette: palette,
                                ),
                                SizedBox(width: stack ? 0 : 16, height: stack ? 16 : 0),
                                _StatBarCard(
                                  title: 'Sa’i',
                                  subtitle: 'Perjalanan Safa — Marwah',
                                  icon: HajjIconType.sai,
                                  accent: palette.pink,
                                  completed: saiTrips,
                                  total: SaiCounterScreen.totalTrips,
                                  palette: palette,
                                ),
                              ];

                              if (stack) {
                                return Column(children: charts);
                              }
                              return Row(
                                children: <Widget>[
                                  Expanded(child: charts[0]),
                                  charts[1],
                                  Expanded(child: charts[2]),
                                ],
                              );
                            },
                          ),
                          0.08,
                          0.55,
                        ),
                        const SizedBox(height: 22),
                        _staggered(
                          _PromoJourneyBanner(
                            palette: palette,
                            completed: guideCompleted,
                            total: guideTotal,
                            onTap: () => _bukaPanduanHaji(context),
                          ),
                          0.12,
                          0.62,
                        ),
                        const SizedBox(height: 30),
                        _staggered(
                          _DashSectionTitle(
                            title: 'Akses Pantas',
                            palette: palette,
                          ),
                          0.16,
                          0.66,
                        ),
                        const SizedBox(height: 14),
                        _staggered(
                          LayoutBuilder(
                            builder: (BuildContext context, BoxConstraints constraints) {
                              return _buildFeatureGrid(
                                context,
                                constraints.maxWidth,
                                palette,
                              );
                            },
                          ),
                          0.20,
                          0.72,
                        ),
                        const SizedBox(height: 30),
                        _staggered(
                          _DashSectionTitle(
                            title: 'Kemajuan Keseluruhan',
                            palette: palette,
                          ),
                          0.26,
                          0.80,
                        ),
                        const SizedBox(height: 14),
                        _staggered(
                          LayoutBuilder(
                            builder: (BuildContext context, BoxConstraints constraints) {
                              final bool stack = constraints.maxWidth < 760;

                              final Widget donut = _CategoryDonutCard(
                                palette: palette,
                                guidePct: guideTotal == 0
                                    ? 0
                                    : (guideCompleted / guideTotal * 100),
                                ibadahPct:
                                    ((tawafRounds / TawafCounterScreen.totalRounds) +
                                            (saiTrips / SaiCounterScreen.totalTrips)) /
                                        2 *
                                        100,
                                pembelajaranPct: passedAssessment
                                    ? 100
                                    : bestScore.toDouble(),
                              );

                              final Widget activity = _RecentActivityCard(
                                palette: palette,
                                guideCompleted: guideCompleted,
                                guideTotal: guideTotal,
                                umrahCompleted: umrahCompleted,
                                umrahTotal: umrahTotal,
                                tawafRounds: tawafRounds,
                                saiTrips: saiTrips,
                                bestScore: bestScore,
                                passedAssessment: passedAssessment,
                                onTapCertificate: () => _bukaSijilSaya(context),
                                onTapHajjGuide: () =>
                                    _bukaPanduanHaji(context),
                                onTapUmrahGuide: () =>
                                    _bukaPanduanUmrah(context),
                                onTapAssessment: () =>
                                    _bukaPenilaianAkhir(context),
                              );

                              if (stack) {
                                return Column(
                                  children: <Widget>[
                                    donut,
                                    const SizedBox(height: 16),
                                    activity,
                                  ],
                                );
                              }

                              // IntrinsicHeight + stretch supaya kad
                              // "Statistik Ibadah" dan "Aktiviti Terkini"
                              // sentiasa sama tinggi, tidak kira mana satu
                              // mempunyai lebih banyak kandungan.
                              return IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Expanded(flex: 4, child: donut),
                                    const SizedBox(width: 16),
                                    Expanded(flex: 6, child: activity),
                                  ],
                                ),
                              );
                            },
                          ),
                          0.32,
                          0.92,
                        ),
                        const SizedBox(height: 44),
                        _staggered(
                          Center(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 46,
                                  height: 1,
                                  color: palette.blue.withValues(alpha: 0.30),
                                ),
                                const SizedBox(height: 14),
                                Text(
                                  '© Muzzammil Najib',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: palette.textMuted.withValues(alpha: 0.85),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.4,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Versi BETA • Kemas kini akan menyusul.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: palette.textMuted.withValues(alpha: 0.65),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          0.40,
                          1.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureGrid(
    BuildContext context,
    double width,
    _DashPalette palette,
  ) {
    int columns;
    if (width >= 768) {
      columns = 3;
    } else if (width >= 360) {
      columns = 2;
    } else {
      columns = 1;
    }

    const double spacing = 16;
    final double cardWidth = (width - spacing * (columns - 1)) / columns;

    final List<_FeatureData> features = <_FeatureData>[
      _FeatureData(
        title: 'Kaunter Tawaf',
        description: 'Rekod tujuh pusingan dengan paparan kemajuan.',
        icon: HajjIconType.tawaf,
        accent: palette.blue,
        onTap: () => _bukaTawaf(context),
      ),
      _FeatureData(
        title: 'Kaunter Sa’i',
        description: 'Panduan perjalanan antara Safa dan Marwah.',
        icon: HajjIconType.sai,
        accent: palette.pink,
        onTap: () => _bukaSai(context),
      ),
      _FeatureData(
        title: 'Peta Offline',
        description: 'Akses peta Mina dan Arafah tanpa internet.',
        icon: HajjIconType.map,
        accent: palette.teal,
        onTap: () => _bukaPeta(context),
      ),
      _FeatureData(
        title: 'Simulasi Haji 3D',
        description: 'Imbas perjalanan ibadah dari miqat hingga wada’ dengan zoom interaktif.',
        icon: HajjIconType.kaaba,
        accent: palette.gold,
        onTap: () => _bukaSimulasiHaji3D(context),
      ),
      _FeatureData(
        title: 'Modul Belajar',
        description: 'Asas, rukun, wajib, larangan ihram, dam dan doa.',
        icon: HajjIconType.learning,
        accent: palette.purple,
        onTap: () => _bukaModulBelajar(context),
      ),
      _FeatureData(
        title: 'Panduan Haji',
        description: 'Ikuti langkah demi langkah dari persediaan hingga Wada’.',
        icon: HajjIconType.guide,
        accent: palette.gold,
        onTap: () => _bukaPanduanHaji(context),
      ),
      _FeatureData(
        title: 'Panduan Umrah',
        description: 'Silibus Umrah — Ihram, Tawaf, Sa’i hingga Tahallul.',
        icon: HajjIconType.umrahJourney,
        accent: palette.blue,
        onTap: () => _bukaPanduanUmrah(context),
      ),
      _FeatureData(
        title: 'Modul Belajar Umrah',
        description: 'Asas, rukun, wajib, larangan ihram dan doa Umrah.',
        icon: HajjIconType.doa,
        accent: palette.teal,
        onTap: () => _bukaModulBelajarUmrah(context),
      ),
    ];

    return Wrap(
      spacing: spacing,
      runSpacing: spacing,
      children: features.map((_FeatureData feature) {
        return SizedBox(
          width: cardWidth,
          child: _FeatureCard(data: feature, palette: palette),
        );
      }).toList(),
    );
  }
}

/// Header papan pemuka: ikon aplikasi, tajuk, dan togol tema — diwarnakan
/// mengikut palet biru dashboard.
class _DashHeader extends StatelessWidget {
  const _DashHeader({required this.themeController});

  final ThemeController themeController;

  Future<void> _bukaPilihanTheme(BuildContext context) async {
    final HajjColors palette = context.hajjColors;

    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      backgroundColor: context.appColorScheme.surface,
      builder: (BuildContext sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Tema Paparan',
                  style: Theme.of(sheetContext).textTheme.titleLarge,
                ),
                const SizedBox(height: 6),
                Text(
                  'Pilih tema yang paling selesa.',
                  style: TextStyle(color: palette.mutedText),
                ),
                const SizedBox(height: 16),
                ThemeModeTile(
                  title: 'Ikut Peranti',
                  subtitle: 'Mengikut tetapan telefon atau komputer.',
                  icon: Icons.brightness_auto_rounded,
                  value: ThemeMode.system,
                  groupValue: themeController.themeMode,
                  onChanged: (ThemeMode mode) async {
                    await themeController.setThemeMode(mode);

                    if (sheetContext.mounted) {
                      Navigator.of(sheetContext).pop();
                    }
                  },
                ),
                ThemeModeTile(
                  title: 'Light Mode',
                  subtitle: 'Paparan biru lembut yang elegan.',
                  icon: Icons.light_mode_rounded,
                  value: ThemeMode.light,
                  groupValue: themeController.themeMode,
                  onChanged: (ThemeMode mode) async {
                    await themeController.setThemeMode(mode);

                    if (sheetContext.mounted) {
                      Navigator.of(sheetContext).pop();
                    }
                  },
                ),
                ThemeModeTile(
                  title: 'Dark Mode',
                  subtitle: 'Paparan navy gelap yang redup.',
                  icon: Icons.dark_mode_rounded,
                  value: ThemeMode.dark,
                  groupValue: themeController.themeMode,
                  onChanged: (ThemeMode mode) async {
                    await themeController.setThemeMode(mode);

                    if (sheetContext.mounted) {
                      Navigator.of(sheetContext).pop();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _DashPalette palette = _DashPalette.of(context);

    return Row(
      children: <Widget>[
        Container(
          width: 46,
          height: 46,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: palette.cardSurface,
            border: Border.all(color: palette.blue.withValues(alpha: 0.35)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: palette.blue.withValues(alpha: 0.20),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Image.asset(
            'assets/images/app_icon.png',
            fit: BoxFit.contain,
            alignment: Alignment.center,
          ),
        ),
        const SizedBox(width: 13),
        Expanded(
          child: Text(
            'HAJI PINTAR',
            style: GoogleFonts.playfairDisplay(
              color: palette.textPrimary,
              fontSize: 19,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.6,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: palette.cardSurface,
            border: Border.all(color: palette.cardBorder),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: palette.shadow,
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: IconButton(
            tooltip: 'Tukar tema',
            color: palette.blue,
            onPressed: () => _bukaPilihanTheme(context),
            icon: Icon(
              themeController.themeMode == ThemeMode.dark
                  ? Icons.dark_mode_rounded
                  : themeController.themeMode == ThemeMode.light
                  ? Icons.light_mode_rounded
                  : Icons.brightness_auto_rounded,
            ),
          ),
        ),
      ],
    );
  }
}

/// Sapaan ringkas ("Assalamualaikum" + sapaan mengikut waktu).
class _DashGreeting extends StatelessWidget {
  const _DashGreeting();

  @override
  Widget build(BuildContext context) {
    final _DashPalette palette = _DashPalette.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Assalamualaikum,',
          style: GoogleFonts.playfairDisplay(
            color: palette.blue,
            fontSize: 17,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          sapaanMengikutMasa(),
          style: GoogleFonts.playfairDisplay(
            color: palette.textPrimary,
            fontSize: 30,
            height: 1.15,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }
}

/// Jalur padat memaparkan tarikh Masihi/Hijrah semasa dan anggaran baki
/// hari menuju Wukuf di Arafah akan datang.
class _DateCountdownStrip extends StatefulWidget {
  const _DateCountdownStrip();

  @override
  State<_DateCountdownStrip> createState() => _DateCountdownStripState();
}

class _DateCountdownStripState extends State<_DateCountdownStrip> {
  late Timer _timer;
  late DateTime _now;
  late HijriCalendar _hijriNow;
  late DateTime _targetHajj;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _targetHajj = kiraTarikhWukufAkanDatang(_now);

    HijriCalendar.addLocale('ms', <String, Map<int, String>>{
      'long': <int, String>{
        1: 'Muharram',
        2: 'Safar',
        3: 'Rabiulawal',
        4: 'Rabiulakhir',
        5: 'Jamadilawal',
        6: 'Jamadilakhir',
        7: 'Rejab',
        8: 'Syaaban',
        9: 'Ramadan',
        10: 'Syawal',
        11: 'Zulkaedah',
        12: 'Zulhijjah',
      },
      'short': <int, String>{
        1: 'Muh',
        2: 'Saf',
        3: 'Raw',
        4: 'Rak',
        5: 'Jaw',
        6: 'Jak',
        7: 'Rej',
        8: 'Sya',
        9: 'Ram',
        10: 'Syw',
        11: 'Zkd',
        12: 'Zhj',
      },
      'days': <int, String>{
        1: 'Isnin',
        2: 'Selasa',
        3: 'Rabu',
        4: 'Khamis',
        5: 'Jumaat',
        6: 'Sabtu',
        7: 'Ahad',
      },
      'short_days': <int, String>{
        1: 'Isn',
        2: 'Sel',
        3: 'Rab',
        4: 'Kha',
        5: 'Jum',
        6: 'Sab',
        7: 'Ahd',
      },
    });

    HijriCalendar.setLocal('ms');
    _hijriNow = HijriCalendar.now();

    _timer = Timer.periodic(const Duration(minutes: 1), (Timer timer) {
      if (mounted) {
        setState(() {
          _now = DateTime.now();
          _hijriNow = HijriCalendar.now();

          final DateTime tarikhSemasa = DateTime(_now.year, _now.month, _now.day);
          final DateTime tarikhSasaran = DateTime(
            _targetHajj.year,
            _targetHajj.month,
            _targetHajj.day,
          );

          if (!tarikhSasaran.isAfter(tarikhSemasa)) {
            _targetHajj = kiraTarikhWukufAkanDatang(_now);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTarikhPenuhMasihi(DateTime masa) {
    const List<String> bulan = <String>[
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
    return '${masa.day} ${bulan[masa.month - 1]} ${masa.year}';
  }

  @override
  Widget build(BuildContext context) {
    final _DashPalette palette = _DashPalette.of(context);

    final DateTime tarikhSemasa = DateTime(_now.year, _now.month, _now.day);
    final DateTime tarikhSasaran = DateTime(
      _targetHajj.year,
      _targetHajj.month,
      _targetHajj.day,
    );
    final int bakiHari = tarikhSasaran.difference(tarikhSemasa).inDays;

    return _DashCard(
      palette: palette,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool compact = constraints.maxWidth < 420;

          final Widget tarikhPanel = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                _formatTarikhPenuhMasihi(_now),
                style: TextStyle(
                  color: palette.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '${_hijriNow.hDay} ${_hijriNow.getLongMonthName()} ${_hijriNow.hYear}H',
                style: TextStyle(
                  color: palette.textMuted,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );

          final Widget countdown = Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: palette.gold.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: palette.gold.withValues(alpha: 0.30)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.hourglass_bottom_rounded, size: 15, color: palette.gold),
                const SizedBox(width: 7),
                Text(
                  '$bakiHari hari ke Wukuf',
                  style: TextStyle(
                    color: palette.gold,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          );

          if (compact) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                tarikhPanel,
                const SizedBox(height: 10),
                countdown,
              ],
            );
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[tarikhPanel, countdown],
          );
        },
      ),
    );
  }
}

class _DashSectionTitle extends StatelessWidget {
  const _DashSectionTitle({required this.title, required this.palette});

  final String title;
  final _DashPalette palette;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.playfairDisplay(
        color: palette.textPrimary,
        fontSize: 21,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.2,
      ),
    );
  }
}

/// Kad "glass" ringkas mengikut palet biru dashboard — pengganti tempatan
/// untuk [GlassContainer] (yang terikat kepada [HajjColors] zamrud/emas).
class _DashCard extends StatelessWidget {
  const _DashCard({
    required this.child,
    required this.palette,
    this.borderRadius = 24,
    this.padding = const EdgeInsets.all(20),
    this.borderColor,
    this.borderWidth = 1,
    this.boxShadow,
  });

  final Widget child;
  final _DashPalette palette;
  final double borderRadius;
  final EdgeInsets padding;
  final Color? borderColor;
  final double borderWidth;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: palette.cardSurface,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor ?? palette.cardBorder,
          width: borderWidth,
        ),
        boxShadow: boxShadow ??
            <BoxShadow>[
              BoxShadow(
                color: palette.shadow,
                blurRadius: 26,
                offset: const Offset(0, 12),
              ),
            ],
      ),
      child: child,
    );
  }
}

/// Kad statistik dengan carta bar mini (gaya "Expense/Income" pada
/// dashboard kewangan), digunakan bagi Tawaf dan Sa'i — setiap bar
/// mewakili satu pusingan/perjalanan, terisi jika sudah selesai.
class _StatBarCard extends StatelessWidget {
  const _StatBarCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accent,
    required this.completed,
    required this.total,
    required this.palette,
  });

  final String title;
  final String subtitle;
  final HajjIconType icon;
  final Color accent;
  final int completed;
  final int total;
  final _DashPalette palette;

  @override
  Widget build(BuildContext context) {
    return _DashCard(
      palette: palette,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: HajjIcon(type: icon, color: accent, size: 20),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        color: palette.textPrimary,
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: palette.textMuted,
                        fontSize: 11,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '$completed/$total',
            style: TextStyle(
              color: palette.textPrimary,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 70,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List<Widget>.generate(total, (int index) {
                final bool done = index < completed;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0, end: done ? 1 : 0.22),
                      duration: Duration(milliseconds: 500 + index * 60),
                      curve: Curves.easeOutCubic,
                      builder: (BuildContext context, double value, _) {
                        return FractionallySizedBox(
                          heightFactor: value.clamp(0.05, 1.0),
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              color: done
                                  ? accent
                                  : accent.withValues(alpha: 0.16),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

/// Banner promosi/CTA berwarna gradien pelangi lembut, mengajak pengguna
/// membuka/menyambung Panduan Haji — dilengkapi bar kemajuan sebenar.
class _PromoJourneyBanner extends StatelessWidget {
  const _PromoJourneyBanner({
    required this.palette,
    required this.completed,
    required this.total,
    required this.onTap,
  });

  final _DashPalette palette;
  final int completed;
  final int total;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final double progress = total == 0 ? 0 : (completed / total).clamp(0.0, 1.0);
    final bool belumMula = completed == 0;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(26),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                palette.blue,
                palette.purple,
              ],
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: palette.blue.withValues(alpha: 0.35),
                blurRadius: 30,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      belumMula ? 'Mula Panduan Haji' : 'Sambung Panduan Haji',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Ikuti $total langkah dari persediaan hingga Tawaf Wada’, '
                      'diselaraskan dengan kitab al-Idah karangan Imam an-Nawawi.',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.88),
                        fontSize: 12.5,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0, end: progress),
                        duration: const Duration(milliseconds: 900),
                        curve: Curves.easeOutCubic,
                        builder: (BuildContext context, double value, _) {
                          return LinearProgressIndicator(
                            value: value,
                            minHeight: 7,
                            backgroundColor: Colors.white.withValues(alpha: 0.22),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '$completed / $total langkah selesai',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.82),
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: palette.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureData {
  const _FeatureData({
    required this.title,
    required this.description,
    required this.icon,
    required this.accent,
    required this.onTap,
  });

  final String title;
  final String description;
  final HajjIconType icon;
  final Color accent;
  final VoidCallback onTap;
}

class _FeatureCard extends StatefulWidget {
  const _FeatureCard({required this.data, required this.palette});

  final _FeatureData data;
  final _DashPalette palette;

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final Color accent = widget.data.accent;
    final _DashPalette palette = widget.palette;
    final bool isDark = context.isDarkMode;
    final bool goldHover = hovering && isDark;

    final Color borderColor = goldHover
        ? palette.gold.withValues(alpha: 0.85)
        : hovering
        ? accent.withValues(alpha: 0.5)
        : palette.cardBorder;

    final List<BoxShadow> shadow = goldHover
        ? <BoxShadow>[
            BoxShadow(
              color: palette.gold.withValues(alpha: 0.22),
              blurRadius: 30,
              offset: const Offset(0, 10),
              spreadRadius: 2,
            ),
          ]
        : <BoxShadow>[
            BoxShadow(
              color: palette.shadow,
              blurRadius: 26,
              offset: const Offset(0, 12),
            ),
          ];

    return MouseRegion(
      onEnter: (_) {
        setState(() { hovering = true; });
      },
      onExit: (_) {
        setState(() { hovering = false; });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform: Matrix4.translationValues(0, hovering ? -4 : 0, 0),
        child: _DashCard(
          palette: palette,
          borderRadius: 22,
          padding: EdgeInsets.zero,
          borderColor: borderColor,
          borderWidth: goldHover ? 1.4 : 1,
          boxShadow: shadow,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Stack(
              children: <Widget>[
                // Motif bintang lapan penjuru di bucu kad, sedikit
                // melimpah keluar supaya kelihatan semula jadi dipotong
                // oleh bucu bulat kad — menjadikan kad lebih "hidup".
                Positioned(
                  top: -22,
                  right: -22,
                  child: IslamicCornerMotif(
                    color: accent.withValues(alpha: 0.22),
                    size: 92,
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(22),
                    onTap: widget.data.onTap,
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      // Tinggi tetap supaya semua kad akses pantas sama
                      // besar tanpa mengira panjang teks penerangan.
                      child: SizedBox(
                        height: 158,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 46,
                              height: 46,
                              decoration: BoxDecoration(
                                color: accent.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: HajjIcon(
                                type: widget.data.icon,
                                color: accent,
                                size: 26,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              widget.data.title,
                              style: GoogleFonts.playfairDisplay(
                                color: palette.textPrimary,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Expanded(
                              child: Text(
                                widget.data.description,
                                style: TextStyle(
                                  color: palette.textMuted,
                                  fontSize: 12.5,
                                  height: 1.4,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Segmen data untuk carta donat berbilang warna.
class _DonutSegment {
  const _DonutSegment({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final double value;
  final Color color;
}

/// Carta donat pelbagai warna (gaya "Statistics by category") memaparkan
/// komposisi kemajuan keseluruhan: Panduan, Ibadah (Tawaf+Sa'i), dan
/// Pembelajaran (markah penilaian).
class _CategoryDonutCard extends StatelessWidget {
  const _CategoryDonutCard({
    required this.palette,
    required this.guidePct,
    required this.ibadahPct,
    required this.pembelajaranPct,
  });

  final _DashPalette palette;
  final double guidePct;
  final double ibadahPct;
  final double pembelajaranPct;

  @override
  Widget build(BuildContext context) {
    final List<_DonutSegment> segments = <_DonutSegment>[
      _DonutSegment(label: 'Panduan Haji', value: guidePct, color: palette.blue),
      _DonutSegment(label: 'Ibadah (Tawaf/Sa’i)', value: ibadahPct, color: palette.pink),
      _DonutSegment(
        label: 'Pembelajaran',
        value: pembelajaranPct,
        color: palette.gold,
      ),
    ];

    final double total = segments.fold<double>(0, (double sum, _DonutSegment s) => sum + s.value);
    final int overallPct = total == 0 ? 0 : (total / segments.length).round();

    return _DashCard(
      palette: palette,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Statistik Ibadah',
            style: TextStyle(
              color: palette.textPrimary,
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 18),
          Center(
            child: SizedBox(
              width: 168,
              height: 168,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeOutCubic,
                builder: (BuildContext context, double t, _) {
                  return Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CustomPaint(
                        size: const Size(168, 168),
                        painter: _DonutPainter(
                          segments: segments,
                          progress: t,
                          trackColor: palette.cardBorder,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            '${(overallPct * t).round()}%',
                            style: TextStyle(
                              color: palette.textPrimary,
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            'keseluruhan',
                            style: TextStyle(
                              color: palette.textMuted,
                              fontSize: 10.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 18),
          ...segments.map((_DonutSegment segment) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      color: segment.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 9),
                  Expanded(
                    child: Text(
                      '${segment.label} — ${segment.value.round()}%',
                      style: TextStyle(
                        color: palette.textPrimary,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

/// Melukis carta donat berbilang segmen dengan lorekan bulat (round cap),
/// masing-masing warna berlainan (biru/merah jambu/emas) di atas trek kelabu.
class _DonutPainter extends CustomPainter {
  _DonutPainter({
    required this.segments,
    required this.progress,
    required this.trackColor,
  });

  final List<_DonutSegment> segments;
  final double progress;
  final Color trackColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 2 - 10;
    final Rect rect = Rect.fromCircle(center: center, radius: radius);

    final Paint track = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(rect, 0, 2 * math.pi, false, track);

    final double total = segments.fold<double>(
      0,
      (double sum, _DonutSegment s) => sum + s.value.clamp(0, 100),
    );

    if (total <= 0) {
      return;
    }

    double startAngle = -math.pi / 2;
    const double gap = 0.045;

    for (final _DonutSegment segment in segments) {
      final double fraction = segment.value.clamp(0, 100) / total;
      final double sweep = (fraction * 2 * math.pi * progress) - gap;
      if (sweep <= 0) {
        startAngle += fraction * 2 * math.pi;
        continue;
      }

      final Paint arcPaint = Paint()
        ..color = segment.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 16
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(rect, startAngle, sweep, false, arcPaint);
      startAngle += fraction * 2 * math.pi;
    }
  }

  @override
  bool shouldRepaint(covariant _DonutPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.segments != segments;
  }
}

/// Senarai aktiviti terkini (gaya "Latest transactions") — memaparkan
/// status Panduan Haji, Tawaf, Sa'i dan Penilaian Akhir dalam satu senarai.
class _RecentActivityCard extends StatelessWidget {
  const _RecentActivityCard({
    required this.palette,
    required this.guideCompleted,
    required this.guideTotal,
    required this.umrahCompleted,
    required this.umrahTotal,
    required this.tawafRounds,
    required this.saiTrips,
    required this.bestScore,
    required this.passedAssessment,
    required this.onTapCertificate,
    required this.onTapHajjGuide,
    required this.onTapUmrahGuide,
    required this.onTapAssessment,
  });

  final _DashPalette palette;
  final int guideCompleted;
  final int guideTotal;
  final int umrahCompleted;
  final int umrahTotal;
  final int tawafRounds;
  final int saiTrips;
  final int bestScore;
  final bool passedAssessment;
  final VoidCallback onTapCertificate;
  final VoidCallback onTapHajjGuide;
  final VoidCallback onTapUmrahGuide;
  final VoidCallback onTapAssessment;

  @override
  Widget build(BuildContext context) {
    final List<_ActivityRow> rows = <_ActivityRow>[
      _ActivityRow(
        icon: HajjIconType.guide,
        color: palette.blue,
        title: 'Panduan Haji',
        subtitle: '$guideCompleted daripada $guideTotal langkah selesai',
        trailing: guideTotal == 0
            ? '0%'
            : '${(guideCompleted / guideTotal * 100).round()}%',
        onTap: onTapHajjGuide,
      ),
      _ActivityRow(
        icon: HajjIconType.umrahJourney,
        color: palette.purple,
        title: 'Panduan Umrah',
        subtitle: '$umrahCompleted daripada $umrahTotal langkah selesai',
        trailing: umrahTotal == 0
            ? '0%'
            : '${(umrahCompleted / umrahTotal * 100).round()}%',
        onTap: onTapUmrahGuide,
      ),
      _ActivityRow(
        icon: HajjIconType.tawaf,
        color: palette.pink,
        title: 'Kaunter Tawaf',
        subtitle: '$tawafRounds daripada ${TawafCounterScreen.totalRounds} pusingan',
        trailing: tawafRounds >= TawafCounterScreen.totalRounds
            ? 'Selesai'
            : '$tawafRounds/${TawafCounterScreen.totalRounds}',
      ),
      _ActivityRow(
        icon: HajjIconType.sai,
        color: palette.teal,
        title: 'Kaunter Sa’i',
        subtitle: '$saiTrips daripada ${SaiCounterScreen.totalTrips} perjalanan',
        trailing: saiTrips >= SaiCounterScreen.totalTrips
            ? 'Selesai'
            : '$saiTrips/${SaiCounterScreen.totalTrips}',
      ),
      _ActivityRow(
        icon: HajjIconType.quiz,
        color: palette.gold,
        title: passedAssessment ? 'Sijil Saya' : 'Penilaian Akhir',
        subtitle: passedAssessment
            ? 'Anda layak menerima sijil pencapaian'
            : 'Markah terbaik: $bestScore% (lulus 80%)',
        trailing: passedAssessment ? 'Lihat' : 'Cuba',
        onTap: passedAssessment ? onTapCertificate : onTapAssessment,
      ),
    ];

    return _DashCard(
      palette: palette,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Aktiviti Terkini',
            style: TextStyle(
              color: palette.textPrimary,
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 16),
          ...rows.map((_ActivityRow row) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: row.onTap,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: row.color.withValues(alpha: 0.12),
                          shape: BoxShape.circle,
                        ),
                        child: HajjIcon(type: row.icon, color: row.color, size: 21),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              row.title,
                              style: TextStyle(
                                color: palette.textPrimary,
                                fontWeight: FontWeight.w700,
                                fontSize: 13.5,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              row.subtitle,
                              style: TextStyle(
                                color: palette.textMuted,
                                fontSize: 11.5,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        row.trailing,
                        style: TextStyle(
                          color: row.color,
                          fontWeight: FontWeight.w800,
                          fontSize: 12.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _ActivityRow {
  const _ActivityRow({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.trailing,
    this.onTap,
  });

  final HajjIconType icon;
  final Color color;
  final String title;
  final String subtitle;
  final String trailing;
  final VoidCallback? onTap;
}

class ThemeModeTile extends StatelessWidget {
  const ThemeModeTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    super.key,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final ThemeMode value;
  final ThemeMode groupValue;
  final ValueChanged<ThemeMode> onChanged;

  @override
  Widget build(BuildContext context) {
    final bool selected = value == groupValue;
    final HajjColors palette = context.hajjColors;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onChanged(value),
          borderRadius: BorderRadius.circular(18),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: selected
                  ? palette.emerald.withValues(alpha: 0.10)
                  : palette.glassSurface,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: selected
                    ? palette.emerald.withValues(alpha: 0.40)
                    : palette.glassBorder,
              ),
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  icon,
                  color: selected ? palette.emerald : palette.mutedText,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          color: context.appColorScheme.onSurface,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: palette.mutedText,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  selected ? Icons.check_circle_rounded : Icons.circle_outlined,
                  color: selected ? palette.emerald : palette.mutedText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
