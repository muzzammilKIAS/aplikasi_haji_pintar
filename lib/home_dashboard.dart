import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'app_theme.dart';
import 'final_assessment_screen.dart';
import 'hajj_guide_screen.dart';
import 'hajj_journey_viewer.dart';
import 'islamic_icons.dart';
import 'learning_module_screen.dart';
import 'main.dart';
import 'my_certificates_screen.dart';
import 'offline_map_screen.dart';
import 'prismatic_widgets.dart';
import 'sai_counter_screen.dart';
import 'tawaf_counter_screen.dart';
import 'theme_controller.dart';

Map<String, int> _tarikhMasihiKeHijrahTabular(DateTime tarikh) {
  final int jd = ((tarikh.millisecondsSinceEpoch / 86400000) + 2440587.5 + 0.5)
      .floor();
  int l = jd - 1948440 + 10632;
  final int n = ((l - 1) / 10631).floor();
  l = l - 10631 * n + 354;
  final int j =
      (((10985 - l) / 5316).floor()) * (((50 * l) / 17719).floor()) +
      ((l / 5670).floor()) * (((43 * l) / 15238).floor());
  l =
      l -
      (((30 - j) / 15).floor()) * (((17719 * j) / 50).floor()) -
      ((j / 16).floor()) * (((15238 * j) / 43).floor()) +
      29;
  final int bulan = ((24 * l) / 709).floor();
  final int hari = l - ((709 * bulan) / 24).floor();
  final int tahun = 30 * n + j - 30;
  return <String, int>{'tahun': tahun, 'bulan': bulan, 'hari': hari};
}

int _hijrahKeJulianDay(int tahun, int bulan, int hari) =>
    ((11 * tahun + 3) / 30).floor() +
    354 * tahun +
    30 * bulan -
    ((bulan - 1) / 2).floor() +
    hari +
    1948440 -
    385;

DateTime _julianDayKeMasihi(int jd) {
  final DateTime utc = DateTime.fromMillisecondsSinceEpoch(
    ((jd - 2440587.5) * 86400000).round(),
    isUtc: true,
  );
  return DateTime(utc.year, utc.month, utc.day);
}

DateTime kiraTarikhWukufAkanDatang(DateTime sekarang) {
  int tahunHijrah = _tarikhMasihiKeHijrahTabular(sekarang)['tahun']!;
  DateTime calon = _julianDayKeMasihi(_hijrahKeJulianDay(tahunHijrah, 12, 9));
  final DateTime hariIni = DateTime(
    sekarang.year,
    sekarang.month,
    sekarang.day,
  );
  if (calon.isBefore(hariIni)) {
    tahunHijrah += 1;
    calon = _julianDayKeMasihi(_hijrahKeJulianDay(tahunHijrah, 12, 9));
  }
  return calon;
}

