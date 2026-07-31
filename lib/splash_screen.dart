import 'dart:ui';

import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme_controller.dart';
import 'home_dashboard.dart';
import 'islamic_icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    required this.themeController,
    required this.settingsBox,
    super.key,
  });

  final ThemeController themeController;
  final dynamic settingsBox;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _introAnimationController;
  late Animation<double> _introScaleAnimation;
  late Animation<Offset> _introSlideAnimation;
  late Animation<double> _glowPulse;
  late final PageController _introPageController;

  bool _sudahMula = false;
  int _introPage = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _introAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    )..forward();
    final CurvedAnimation introCurve = CurvedAnimation(
      parent: _introAnimationController,
      curve: Curves.easeOutCubic,
    );
    _introScaleAnimation = Tween<double>(begin: 0.88, end: 1).animate(introCurve);
    _introSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(introCurve);

    _glowPulse = Tween<double>(begin: 0.85, end: 1.15).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutSine,
      ),
    );

    _introPageController = PageController();
  }

  Future<void> _mulakanSkrin() async {
    setState(() {
      _sudahMula = true;
    });
    _animationController.forward();
  }

  void _masukKeDashboard() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder<void>(
        transitionDuration: const Duration(milliseconds: 800),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: HalamanUtama(themeController: widget.themeController),
          );
        },
      ),
    );
  }

  void _simpanOnboardingLanjut() {
    widget.settingsBox.put('onboarding_completed', true);
    _masukKeDashboard();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _introAnimationController.dispose();
    _introPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              context.hajjColors.gradientStart,
              context.hajjColors.gradientMiddle,
              context.hajjColors.gradientEnd,
            ],
          ),
        ),
        child: _sudahMula
            ? _binaPengenalan()
            : _binaPaparanMula(),
      ),
    );
  }

  Widget _binaPaparanMula() {
    final dynamic palette = context.hajjColors;

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          'assets/images/muka_depan.jpg',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(color: palette.gradientStart);
          },
        ),
        Container(color: Colors.black.withValues(alpha: 0.40)),
        SafeArea(
          child: Align(
            alignment: const Alignment(0, -0.62),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ScaleTransition(
                  scale: _glowPulse,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: palette.gold.withValues(alpha: 0.35),
                          blurRadius: 30,
                          spreadRadius: 8,
                        ),
                        BoxShadow(
                          color: palette.gold.withValues(alpha: 0.18),
                          blurRadius: 60,
                          spreadRadius: 20,
                        ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: palette.gold.withValues(alpha: 0.35),
                          width: 1.5,
                        ),
                      ),
                      child: Icon(
                        Icons.mosque_rounded,
                        color: palette.gold,
                        size: 34,
                        shadows: <Shadow>[
                          Shadow(
                            color: palette.gold.withValues(alpha: 0.5),
                            blurRadius: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'HAJI PINTAR',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 26,
                    letterSpacing: 3,
                    shadows: <Shadow>[
                      Shadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 40,
                  height: 1.4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        palette.gold.withValues(alpha: 0.8),
                        palette.gold.withValues(alpha: 0.2),
                        palette.gold.withValues(alpha: 0.8),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Persediaan Ilmu Menuju Haji yang Mabrur',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.75),
                    fontSize: 12.5,
                    letterSpacing: 0.6,
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: const Alignment(0, 0.30),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: GoogleFonts.amiri(
                color: palette.gold.withValues(alpha: 0.7),
                fontSize: 20,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: const Alignment(0, 0.75),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                      width: 1.5,
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: palette.emerald.withValues(alpha: 0.2),
                        blurRadius: 30,
                        spreadRadius: 2,
                      ),
                      BoxShadow(
                        color: palette.gold.withValues(alpha: 0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _mulakanSkrin,
                      borderRadius: BorderRadius.circular(40),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: palette.gold,
                                shape: BoxShape.circle,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: palette.gold.withValues(alpha: 0.5),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Text(
                              'Bismillah, Mulakan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _binaPengenalan() {
    final dynamic palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;
    final List<_PengenalanData> pages = <_PengenalanData>[
      _PengenalanData(
        icon: HajjIconType.guide,
        title: 'Selamat Datang, Tetamu Allah',
        arabicQuote: 'أَهْلًا وَسَهْلًا',
        verse: 'وَأَذِّن فِي النَّاسِ بِالْحَجِّ',
        verseRef: 'Surah al-Hajj, 22:27',
        titleContent: 'Teman Persediaan Haji',
        description:
            'HajiPintar membantu anda memahami perjalanan haji '
            'melalui panduan yang tersusun, ringkas dan mudah dirujuk.',
      ),
      _PengenalanData(
        icon: HajjIconType.learning,
        title: 'Belajar dengan Lebih Yakin',
        arabicQuote: null,
        verse: null,
        verseRef: null,
        titleContent: 'Belajar dengan Lebih Yakin',
        description:
            'Akses modul pembelajaran, doa, zikir, kuiz, peta lokasi '
            'serta panduan langkah demi langkah dalam satu aplikasi.',
      ),
      _PengenalanData(
        icon: HajjIconType.rukun,
        title: 'Rujukan yang Bertanggungjawab',
        arabicQuote: null,
        verse: null,
        verseRef: null,
        titleContent: 'Rujukan yang Bertanggungjawab',
        description:
            'Kandungan HajiPintar disediakan untuk pendidikan dan '
            'rujukan umum. Untuk persoalan hukum atau situasi khusus, '
            'rujuk pembimbing haji dan pihak berautoriti.',
      ),
    ];

    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 620),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 28,
                ),
                child: Column(
                  children: <Widget>[
                    _buildIntroGlow(palette),
Row(
                      children: <Widget>[
                        HajiPintarCircularLogo(
                          size: 56,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'HAJIPINTAR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${_introPage + 1}/${pages.length}',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.7),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: PageView.builder(
                        controller: _introPageController,
                        itemCount: pages.length,
                        onPageChanged: (int page) {
                          setState(() {
                            _introPage = page;
                          });
                          _introAnimationController.forward(from: 0);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          final _PengenalanData page = pages[index];
                          return FadeTransition(
                            opacity: _introAnimationController,
                            child: SlideTransition(
                              position: _introSlideAnimation,
                              child: ScaleTransition(
                                scale: _introScaleAnimation,
                                child: _PengenalanPage(
                                  data: page,
                                  palette: palette,
                                  colors: colors,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(pages.length, (
                        int index,
                      ) {
                        final bool selected = _introPage == index;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 220),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: selected ? 28 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: selected
                                ? palette.gold
                                : Colors.white.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: FilledButton(
                        onPressed: () {
                          if (_introPage < pages.length - 1) {
                            _introPageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOutCubic,
                            );
                          } else {
                            _simpanOnboardingLanjut();
                          }
                        },
                        child: Text(
                          _introPage < pages.length - 1
                              ? 'Seterusnya'
                              : 'Masuk ke HajiPintar',
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: _simpanOnboardingLanjut,
                      child: const Text(
                        'Langkau',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildIntroGlow(dynamic palette) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _introAnimationController,
        builder: (BuildContext context, Widget? child) {
          final double pulse =
              0.92 + (_introAnimationController.value * 0.08);
          return Transform.scale(
            scale: pulse,
            child: Container(
              width: 1,
              height: 1,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: palette.gold.withValues(alpha: 0.22),
                    blurRadius: 90,
                    spreadRadius: 75,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PengenalanData {
  const _PengenalanData({
    required this.icon,
    required this.title,
    required this.titleContent,
    required this.description,
    this.arabicQuote,
    this.verse,
    this.verseRef,
  });

  final HajjIconType icon;
  final String title;
  final String titleContent;
  final String description;
  final String? arabicQuote;
  final String? verse;
  final String? verseRef;
}

class _PengenalanPage extends StatelessWidget {
  const _PengenalanPage({
    required this.data,
    required this.palette,
    required this.colors,
  });

  final _PengenalanData data;
  final dynamic palette;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: 190,
                    height: 190,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: SweepGradient(
                        colors: <Color>[
                          palette.gold.withValues(alpha: 0.15),
                          palette.emerald.withValues(alpha: 0.15),
                          palette.gold.withValues(alpha: 0.15),
                        ],
                        stops: const <double>[0.0, 0.5, 1.0],
                      ),
                      border: Border.all(
                        color: palette.gold.withValues(alpha: 0.35),
                        width: 1.5,
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: palette.gold.withValues(alpha: 0.2),
                          blurRadius: 35,
                          spreadRadius: 8,
                        ),
                        BoxShadow(
                          color: palette.emerald.withValues(alpha: 0.12),
                          blurRadius: 50,
                          spreadRadius: 12,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: <Color>[
                              palette.emerald.withValues(alpha: 0.35),
                              palette.emerald.withValues(alpha: 0.12),
                            ],
                          ),
                          border: Border.all(
                            color: palette.gold.withValues(alpha: 0.3),
                            width: 1.5,
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: palette.emerald.withValues(alpha: 0.2),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Center(
                          child: HajjIcon(
                            type: data.icon,
                            color: palette.gold,
                            size: 62,
                            strokeWidth: 4.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: _IntroSpark(color: palette.gold, size: 12),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 6,
                    child: _IntroSpark(color: palette.emerald, size: 9),
                  ),
                  Positioned(
                    top: 55,
                    left: 10,
                    child: _IntroSpark(
                      color: palette.gold.withValues(alpha: 0.6),
                      size: 8,
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    right: 16,
                    child: _IntroSpark(
                      color: palette.emerald.withValues(alpha: 0.6),
                      size: 7,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            if (data.arabicQuote != null) ...<Widget>[
              Text(
                data.arabicQuote!,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: GoogleFonts.amiri(
                  color: palette.gold.withValues(alpha: 0.85),
                  fontSize: 28,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 4),
            ],
            if (data.verse != null) ...<Widget>[
              Container(
                constraints: const BoxConstraints(maxWidth: 500),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: palette.gold.withValues(alpha: 0.12),
                    width: 0.8,
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      data.verse!,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.amiri(
                        color: palette.gold.withValues(alpha: 0.85),
                        fontSize: 22,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      data.verseRef!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.55),
                        fontSize: 11.5,
                        height: 1.4,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
            ],
            Container(
              constraints: const BoxConstraints(maxWidth: 500),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: palette.gold.withValues(alpha: 0.12),
                  width: 0.8,
                ),
              ),
              child: Text(
                data.titleContent,
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  color: colors.onSurface,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            const SizedBox(height: 14),
Container(
              constraints: const BoxConstraints(maxWidth: 500),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                data.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontSize: 15.5,
                  height: 1.65,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IntroSpark extends StatelessWidget {
  const _IntroSpark({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: color.withValues(alpha: 0.65),
            blurRadius: 10,
          ),
        ],
      ),
    );
  }
}

class HajiPintarCircularLogo extends StatelessWidget {
  const HajiPintarCircularLogo({
    super.key,
    this.size = 120,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(size * 0.12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: context.hajjColors.gold.withValues(alpha: 0.5),
          width: 2,
        ),
      ),
      child: Center(
        child: Image.asset(
          'assets/images/app_icon.png',
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}