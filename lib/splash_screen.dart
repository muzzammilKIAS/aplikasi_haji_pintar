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
    with SingleTickerProviderStateMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  bool _sudahMula = false;

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
        child: _sudahMula ? _binaPaparanAnimasi() : _binaPaparanMula(),
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
                              width: 168,
                              height: 168,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: palette.gold.withValues(alpha: 0.28),
                                ),
                              ),
                              child: Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: palette.emerald.withValues(
                                    alpha: 0.25,
                                  ),
                                  border: Border.all(
                                    color: palette.emerald.withValues(
                                      alpha: 0.5,
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
                                child: Center(
                                  child: Icon(
                                    Icons.mosque_rounded,
                                    size: 70,
                                    color: palette.gold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 50),

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
                              'Semoga beroleh Haji yang Mabrur',
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
}
