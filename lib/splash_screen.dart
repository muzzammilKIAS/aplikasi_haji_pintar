import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

import 'theme_controller.dart';
import 'home_dashboard.dart';
import 'islamic_icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({required this.themeController, super.key});

  final ThemeController themeController;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();
  late AnimationController _animationController;
  late AnimationController _introAnimationController;
  late AnimationController _crescentAnimationController;
  late AnimationController _orbitAnimationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _introScaleAnimation;
  late Animation<Offset> _introSlideAnimation;
  late Animation<double> _crescentRotation;
  late Animation<double> _orbitRotation;
  late Animation<double> _glowPulse;
  late final PageController _introPageController;

  bool _sudahMula = false;
  bool _paparPengenalan = false;
  int _introPage = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _introAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    )..forward();
    final CurvedAnimation introCurve = CurvedAnimation(
      parent: _introAnimationController,
      curve: Curves.easeOutCubic,
    );
    _introScaleAnimation = Tween<double>(
      begin: 0.88,
      end: 1,
    ).animate(introCurve);
    _introSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(introCurve);

    _crescentAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 8000),
    )..repeat();
    _crescentRotation = Tween<double>(begin: 0, end: 2 * math.pi).animate(
      CurvedAnimation(
        parent: _crescentAnimationController,
        curve: Curves.linear,
      ),
    );

    _orbitAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..repeat();
    _orbitRotation = Tween<double>(begin: 0, end: 2 * math.pi).animate(
      CurvedAnimation(
        parent: _orbitAnimationController,
        curve: Curves.linear,
      ),
    );

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

    try {
      await _audioPlayer.play(AssetSource('audio/ahlan.mp3'));
    } catch (e) {
      debugPrint("Ralat memainkan audio: $e");
    }
  }

  void _masukKeAplikasi() {
    _audioPlayer.stop();
    setState(() {
      _paparPengenalan = true;
    });
    _introAnimationController.forward(from: 0);
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

  @override
  void dispose() {
    _audioPlayer.dispose();
    _animationController.dispose();
    _introAnimationController.dispose();
    _crescentAnimationController.dispose();
    _orbitAnimationController.dispose();
    _introPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic palette = context.hajjColors;

    return Scaffold(
      body: Container(
        width: double.infinity,
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
        child: !_sudahMula
            ? _binaPaparanMula()
            : _paparPengenalan
            ? _binaPengenalan()
            : _binaPaparanAnimasi(),
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
        Positioned(
          top: 8,
          right: 16,
          child: RotationTransition(
            turns: _crescentRotation,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withValues(alpha: 0.25),
              ),
              child: HajjIcon(
                type: HajjIconType.crescent,
                color: palette.gold.withValues(alpha: 0.85),
                size: 20,
                strokeWidth: 3,
              ),
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: 20,
          child: Opacity(
            opacity: 0.30,
            child: Transform.rotate(
              angle: -0.3,
              child: HajjIcon(
                type: HajjIconType.star,
                color: palette.gold,
                size: 16,
                strokeWidth: 2.5,
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          right: 40,
          child: Opacity(
            opacity: 0.22,
            child: Transform.rotate(
              angle: 0.5,
              child: HajjIcon(
                type: HajjIconType.star,
                color: palette.gold,
                size: 12,
                strokeWidth: 2,
              ),
            ),
          ),
        ),
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
                  'Panduan Digital Haji & Umrah',
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
        Align(
          alignment: const Alignment(0, 0.48),
          child: Text(
            'Dalil: Surah Al-Hajj (22):27',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.35),
              fontSize: 11,
              fontStyle: FontStyle.italic,
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

  Widget _binaPaparanAnimasi() {
    final dynamic palette = context.hajjColors;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/tawaf.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox();
            },
          ),
          Container(color: Colors.black.withValues(alpha: 0.65)),
          SafeArea(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 24,
                          horizontal: 20,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                AnimatedBuilder(
                                  animation: _orbitRotation,
                                  builder: (
                                    BuildContext context,
                                    Widget? child,
                                  ) {
                                    return Transform.rotate(
                                      angle: _orbitRotation.value,
                                      child: Container(
                                        width: 190,
                                        height: 190,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: palette.gold.withValues(
                                              alpha: 0.25,
                                            ),
                                            width: 1.2,
                                          ),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              color: palette.gold
                                                  .withValues(alpha: 0.12),
                                              blurRadius: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                AnimatedBuilder(
                                  animation: _orbitRotation,
                                  builder: (
                                    BuildContext context,
                                    Widget? child,
                                  ) {
                                    return Transform.rotate(
                                      angle: -_orbitRotation.value * 0.7,
                                      child: Container(
                                        width: 200,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: palette.emerald.withValues(
                                              alpha: 0.18,
                                            ),
                                            width: 0.8,
                                          ),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              color: palette.emerald
                                                  .withValues(alpha: 0.08),
                                              blurRadius: 24,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Container(
                                  width: 180,
                                  height: 180,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withValues(alpha: 0.08),
                                    border: Border.all(
                                      color: palette.gold.withValues(alpha: 0.42),
                                      width: 1.5,
                                    ),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.black
                                            .withValues(alpha: 0.24),
                                        blurRadius: 24,
                                        offset: const Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: palette.emerald.withValues(
                                        alpha: 0.28,
                                      ),
                                      border: Border.all(
                                        color: palette.emerald.withValues(
                                          alpha: 0.65,
                                        ),
                                        width: 2,
                                      ),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: palette.emerald.withValues(
                                            alpha: 0.3,
                                          ),
                                          blurRadius: 40,
                                          spreadRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14),
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/images/app_icon.png',
                                          fit: BoxFit.cover,
                                          errorBuilder: (
                                            BuildContext context,
                                            Object error,
                                            StackTrace? stackTrace,
                                          ) {
                                            return Icon(
                                              Icons.mosque_rounded,
                                              size: 62,
                                              color: palette.gold,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 34),
                            Text(
                              'أَهْلاً وَسَهْلاً',
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.amiri(
                                color: palette.gold,
                                fontSize: 46,
                                fontWeight: FontWeight.bold,
                                height: 1.4,
                                shadows: <Shadow>[
                                  Shadow(
                                    color: Colors.black.withValues(alpha: 0.3),
                                    blurRadius: 12,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Ahlan wa Sahlan\nPara Dhuyufur Rahman',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontSize: 25,
                                    height: 1.4,
                                    letterSpacing: 0.4,
                                  ),
                            ),
                            const SizedBox(height: 14),
                            Container(
                              constraints: const BoxConstraints(maxWidth: 360),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.06),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: palette.gold.withValues(alpha: 0.15),
                                  width: 0.8,
                                ),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'وَأَذِّن فِي مَكَّةَ لِلنَّاسِ',
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
                                    'Surah Al-Hajj (22):27 — Seruan kepada kaum untuk menunaikan haji',
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
                            const SizedBox(height: 12),
                            Container(
                              constraints: const BoxConstraints(maxWidth: 360),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.06),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: palette.emerald.withValues(alpha: 0.15),
                                  width: 0.8,
                                ),
                              ),
                              child: Row(
                                children: <Widget>[
                                  HajjIcon(
                                    type: HajjIconType.doa,
                                    color: palette.emerald,
                                    size: 18,
                                    strokeWidth: 3,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      'Hadith: "Siapa yang berihram demi Allah,\nAllah akan bebaskannya dari neraka."',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white.withValues(alpha: 0.55),
                                        fontSize: 11.5,
                                        height: 1.5,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 10,
                                  sigmaY: 10,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: palette.glassSurface,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: palette.glassBorder,
                                    ),
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: _masukKeAplikasi,
                                      borderRadius: BorderRadius.circular(30),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 32,
                                          vertical: 16,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              'Masuk ke Papan Pemuka',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Icon(
                                              Icons.arrow_forward_rounded,
                                              color: palette.emerald,
                                            ),
                                          ],
                                        ),
                                      ),
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
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _binaPengenalan() {
    final dynamic palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;
    final List<_PengenalanData> pages = <_PengenalanData>[
      _PengenalanData(
        icon: HajjIconType.guide,
        title: 'Teman Persediaan Haji',
        description:
            'HajiPintar membantu anda memahami perjalanan Haji '
            'dengan panduan yang tersusun, ringkas dan mudah dirujuk.',
        tip: 'Mulakan persiapan minatab dengan niat yang ikhlas\n'
             'dan ilmu yang cukup sebelum berlepas.',
        fact: 'Haji wajib dilakukan sekurang-kurangnya '
              'sekali dalam hidup seorang Muslim.',
      ),
      _PengenalanData(
        icon: HajjIconType.learning,
        title: 'Belajar dengan Lebih Yakin',
        description:
            'Akses modul pembelajaran, doa, zikir, kuiz, peta lokasi '
            'serta panduan langkah demi langkah dalam satu aplikasi.',
        tip: 'Gunakan modul doa dan zikir setiap hari '
             'untuk meningkatkan keimanan dan ketenangan.',
        fact: 'Doa Arafah yang dibaca di Padang Arafah '
              'adalah doa yang paling utama dalam Haji.',
      ),
      _PengenalanData(
        icon: HajjIconType.rukun,
        title: 'Rujukan yang Bertanggungjawab',
        description:
            'Kandungan ini untuk pendidikan dan rujukan umum. '
            'Untuk persoalan hukum khusus, rujuk pembimbing Haji '
            'atau pihak berautoriti.',
        tip: 'Simpan nombor bantuan kedutaan dan '
             'pembimbing Haji di tempat yang mudah diakses.',
        fact: 'Haji mengukuhkan semangat ukhuwwah '
              'Persatuan dan persaudaraan sesama umat.',
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
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: palette.gold.withValues(alpha: 0.3),
                              width: 1,
                            ),
                          ),
                          child: Image.asset(
                            'assets/images/app_icon.png',
                            width: 42,
                            height: 42,
                            errorBuilder:
                                (
                                  BuildContext context,
                                  Object error,
                                  StackTrace? stackTrace,
                                ) {
                                  return HajjIcon(
                                    type: HajjIconType.mosque,
                                    color: palette.gold,
                                    size: 30,
                                    strokeWidth: 2.5,
                                  );
                                },
                          ),
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
                            _masukKeDashboard();
                          }
                        },
                        child: Text(
                          _introPage < pages.length - 1
                              ? 'Seterusnya'
                              : 'Mula Guna HajiPintar',
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: _masukKeDashboard,
                      child: Text(
                        'Langkau pengenalan',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.75),
                        ),
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
          final double pulse = 0.92 + (_introAnimationController.value * 0.08);
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
    required this.description,
    required this.tip,
    required this.fact,
  });

  final HajjIconType icon;
  final String title;
  final String description;
  final String tip;
  final String fact;
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
                data.title,
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
            const SizedBox(height: 18),
            Container(
              constraints: const BoxConstraints(maxWidth: 500),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: palette.emerald.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: palette.emerald.withValues(alpha: 0.2),
                  width: 0.8,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(
                      Icons.lightbulb_rounded,
                      color: palette.gold,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      data.tip,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.78),
                        fontSize: 13.5,
                        height: 1.55,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              constraints: const BoxConstraints(maxWidth: 500),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: palette.gold.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: palette.gold.withValues(alpha: 0.18),
                  width: 0.8,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(
                      Icons.emoji_objects_rounded,
                      color: palette.emerald,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      data.fact,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.72),
                        fontSize: 13.5,
                        height: 1.55,
                      ),
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