String sapaanMengikutMasa() {
  final int jam = DateTime.now().hour;
  if (jam >= 5 && jam < 11) return 'Selamat pagi';
  if (jam >= 11 && jam < 15) return 'Selamat tengah hari';
  if (jam >= 15 && jam < 19) return 'Selamat petang';
  return 'Selamat malam';
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({required this.themeController, super.key});
  final ThemeController themeController;
  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama>
    with SingleTickerProviderStateMixin {
  final ScrollController _scroll = ScrollController();
  late final AnimationController _entrance;
  late final Listenable _progressChanges;
  String _category = 'Semua';
  late bool _ambientMotion;

  @override
  void initState() {
    super.initState();
    _ambientMotion =
        settingsBox.get('ambient_motion', defaultValue: true) == true;
    _entrance = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();
    _progressChanges = Listenable.merge(<Listenable>[
      tawafBox.listenable(),
      saiBox.listenable(),
      guideBox.listenable(),
      assessmentBox.listenable(),
      certificatesBox.listenable(),
    ]);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (context.reduceMotion) _entrance.value = 1;
  }

  @override
  void dispose() {
    _entrance.dispose();
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _open(Widget screen) => Navigator.of(
    context,
  ).push<void>(MaterialPageRoute<void>(builder: (_) => screen));
  void _learn() => _open(
    LearningModuleScreen(
      assessmentBox: assessmentBox,
      certificatesBox: certificatesBox,
    ),
  );
  void _guide() => _open(HajjGuideScreen(guideBox: guideBox));
  void _assessment() => _open(
    FinalAssessmentScreen(
      assessmentBox: assessmentBox,
      certificatesBox: certificatesBox,
    ),
  );
  void _certificates() => _open(
    MyCertificatesScreen(
      certificatesBox: certificatesBox,
      assessmentBox: assessmentBox,
    ),
  );

  List<_Feature> get _features => <_Feature>[
    _Feature(
      'Kaunter Tawaf',
      'Kira tujuh pusingan Tawaf dengan mudah.',
      HajjIconType.tawaf,
      'Ibadah',
      () => _open(TawafCounterScreen(tawafBox: tawafBox)),
    ),
    _Feature(
      'Kaunter Sa’i',
      'Kira perjalanan antara Safa dan Marwah.',
      HajjIconType.sai,
      'Ibadah',
      () => _open(SaiCounterScreen(saiBox: saiBox)),
    ),
    _Feature(
      'Peta Mina & Arafah',
      'Peta Mina dan Arafah (perlu internet).',
      HajjIconType.map,
      'Panduan',
      () => _open(const OfflineMapScreen()),
    ),
    _Feature(
      'Simulasi Haji 3D',
      'Terokai perjalanan Haji secara interaktif.',
      HajjIconType.kaaba,
      'Pembelajaran',
      () => _open(const HajjJourneyViewer()),
    ),
    _Feature(
      'Modul Belajar',
      'Fahami asas dan pelaksanaan ibadah Haji.',
      HajjIconType.learning,
      'Pembelajaran',
      _learn,
    ),
    _Feature(
      'Panduan Haji',
      'Panduan ibadah, langkah demi langkah.',
      HajjIconType.guide,
      'Panduan',
      _guide,
    ),
    _Feature(
      'Panduan Umrah',
      'Dari ihram hingga selesai tahallul.',
      HajjIconType.umrahJourney,
      'Panduan',
      () => _open(UmrahGuideScreen(guideBox: guideBox)),
    ),
    _Feature(
      'Modul Umrah',
      'Lengkapkan ilmu sebelum menunaikan Umrah.',
      HajjIconType.doa,
      'Pembelajaran',
      () => _open(const UmrahLearningModuleScreen()),
    ),
  ];

  Widget _reveal(Widget child, double start) {
    final Animation<double> animation = CurvedAnimation(
      parent: _entrance,
      curve: Interval(start, 1, curve: HajjMotion.ease),
    );
    return FadeTransition(
      opacity: animation,
      child: AnimatedBuilder(
        animation: animation,
        builder: (_, child) => Transform.translate(
          offset: Offset(0, 12 * (1 - animation.value)),
          child: child,
        ),
        child: child,
      ),
    );
  }

  Widget _sidebar({bool drawer = false}) => _Sidebar(
    features: _features,
    onAssessment: _assessment,
    onCertificates: _certificates,
    drawer: drawer,
    onHome: () {
      if (_scroll.hasClients) {
        if (context.reduceMotion) {
          _scroll.jumpTo(0);
          return;
        }
        _scroll.animateTo(
          0,
          duration: HajjMotion.of(context, HajjMotion.slow),
          curve: HajjMotion.ease,
        );
      }
    },
  );

  @override
  Widget build(BuildContext context) {
    final HajjColors p = context.hajjColors;
    final bool desktop = MediaQuery.sizeOf(context).width >= 1100;
    return Scaffold(
      backgroundColor: p.gradientStart,
      drawer: desktop
          ? null
          : Drawer(width: 272, child: _sidebar(drawer: true)),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (desktop) SizedBox(width: 232, child: _sidebar()),
            Expanded(
              child: Column(
                children: <Widget>[
                  _TopBar(
                    desktop: desktop,
                    themeController: widget.themeController,
                    ambientMotion: _ambientMotion,
                    onToggleMotion: () {
                      setState(() => _ambientMotion = !_ambientMotion);
                      settingsBox.put('ambient_motion', _ambientMotion);
                    },
                  ),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        const Positioned.fill(child: PrismaticBackdrop()),
                        AnimatedBuilder(
                          animation: _progressChanges,
                          builder: (_, _) => _content(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _content() {
    final HajjColors p = context.hajjColors;
    final int tawaf =
        (tawafBox.get(TawafCounterScreen.storageKey, defaultValue: 0) as int)
            .clamp(0, TawafCounterScreen.totalRounds);
    final int sai =
        (saiBox.get(SaiCounterScreen.storageKey, defaultValue: 0) as int).clamp(
          0,
          SaiCounterScreen.totalTrips,
        );
    final dynamic saved = guideBox.get(
      HajjGuideScreen.storageKey,
      defaultValue: <int>[],
    );
    final int steps = saved is List
        ? saved.length.clamp(0, HajjGuideScreen.totalSteps)
        : 0;
    final dynamic score = assessmentBox.get('best_score', defaultValue: 0);
    final int bestScore = score is int ? score : 0;
    final bool passed =
        assessmentBox.get('passed', defaultValue: false) == true;
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool small = constraints.maxWidth < 600;
        final double inset = small ? 20 : 36;
        return SingleChildScrollView(
          controller: _scroll,
          padding: EdgeInsets.fromLTRB(inset, small ? 24 : 32, inset, 24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1280),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _reveal(_Welcome(small: small), 0),
                  const SizedBox(height: 26),
                  _reveal(
                    LayoutBuilder(
                      builder: (_, box) {
                        final Widget hero = _JourneyHero(
                          onLearn: _learn,
                          onGuide: _guide,
                          ambientMotion: _ambientMotion,
                        );
                        final Widget preparation = _PreparationCard(
                          completed: steps,
                          total: HajjGuideScreen.totalSteps,
                          onTap: _guide,
                        );
                        if (box.maxWidth < 940) {
                          return Column(
                            children: <Widget>[
                              hero,
                              const SizedBox(height: 16),
                              if (box.maxWidth >= 580)
                                IntrinsicHeight(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      const Expanded(
                                        child: _WukufCountdown(compact: true),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(child: preparation),
                                    ],
                                  ),
                                )
                              else ...<Widget>[
                                const _WukufCountdown(compact: true),
                                const SizedBox(height: 12),
                                preparation,
                              ],
                            ],
                          );
                        }
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(child: hero),
                            const SizedBox(width: 20),
                            SizedBox(
                              width: 270,
                              child: Column(
                                children: <Widget>[
                                  const _WukufCountdown(),
                                  const SizedBox(height: 16),
                                  preparation,
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    .08,
                  ),
                  const SizedBox(height: 34),
                  _reveal(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const _Eyebrow('AKSES PANTAS'),
                        const SizedBox(height: 7),
                        Text(
                          'Segalanya untuk perjalanan anda',
                          style: _heading(context, small ? 24 : 27),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          'Belajar, bersedia dan jalani ibadah dengan lebih teratur.',
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.7,
                            color: p.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              for (final String category in <String>[
                                'Semua',
                                'Ibadah',
                                'Pembelajaran',
                                'Panduan',
                              ])
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: ChoiceChip(
                                    label: Text(category),
                                    selected: _category == category,
                                    showCheckmark: false,
                                    onSelected: (_) =>
                                        setState(() => _category = category),
                                    selectedColor: p.emerald,
                                    backgroundColor: p.cardSurface,
                                    side: BorderSide(
                                      color: _category == category
                                          ? p.emerald
                                          : p.cardBorder,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 11,
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: _category == category
                                          ? p.onAccent
                                          : p.textSecondary,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        LayoutBuilder(
                          builder: (_, box) {
                            final List<_Feature> features = _features
                                .where(
                                  (f) =>
                                      _category == 'Semua' ||
                                      f.category == _category,
                                )
                                .toList();
                            final int columns = box.maxWidth >= 850
                                ? 4
                                : box.maxWidth >= 340
                                ? 2
                                : 1;
                            const double gap = 14;
                            final double width =
                                (box.maxWidth - gap * (columns - 1)) / columns;
                            return Wrap(
                              spacing: gap,
                              runSpacing: gap,
                              children: <Widget>[
                                for (final (index, feature) in features.indexed)
                                  SizedBox(
                                    width: width,
                                    child: TweenAnimationBuilder<double>(
                                      key: ValueKey<String>(
                                        '$_category-${feature.title}',
                                      ),
                                      tween: Tween<double>(
                                        begin: context.reduceMotion ? 1 : 0,
                                        end: 1,
                                      ),
                                      duration: HajjMotion.of(
                                        context,
                                        Duration(
                                          milliseconds: 420 + index * 55,
                                        ),
                                      ),
                                      curve: HajjMotion.ease,
                                      builder: (_, value, child) => Opacity(
                                        opacity: value,
                                        child: Transform.translate(
                                          offset: Offset(0, 16 * (1 - value)),
                                          child: child,
                                        ),
                                      ),
                                      child: _FeatureCard(feature: feature),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                    .15,
                  ),
                  const SizedBox(height: 32),
                  _reveal(
                    LayoutBuilder(
                      builder: (_, box) {
                        final Widget progress = _ProgressCard(
                          tawaf: tawaf,
                          sai: sai,
                        );
                        final Widget assessment = _AssessmentCard(
                          score: bestScore,
                          passed: passed,
                          onAssessment: _assessment,
                          onCertificates: _certificates,
                        );
                        if (box.maxWidth < 720) {
                          return Column(
                            children: <Widget>[
                              progress,
                              const SizedBox(height: 16),
                              assessment,
                            ],
                          );
                        }
                        return IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(child: progress),
                              const SizedBox(width: 20),
                              Expanded(child: assessment),
                            ],
                          ),
                        );
                      },
                    ),
                    .23,
                  ),
                  const SizedBox(height: 32),
                  Divider(color: p.divider),
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 24,
                    runSpacing: 8,
                    children: <Widget>[
                      Text(
                        '© Muzzammil Najib · Haji Pintar',
                        style: TextStyle(fontSize: 12, color: p.textSecondary),
                      ),
                      Text(
                        'Versi BETA · Teman belajar Haji & Umrah',
                        style: TextStyle(fontSize: 12, color: p.textSecondary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

TextStyle _heading(BuildContext context, double size) => TextStyle(
  fontFamily: AppFonts.display,
  fontSize: size,
  height: 1.3,
  fontWeight: FontWeight.w600,
  letterSpacing: -.4,
  color: context.hajjColors.textPrimary,
);

class _Brand extends StatelessWidget {
  const _Brand();
  @override
  Widget build(BuildContext context) {
    final HajjColors p = context.hajjColors;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 43,
          height: 46,
          decoration: BoxDecoration(
            color: p.emerald,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Icon(Icons.mosque_outlined, color: p.onAccent, size: 27),
        ),
        const SizedBox(width: 11),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                    text: 'haji',
                    style: TextStyle(color: p.textPrimary),
                  ),
                  TextSpan(
                    text: 'pintar',
                    style: TextStyle(color: p.emerald),
                  ),
                ],
              ),
              style: const TextStyle(
                fontFamily: AppFonts.display,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                letterSpacing: -1,
              ),
            ),
            Text(
              'ILMU MEMBIMBING IBADAH',
              style: TextStyle(
                fontSize: 8,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w700,
                color: p.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Sidebar extends StatelessWidget {
  const _Sidebar({
    required this.features,
    required this.onHome,
    required this.onAssessment,
    required this.onCertificates,
    this.drawer = false,
  });
  final List<_Feature> features;
  final VoidCallback onHome;
  final VoidCallback onAssessment;
  final VoidCallback onCertificates;
  final bool drawer;
  @override
  Widget build(BuildContext context) {
    final HajjColors p = context.hajjColors;
    void navigate(VoidCallback action) {
      if (drawer) Navigator.of(context).pop();
      action();
    }

    Widget feature(int i) => _NavItem(
      label: features[i].title,
      icon: HajjIcon(type: features[i].icon, color: p.textSecondary).iconData,
      onTap: () => navigate(features[i].onTap),
    );
    return Container(
      decoration: BoxDecoration(
        color: p.cardSurface,
        border: Border(right: BorderSide(color: p.divider)),
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 28, 20, 28),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: _Brand(),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _NavItem(
                      label: 'Laman Utama',
                      icon: Icons.grid_view_rounded,
                      selected: true,
                      onTap: () => navigate(onHome),
                    ),
                    const _NavLabel('PEMBELAJARAN'),
                    for (final int i in <int>[4, 5, 6, 7]) feature(i),
                    const _NavLabel('ALAT IBADAH'),
                    for (final int i in <int>[0, 1, 2, 3]) feature(i),
                    const _NavLabel('PENCAPAIAN'),
                    _NavItem(
                      label: 'Penilaian Akhir',
                      icon: Icons.fact_check_outlined,
                      onTap: () => navigate(onAssessment),
                    ),
                    _NavItem(
                      label: 'Sijil Saya',
                      icon: Icons.workspace_premium_outlined,
                      onTap: () => navigate(onCertificates),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: p.sandSoft,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.auto_awesome_outlined, color: p.gold, size: 23),
                  const SizedBox(height: 10),
                  Text(
                    'Sedikit ilmu, setiap hari.',
                    style: _heading(context, 17),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Bina persediaan dengan langkah yang kecil dan konsisten.',
                    style: TextStyle(
                      fontSize: 11,
                      height: 1.7,
                      color: p.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavLabel extends StatelessWidget {
  const _NavLabel(this.text);
  final String text;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(14, 24, 0, 9),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 9,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w700,
        color: context.hajjColors.textSecondary,
      ),
    ),
  );
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.icon,
    required this.onTap,
    this.selected = false,
  });
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    final HajjColors p = context.hajjColors;
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: selected ? p.emerald : Colors.transparent,
        borderRadius: BorderRadius.circular(9),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(9),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Row(
              children: <Widget>[
                Icon(
                  icon,
                  size: 19,
                  color: selected ? p.onAccent : p.textSecondary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                      color: selected ? p.onAccent : p.textSecondary,
                    ),
                  ),
                ),
                if (selected) Icon(Icons.circle, size: 5, color: p.onAccent),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.desktop,
    required this.themeController,
    required this.ambientMotion,
    required this.onToggleMotion,
  });
  final bool desktop;
  final ThemeController themeController;
  final bool ambientMotion;
  final VoidCallback onToggleMotion;
  Future<void> _themeSheet(BuildContext context) async {
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Tema paparan',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              for (final (ThemeMode, IconData, String, String) option
                  in <(ThemeMode, IconData, String, String)>[
                    (
                      ThemeMode.system,
                      Icons.brightness_auto_outlined,
                      'Ikut peranti',
                      'Mengikut tetapan telefon atau komputer.',
                    ),
                    (
                      ThemeMode.light,
                      Icons.light_mode_outlined,
                      'Mod cerah',
                      'Latar cerah yang lembut untuk siang hari.',
                    ),
                    (
                      ThemeMode.dark,
                      Icons.dark_mode_outlined,
                      'Mod gelap',
                      'Latar gelap yang selesa untuk waktu malam.',
                    ),
                  ])
                ThemeModeTile(
                  title: option.$3,
                  subtitle: option.$4,
                  icon: option.$2,
                  value: option.$1,
                  groupValue: themeController.themeMode,
                  onChanged: (mode) async {
                    await themeController.setThemeMode(mode);
                    if (sheetContext.mounted) Navigator.of(sheetContext).pop();
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final HajjColors p = context.hajjColors;
    return Container(
      constraints: const BoxConstraints(minHeight: 76),
      padding: EdgeInsets.symmetric(
        horizontal: desktop ? 36 : 12,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: p.cardSurface,
        border: Border(bottom: BorderSide(color: p.divider)),
      ),
      child: Row(
        children: <Widget>[
          if (!desktop) ...<Widget>[
            IconButton(
              tooltip: 'Buka menu',
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu_rounded, size: 23),
            ),
            const SizedBox(width: 4),
          ],
          if (desktop)
            Expanded(
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Text(
                      'Ruang pembelajaran',
                      style: TextStyle(fontSize: 12, color: p.textSecondary),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(
                      Icons.chevron_right_rounded,
                      size: 16,
                      color: p.textSecondary,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Laman Utama',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: p.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            )
          else
            const Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: _Brand(),
              ),
            ),
          if (desktop) ...<Widget>[
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: p.emerald,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 7),
            Text(
              'Haji & Umrah',
              style: TextStyle(fontSize: 11, color: p.textSecondary),
            ),
            const SizedBox(width: 24),
          ],
          IconButton(
            tooltip: context.reduceMotion
                ? 'Animasi dikurangkan oleh peranti'
                : ambientMotion
                ? 'Hentikan animasi'
                : 'Hidupkan animasi',
            onPressed: context.reduceMotion ? null : onToggleMotion,
            icon: Icon(
              ambientMotion && !context.reduceMotion
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded,
              size: 20,
              color: context.reduceMotion ? p.textSecondary : p.secondaryColor,
            ),
          ),
          const SizedBox(width: 4),
          IconButton.outlined(
            tooltip: 'Tema paparan',
            onPressed: () => _themeSheet(context),
            style: IconButton.styleFrom(
              side: BorderSide(color: p.cardBorder),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            icon: Icon(
              context.isDarkMode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
              size: 20,
              color: p.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _Welcome extends StatelessWidget {
  const _Welcome({required this.small});
  final bool small;
  @override
  Widget build(BuildContext context) {
    final HajjColors p = context.hajjColors;
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${sapaanMengikutMasa()}. Selamat datang ke Haji Pintar.',
                style: TextStyle(
                  fontSize: small ? 11 : 12,
                  color: p.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Assalamualaikum.',
                style: _heading(context, small ? 30 : 36),
              ),
              const SizedBox(height: 8),
              Text(
                'Persiapkan hati. Lengkapkan ilmu. Yakin melangkah.',
                style: TextStyle(
                  fontSize: small ? 12 : 13,
                  height: 1.7,
                  color: p.textSecondary,
                ),
              ),
              if (small) ...<Widget>[
                const SizedBox(height: 12),
                const _TodayDate(compact: true),
              ],
            ],
          ),
        ),
        if (!small) const _TodayDate(),
      ],
    );
  }
}

class _TodayDate extends StatelessWidget {
  const _TodayDate({this.compact = false});
  final bool compact;
  @override
  Widget build(BuildContext context) {
    final HajjColors p = context.hajjColors;
    final DateTime now = DateTime.now();
    final HijriCalendar hijri = HijriCalendar.fromDate(now);
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
    const List<String> hijriMonths = <String>[
      'Muharram',
      'Safar',
      'Rabiulawal',
      'Rabiulakhir',
      'Jamadilawal',
      'Jamadilakhir',
      'Rejab',
      'Syaaban',
      'Ramadan',
      'Syawal',
      'Zulkaedah',
      'Zulhijjah',
    ];
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.calendar_today_outlined,
          size: compact ? 14 : 18,
          color: p.gold,
        ),
        SizedBox(width: compact ? 8 : 12),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${now.day} ${months[now.month - 1]} ${now.year}',
                style: TextStyle(
                  fontSize: compact ? 11 : 12,
                  fontWeight: FontWeight.w700,
                  color: p.textPrimary,
                ),
              ),
              if (!compact) ...<Widget>[
                const SizedBox(height: 5),
                Text(
                  '${hijri.hDay} ${hijriMonths[hijri.hMonth - 1]} ${hijri.hYear}H',
                  style: TextStyle(fontSize: 11, color: p.textSecondary),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _JourneyHero extends StatelessWidget {
  const _JourneyHero({
    required this.onLearn,
    required this.onGuide,
    required this.ambientMotion,
  });
  final VoidCallback onLearn;
  final VoidCallback onGuide;
  final bool ambientMotion;
  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (_, box) {
      final bool small = box.maxWidth < 550;
      return PrismaticSurface(
        accent: PrismAccent.pink,
        radius: 20,
        lift: false,
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 356),
          color: const Color(0xFF143C30),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.asset(
                  'assets/images/kaabah_light.jpg',
                  fit: BoxFit.cover,
                  alignment: const Alignment(.65, .35),
                  excludeFromSemantics: true,
                ),
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        const Color(0xFF10382D).withValues(alpha: .99),
                        const Color(
                          0xFF10382D,
                        ).withValues(alpha: small ? .86 : .89),
                        const Color(
                          0xFF10382D,
                        ).withValues(alpha: small ? .40 : .08),
                      ],
                      stops: const <double>[0, .43, 1],
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: const Alignment(1, -1),
                        radius: 1.1,
                        colors: <Color>[
                          PrismAccent.pink.glow.withValues(alpha: .26),
                          PrismAccent.violet.glow.withValues(alpha: .09),
                          Colors.transparent,
                        ],
                        stops: const <double>[0, .55, 1],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -45,
                top: -65,
                width: small ? 280 : 340,
                height: small ? 280 : 340,
                child: Opacity(
                  opacity: small ? .55 : 1,
                  child: KaleidoscopeField(enabled: ambientMotion),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(small ? 26 : 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 19,
                          height: 1,
                          color: const Color(0xFFFFABD1),
                        ),
                        const SizedBox(width: 8),
                        const Flexible(
                          child: Text(
                            'TEMAN PERJALANAN IBADAH ANDA',
                            style: TextStyle(
                              fontSize: 9,
                              letterSpacing: 1.7,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFFC3E1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'Langkah berilmu,\nibadah lebih yakin.',
                      style: TextStyle(
                        fontFamily: AppFonts.display,
                        fontSize: small ? 31 : 37,
                        height: 1.2,
                        letterSpacing: -.6,
                        color: const Color(0xFFFFFCF4),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: small ? 280 : 320),
                      child: const Text(
                        'Bimbingan Haji dan Umrah yang tersusun,\nuntuk setiap langkah menuju Tanah Suci.',
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.8,
                          color: Color(0xFFDAE5DF),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: <Widget>[
                        FilledButton(
                          onPressed: onLearn,
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color(0xFFF7B5D6),
                            foregroundColor: const Color(0xFF3C1730),
                            minimumSize: const Size(0, 46),
                            padding: const EdgeInsets.symmetric(horizontal: 17),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  'Mulakan pembelajaran',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Icon(Icons.arrow_forward_rounded, size: 16),
                            ],
                          ),
                        ),
                        OutlinedButton(
                          onPressed: onGuide,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Color(0xFF92A99A)),
                            minimumSize: const Size(0, 46),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Panduan Haji',
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 23),
                    const Row(
                      children: <Widget>[
                        Icon(
                          Icons.menu_book_outlined,
                          size: 14,
                          color: Color(0xFFDCC596),
                        ),
                        SizedBox(width: 7),
                        Flexible(
                          child: Text(
                            'Belajar  ·  Fahami  ·  Amalkan',
                            style: TextStyle(
                              fontSize: 10,
                              letterSpacing: .3,
                              color: Color(0xFFD3DFD7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class _WukufCountdown extends StatefulWidget {
  const _WukufCountdown({this.compact = false});
  final bool compact;
  @override
  State<_WukufCountdown> createState() => _WukufCountdownState();
}

class _WukufCountdownState extends State<_WukufCountdown> {
  Timer? _timer;
  DateTime _now = DateTime.now();
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (mounted) setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HajjColors p = context.hajjColors;
    final DateTime today = DateTime(_now.year, _now.month, _now.day);
    final int days = math.max(
      0,
      kiraTarikhWukufAkanDatang(_now).difference(today).inDays,
    );
    return _Panel(
      padding: const EdgeInsets.all(22),
      accent: PrismAccent.violet,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.nights_stay_outlined, color: p.gold, size: 19),
              const SizedBox(width: 9),
              Expanded(
                child: Text(
                  'MENUJU HARI WUKUF',
                  style: TextStyle(
                    fontSize: 9,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w800,
                    color: p.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 9,
            children: <Widget>[
              Text(
                '$days',
                style: TextStyle(
                  fontFamily: AppFonts.display,
                  fontSize: widget.compact ? 38 : 48,
                  height: 1.1,
                  color: p.emerald,
                ),
              ),
              Text(
                'hari lagi',
                style: TextStyle(fontSize: 12, color: p.textSecondary),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Anggaran takwim · 9 Zulhijjah',
            style: TextStyle(color: p.textSecondary, fontSize: 10, height: 1.5),
          ),
          if (!widget.compact) ...<Widget>[
            const SizedBox(height: 5),
            Text(
              'Tertakluk kepada pengisytiharan rasmi.',
              style: TextStyle(fontSize: 9, color: p.textSecondary),
            ),
          ],
        ],
      ),
    );
  }
}

class _PreparationCard extends StatelessWidget {
  const _PreparationCard({
    required this.completed,
    required this.total,
    required this.onTap,
  });
  final int completed;
  final int total;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final HajjColors p = context.hajjColors;
    return _Panel(
      color: p.sageSoft,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Persediaan Haji',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: p.textPrimary,
                  ),
                ),
              ),
              Icon(Icons.route_outlined, color: p.emerald, size: 18),
            ],
          ),
          const SizedBox(height: 11),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: completed / total,
              minHeight: 5,
              color: p.emerald,
              backgroundColor: p.emerald.withValues(alpha: .13),
              semanticsLabel:
                  'Kemajuan panduan Haji: $completed daripada $total langkah',
            ),
          ),
          const SizedBox(height: 9),
          Text(
            '$completed daripada $total langkah selesai',
            style: TextStyle(fontSize: 10, color: p.textSecondary),
          ),
          const SizedBox(height: 4),
          TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              minimumSize: const Size(44, 44),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: Text(
                    completed > 0 ? 'Sambung perjalanan' : 'Mulakan persediaan',
                    style: const TextStyle(fontSize: 11),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_rounded, size: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Feature {
  const _Feature(
    this.title,
    this.description,
    this.icon,
    this.category,
    this.onTap,
  );
  final String title;
  final String description;
  final HajjIconType icon;
  final String category;
  final VoidCallback onTap;
}

class _FeatureCard extends StatefulWidget {
  const _FeatureCard({required this.feature});
  final _Feature feature;
  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool _hovered = false;
  bool _focused = false;
  @override
  Widget build(BuildContext context) {
    final HajjColors p = context.hajjColors;
    final _Feature f = widget.feature;
    final bool active = _hovered || _focused;
    final PrismAccent accent = switch (f.icon) {
      HajjIconType.tawaf => PrismAccent.blue,
      HajjIconType.sai => PrismAccent.pink,
      HajjIconType.map => PrismAccent.teal,
      HajjIconType.kaaba => PrismAccent.gold,
      HajjIconType.learning => PrismAccent.violet,
      HajjIconType.umrahJourney => PrismAccent.pink,
      HajjIconType.doa => PrismAccent.teal,
      _ => PrismAccent.emerald,
    };
    return Semantics(
      button: true,
      child: PrismaticSurface(
        minHeight: 184,
        accent: accent,
        radius: 16,
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(13),
          child: InkWell(
            onTap: f.onTap,
            onHover: (value) => setState(() => _hovered = value),
            onFocusChange: (value) => setState(() => _focused = value),
            borderRadius: BorderRadius.circular(13),
            child: Padding(
              padding: const EdgeInsets.all(19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 43,
                        height: 43,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              accent.glow.withValues(alpha: .23),
                              accent.glow.withValues(alpha: .07),
                            ],
                          ),
                          border: Border.all(
                            color: accent.glow.withValues(alpha: .25),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: HajjIcon(
                            type: f.icon,
                            color: accent.foreground(context),
                            size: 23,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.north_east_rounded,
                        size: 16,
                        color: active
                            ? accent.foreground(context)
                            : p.textSecondary.withValues(alpha: .6),
                      ),
                    ],
                  ),
                  const SizedBox(height: 19),
                  Text(
                    f.title,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: p.textPrimary,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    f.description,
                    style: TextStyle(
                      fontSize: 11,
                      color: p.textSecondary,
                      height: 1.7,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  const _ProgressCard({required this.tawaf, required this.sai});
  final int tawaf;
  final int sai;
  @override
  Widget build(BuildContext context) {
    final HajjColors p = context.hajjColors;
    return _Panel(
      accent: PrismAccent.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text('Kemajuan ibadah', style: _heading(context, 22)),
              ),
              Icon(Icons.donut_small_outlined, size: 20, color: p.emerald),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Setiap langkah anda direkodkan di sini.',
            style: TextStyle(fontSize: 11, color: p.textSecondary),
          ),
          const SizedBox(height: 23),
          _ProgressRow(
            title: 'Tawaf',
            description: 'pusingan',
            value: tawaf,
            total: TawafCounterScreen.totalRounds,
            color: p.emerald,
          ),
          const SizedBox(height: 20),
          _ProgressRow(
            title: 'Sa’i',
            description: 'perjalanan',
            value: sai,
            total: SaiCounterScreen.totalTrips,
            color: p.secondaryColor,
          ),
        ],
      ),
    );
  }
}

class _ProgressRow extends StatelessWidget {
  const _ProgressRow({
    required this.title,
    required this.description,
    required this.value,
    required this.total,
    required this.color,
  });
  final String title;
  final String description;
  final int value;
  final int total;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final HajjColors p = context.hajjColors;
    return Column(
      children: <Widget>[
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 12,
          runSpacing: 6,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: p.textPrimary,
              ),
            ),
            Text(
              '$value / $total $description',
              style: TextStyle(fontSize: 10, color: p.textSecondary),
            ),
          ],
        ),
        const SizedBox(height: 9),
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: LinearProgressIndicator(
            value: value / total,
            minHeight: 6,
            color: color,
            backgroundColor: p.divider,
            semanticsLabel: '$title: $value daripada $total $description',
          ),
        ),
      ],
    );
  }
}

class _AssessmentCard extends StatelessWidget {
  const _AssessmentCard({
    required this.score,
    required this.passed,
    required this.onAssessment,
    required this.onCertificates,
  });
  final int score;
  final bool passed;
  final VoidCallback onAssessment;
  final VoidCallback onCertificates;
  @override
  Widget build(BuildContext context) {
    final HajjColors p = context.hajjColors;
    return _Panel(
      color: p.secondarySoft,
      accent: PrismAccent.pink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const _Eyebrow('ILMU MENJADI BEKAL'),
                    const SizedBox(height: 8),
                    Text(
                      'Sejauh mana persediaan anda?',
                      style: _heading(context, 22),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Icon(Icons.workspace_premium_outlined, color: p.gold, size: 34),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            score > 0
                ? 'Markah terbaik anda: $score%. ${passed ? 'Tahniah atas pencapaian anda.' : 'Teruskan belajar dan cuba lagi.'}'
                : 'Uji kefahaman melalui penilaian akhir dan lihat pencapaian pembelajaran anda.',
            style: TextStyle(fontSize: 11, height: 1.8, color: p.textSecondary),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: <Widget>[
              FilledButton(
                onPressed: onAssessment,
                style: FilledButton.styleFrom(
                  minimumSize: const Size(0, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  score > 0 ? 'Cuba penilaian lagi' : 'Mulakan penilaian',
                  style: const TextStyle(fontSize: 11),
                ),
              ),
              TextButton(
                onPressed: onCertificates,
                child: const Text('Sijil Saya', style: TextStyle(fontSize: 11)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Panel extends StatelessWidget {
  const _Panel({
    required this.child,
    this.color,
    this.padding = const EdgeInsets.all(24),
    this.accent = PrismAccent.emerald,
  });
  final Widget child;
  final Color? color;
  final EdgeInsets padding;
  final PrismAccent accent;
  @override
  Widget build(BuildContext context) => PrismaticSurface(
    accent: accent,
    background: color ?? context.hajjColors.cardSurface,
    radius: 16,
    child: Container(width: double.infinity, padding: padding, child: child),
  );
}

class _Eyebrow extends StatelessWidget {
  const _Eyebrow(this.text);
  final String text;
  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      fontSize: 9,
      letterSpacing: 1.5,
      fontWeight: FontWeight.w800,
      color: context.hajjColors.emerald,
    ),
  );
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
    final HajjColors p = context.hajjColors;
    final bool selected = value == groupValue;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: selected ? p.sageSoft : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          leading: Icon(icon, color: p.emerald),
          title: Text(
            title,
            style: TextStyle(
              color: p.textPrimary,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(color: p.textSecondary, fontSize: 12),
          ),
          trailing: Icon(
            selected ? Icons.check_circle_rounded : Icons.circle_outlined,
            color: selected ? p.emerald : p.textSecondary,
          ),
          selected: selected,
          onTap: () => onChanged(value),
        ),
      ),
    );
  }
}
