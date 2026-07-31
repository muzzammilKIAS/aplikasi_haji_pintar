import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

import 'theme_controller.dart';
import 'home_dashboard.dart'; // Untuk memanggil HalamanUtama

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
  late Animation<double> _fadeAnimation;
  late Animation<double> _introScaleAnimation;
  late Animation<Offset> _introSlideAnimation;
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
        // Gambar latar belakang
        Image.asset(
          'assets/images/muka_depan.jpg',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(color: palette.gradientStart);
          },
        ),
        // Lapisan gelap transparan
        Container(color: Colors.black.withValues(alpha: 0.40)),
        // Wordmark jenama di bahagian atas skrin
        SafeArea(
          child: Align(
            alignment: const Alignment(0, -0.62),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
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
                const SizedBox(height: 12),
                Text(
                  'HAJI PINTAR',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 26,
                    letterSpacing: 3,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 40,
                  height: 1.4,
                  color: palette.gold.withValues(alpha: 0.6),
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
        // Kedudukan butang dialihkan ke bahagian bawah (0.75)
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
          // Gambar latar belakang penuh skrin untuk paparan kedua
          Image.asset(
            'assets/images/tawaf.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox();
            },
          ),
          // Lapisan gelap supaya tulisan dan ikon nampak jelas
          Container(color: Colors.black.withValues(alpha: 0.65)),
          // Kandungan teks dan butang
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
                            Container(
                              width: 156,
                              height: 156,
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
                                    color: Colors.black.withValues(alpha: 0.24),
                                    blurRadius: 24,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Container(
                                width: 126,
                                height: 126,
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
                                      errorBuilder:
                                          (
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
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Ahlan wa Sahlan\nPara Dhuyufur Rahman',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontSize: 25,
                                    height: 1.4,
                                    letterSpacing: 0.4,
                                  ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Semoga mendapat Haji Mabrur',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 60),

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
                                            const Text(
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
      const _PengenalanData(
        icon: Icons.explore_rounded,
        title: 'Teman persediaan Haji',
        description:
            'HajiPintar membantu anda memahami perjalanan Haji '
            'dengan panduan yang tersusun, ringkas dan mudah dirujuk.',
      ),
      const _PengenalanData(
        icon: Icons.auto_stories_rounded,
        title: 'Belajar dengan lebih yakin',
        description:
            'Akses modul pembelajaran, doa, zikir, kuiz, peta lokasi '
            'serta panduan langkah demi langkah dalam satu aplikasi.',
      ),
      const _PengenalanData(
        icon: Icons.verified_user_rounded,
        title: 'Rujukan yang bertanggungjawab',
        description:
            'Kandungan ini untuk pendidikan dan rujukan umum. '
            'Untuk persoalan hukum khusus, rujuk pembimbing Haji '
            'atau pihak berautoriti.',
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
                        Image.asset(
                          'assets/images/app_icon.png',
                          width: 46,
                          height: 46,
                          errorBuilder:
                              (
                                BuildContext context,
                                Object error,
                                StackTrace? stackTrace,
                              ) {
                                return Icon(
                                  Icons.mosque_rounded,
                                  color: palette.gold,
                                  size: 36,
                                );
                              },
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
                    const SizedBox(height: 24),
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
  });

  final IconData icon;
  final String title;
  final String description;
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
            Container(
              width: 178,
              height: 178,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: palette.emerald.withValues(alpha: 0.22),
                border: Border.all(
                  color: palette.gold.withValues(alpha: 0.5),
                  width: 1.5,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: palette.emerald.withValues(alpha: 0.35),
                    blurRadius: 40,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: Icon(data.icon, color: palette.gold, size: 78),
            ),
            const SizedBox(height: 38),
            Text(
              data.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                color: colors.onSurface,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              data.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.82),
                fontSize: 16,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
