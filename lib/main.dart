import 'splash_screen.dart'; // Tambahkan baris ini
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'app_theme.dart';
import 'certificate_screen.dart';
import 'hajj_journey_viewer.dart';
import 'islamic_icons.dart';
import 'hajj_guide_screen.dart';
import 'final_assessment_screen.dart';
import 'learning_module_screen.dart';
import 'offline_map_screen.dart';
import 'sai_counter_screen.dart';
import 'theme_controller.dart';

late Box<dynamic> tawafBox;
late Box<dynamic> saiBox;
late Box<dynamic> settingsBox;
late Box<dynamic> guideBox;
late Box<dynamic> assessmentBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  tawafBox = await Hive.openBox<dynamic>('tawaf_progress');
  saiBox = await Hive.openBox<dynamic>('sai_progress');
  settingsBox = await Hive.openBox<dynamic>('app_settings');
  guideBox = await Hive.openBox<dynamic>('hajj_guide_progress');
  assessmentBox = await Hive.openBox<dynamic>('hajj_assessment_progress');

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
          title: 'Aplikasi Haji Pintar',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeController.themeMode,
          home: SplashScreen(themeController: themeController),
        );
      },
    );
  }
}

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({required this.themeController, super.key});

  final ThemeController themeController;

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
          return LearningModuleScreen(assessmentBox: assessmentBox);
        },
      ),
    );
  }

  void _bukaPenilaianAkhir(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) {
          return FinalAssessmentScreen(assessmentBox: assessmentBox);
        },
      ),
    );
  }

  void _bukaSijil(BuildContext context) {
    final dynamic savedScore = assessmentBox.get('best_score', defaultValue: 0);

    final int score = savedScore is int ? savedScore : 0;

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) {
          return CertificateScreen(assessmentBox: assessmentBox, score: score);
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

  void _bukaSOS(BuildContext context) {
    final ColorScheme colors = context.appColorScheme;
    final HajjColors palette = context.hajjColors;

    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Row(
            children: <Widget>[
              HajjIcon(
                type: HajjIconType.emergency,
                color: palette.danger,
                size: 28,
              ),
              const SizedBox(width: 12),
              const Text('SOS Kecemasan'),
            ],
          ),
          content: const Text(
            'Ini masih prototaip. GPS dan penghantaran '
            'amaran Firebase belum diaktifkan.',
          ),
          actions: <Widget>[
            FilledButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Saya faham'),
            ),
          ],
        );
      },
    );

    // Elakkan analyzer menganggap colors tidak digunakan jika
    // dialog theme berubah pada versi Flutter tertentu.
    assert(colors.surface != Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 320),
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
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -130,
              right: -100,
              child: GlowCircle(
                size: 320,
                color: palette.emerald.withValues(alpha: 0.13),
              ),
            ),
            Positioned(
              bottom: -180,
              left: -130,
              child: GlowCircle(
                size: 380,
                color: palette.gold.withValues(alpha: 0.12),
              ),
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
                        DashboardHeader(themeController: themeController),
                        const SizedBox(height: 28),
                        const HeroPanel(),
                        const SizedBox(height: 34),
                        const SectionTitle(),
                        const SizedBox(height: 16),
                        LayoutBuilder(
                          builder:
                              (
                                BuildContext context,
                                BoxConstraints constraints,
                              ) {
                                return _buildFeatureGrid(
                                  context,
                                  constraints.maxWidth,
                                );
                              },
                        ),
                        const SizedBox(height: 32),
                        const HajjJourneyBox(),
                        const SizedBox(height: 32),
                        LearningModulePanel(
                          onTap: () {
                            _bukaModulBelajar(context);
                          },
                        ),
                        const SizedBox(height: 32),
                        AssessmentPanel(
                          onTap: () {
                            final bool passed =
                                assessmentBox.get(
                                  'passed',
                                  defaultValue: false,
                                ) ==
                                true;

                            if (passed) {
                              _bukaSijil(context);
                            } else {
                              _bukaPenilaianAkhir(context);
                            }
                          },
                        ),
                        const SizedBox(height: 32),
                        HajjGuidePanel(
                          onTap: () {
                            _bukaPanduanHaji(context);
                          },
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

  Widget _buildFeatureGrid(BuildContext context, double width) {
    int columns = 1;

    if (width >= 1000) {
      columns = 4;
    } else if (width >= 620) {
      columns = 2;
    }

    const double spacing = 16;
    final double cardWidth = (width - spacing * (columns - 1)) / columns;

    final HajjColors palette = context.hajjColors;

    final List<FeatureData> features = <FeatureData>[
      FeatureData(
        number: '01',
        title: 'Kaunter Tawaf',
        description: 'Rekod tujuh pusingan dengan paparan kemajuan.',
        icon: HajjIconType.tawaf,
        accent: palette.emerald,
        onTap: () => _bukaTawaf(context),
      ),
      FeatureData(
        number: '02',
        title: 'Kaunter Sa’i',
        description: 'Panduan perjalanan antara Safa dan Marwah.',
        icon: HajjIconType.sai,
        accent: const Color(0xFF4B8CCB),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) {
                return SaiCounterScreen(saiBox: saiBox);
              },
            ),
          );
        },
      ),
      FeatureData(
        number: '03',
        title: 'Peta Offline',
        description: 'Akses peta Mina dan Arafah tanpa internet.',
        icon: HajjIconType.map,
        accent: palette.gold,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) {
                return const OfflineMapScreen();
              },
            ),
          );
        },
      ),
      FeatureData(
        number: 'SOS',
        title: 'Kecemasan',
        description: 'Hantar lokasi semasa kepada mutawwif.',
        icon: HajjIconType.emergency,
        accent: palette.danger,
        onTap: () => _bukaSOS(context),
      ),
    ];

    return Wrap(
      spacing: spacing,
      runSpacing: spacing,
      children: features.map((FeatureData feature) {
        return SizedBox(
          width: cardWidth,
          child: FeatureCard(data: feature),
        );
      }).toList(),
    );
  }
}

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({required this.themeController, super.key});

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
                  subtitle: 'Paparan ivory, putih dan hijau lembut.',
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
                  subtitle: 'Paparan hijau gelap yang redup.',
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
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Row(
      children: <Widget>[
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[palette.emerald, colors.primaryContainer],
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: palette.emerald.withValues(alpha: 0.23),
                blurRadius: 22,
              ),
            ],
          ),
          child: HajjIcon(
            type: HajjIconType.mosque,
            color: palette.onAccent,
            size: 29,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'HAJI PINTAR',
                style: TextStyle(
                  color: colors.onSurface,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
              Text(
                'Smart Pilgrimage Companion',
                style: TextStyle(color: palette.mutedText, fontSize: 12),
              ),
            ],
          ),
        ),
        GlassButton(
          tooltip: 'Tukar tema',
          icon: themeController.themeMode == ThemeMode.dark
              ? Icons.dark_mode_rounded
              : themeController.themeMode == ThemeMode.light
              ? Icons.light_mode_rounded
              : Icons.brightness_auto_rounded,
          onPressed: () {
            _bukaPilihanTheme(context);
          },
        ),
        const SizedBox(width: 10),
        CircleAvatar(
          radius: 22,
          backgroundColor: palette.softSurface,
          child: Text(
            'U',
            style: TextStyle(color: palette.gold, fontWeight: FontWeight.w900),
          ),
        ),
      ],
    );
  }
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

class HeroPanel extends StatelessWidget {
  const HeroPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return GlassContainer(
      borderRadius: 30,
      padding: const EdgeInsets.all(26),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool compact = constraints.maxWidth < 700;

          final Widget information = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StatusPill(
                hajjIcon: HajjIconType.doa,
                label: 'Perjalanan spiritual anda',
                accentColor: palette.gold,
              ),
              const SizedBox(height: 22),
              Text(
                'Assalamualaikum,\nSelamat Datang.',
                style: TextStyle(
                  color: colors.onSurface,
                  fontSize: 34,
                  height: 1.1,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.2,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'Panduan digital yang membantu perjalanan '
                'ibadah anda lebih tersusun, selamat dan tenang.',
                style: TextStyle(
                  color: palette.mutedText,
                  fontSize: 15,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 24),
              const Wrap(
                spacing: 10,
                runSpacing: 10,
                children: <Widget>[
                  MiniInformation(
                    icon: Icons.location_on_outlined,
                    label: 'Makkah',
                  ),
                  MiniInformation(icon: Icons.wifi_rounded, label: 'Online'),
                  MiniInformation(
                    icon: Icons.verified_user_outlined,
                    label: 'Jemaah',
                  ),
                ],
              ),
            ],
          );

          final Widget visual = Container(
            width: compact ? double.infinity : 230,
            height: 220,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: <Color>[
                  palette.emerald.withValues(alpha: 0.20),
                  Colors.transparent,
                ],
              ),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: palette.emerald.withValues(alpha: 0.24),
                    ),
                  ),
                ),
                Container(
                  width: 125,
                  height: 125,
                  decoration: BoxDecoration(
                    color: palette.softSurface,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: palette.emerald.withValues(alpha: 0.38),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: palette.emerald.withValues(alpha: 0.20),
                        blurRadius: 35,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/muka_depan.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // Kembali ke ikon asal jika gambar tiada
                        return HajjIcon(
                          type: HajjIconType.kaaba,
                          color: palette.gold,
                          size: 70,
                          strokeWidth: 4.2,
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  right: 28,
                  top: 35,
                  child: GlowDot(size: 10, color: palette.emerald),
                ),
                Positioned(
                  left: 26,
                  bottom: 45,
                  child: GlowDot(size: 7, color: palette.gold),
                ),
              ],
            ),
          );

          if (compact) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                information,
                const SizedBox(height: 18),
                visual,
              ],
            );
          }

          return Row(
            children: <Widget>[
              Expanded(child: information),
              const SizedBox(width: 24),
              visual,
            ],
          );
        },
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Pusat Ibadah',
                style: TextStyle(
                  color: colors.onSurface,
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Akses pantas kepada fungsi utama.',
                style: TextStyle(color: palette.mutedText),
              ),
            ],
          ),
        ),
        const StatusPill(icon: Icons.cloud_done_rounded, label: 'Sistem aktif'),
      ],
    );
  }
}

class FeatureData {
  const FeatureData({
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
    required this.accent,
    required this.onTap,
  });

  final String number;
  final String title;
  final String description;
  final HajjIconType icon;
  final Color accent;
  final VoidCallback onTap;
}

class FeatureCard extends StatefulWidget {
  const FeatureCard({required this.data, super.key});

  final FeatureData data;

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final Color accent = widget.data.accent;
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          hovering = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform: Matrix4.translationValues(0, hovering ? -6 : 0, 0),
        child: GlassContainer(
          borderRadius: 24,
          borderColor: hovering
              ? accent.withValues(alpha: 0.46)
              : palette.glassBorder,
          padding: EdgeInsets.zero,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: widget.data.onTap,
              child: Padding(
                padding: const EdgeInsets.all(21),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            color: accent.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: accent.withValues(alpha: 0.28),
                            ),
                          ),
                          child: HajjIcon(
                            type: widget.data.icon,
                            color: accent,
                            size: 29,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          widget.data.number,
                          style: TextStyle(
                            color: accent.withValues(alpha: 0.78),
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      widget.data.title,
                      style: TextStyle(
                        color: colors.onSurface,
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.data.description,
                      style: TextStyle(
                        color: palette.mutedText,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 22),
                    Row(
                      children: <Widget>[
                        Text(
                          widget.data.number == 'SOS'
                              ? 'Buka SOS'
                              : 'Buka fungsi',
                          style: TextStyle(
                            color: accent,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: accent,
                          size: 18,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HajjJourneyBox extends StatefulWidget {
  const HajjJourneyBox({super.key});

  @override
  State<HajjJourneyBox> createState() => _HajjJourneyBoxState();
}

class _HajjJourneyBoxState extends State<HajjJourneyBox> {
  int selectedTab = 0;

  static const List<String> tabTitles = <String>[
    'Tatacara',
    'Tempat',
    'Rukun',
    'Wajib',
  ];

  static const List<List<String>> tabContents = <List<String>>[
    <String>[
      'Berniat ihram Haji di miqat.',
      'Berwukuf di Arafah.',
      'Bermalam di Muzdalifah.',
      'Melontar Jamrah Kubra dan bertahallul.',
      'Melaksanakan Tawaf Ifadah dan Sa’i.',
      'Bermalam di Mina dan melontar jamrah.',
      'Melaksanakan Tawaf Wada’ sebelum meninggalkan Makkah.',
    ],
    <String>[
      'Masjidil Haram — lokasi pelaksanaan Tawaf.',
      'Safa dan Marwah — lokasi pelaksanaan Sa’i.',
      'Arafah — lokasi pelaksanaan wukuf.',
      'Muzdalifah — tempat bermalam selepas wukuf.',
      'Mina — lokasi melontar jamrah dan bermalam.',
      'Miqat — sempadan untuk memulakan niat ihram.',
    ],
    <String>[
      'Niat ihram Haji.',
      'Wukuf di Arafah.',
      'Tawaf Ifadah.',
      'Sa’i antara Safa dan Marwah.',
      'Bercukur atau bergunting.',
      'Tertib pada kebanyakan rukun.',
    ],
    <String>[
      'Berniat ihram di miqat.',
      'Menjaga larangan semasa dalam ihram.',
      'Bermalam di Muzdalifah.',
      'Melontar Jamrah Kubra.',
      'Bermalam di Mina.',
      'Melontar ketiga-tiga jamrah.',
      'Melaksanakan Tawaf Wada’.',
    ],
  ];

  void _bukaInfografikTatacara() {
    Navigator.of(context).push(
      PageRouteBuilder<void>(
        transitionDuration: const Duration(milliseconds: 450),
        reverseTransitionDuration: const Duration(milliseconds: 320),
        pageBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return const HajjJourneyViewer();
            },
        transitionsBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              final Animation<double> smoothAnimation = CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              );

              return FadeTransition(
                opacity: smoothAnimation,
                child: ScaleTransition(
                  scale: Tween<double>(
                    begin: 0.96,
                    end: 1,
                  ).animate(smoothAnimation),
                  child: child,
                ),
              );
            },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius: 30,
      padding: EdgeInsets.zero,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool mobile = constraints.maxWidth < 760;

          final Widget imageSection = _buildImageSection(context, mobile);

          final Widget informationSection = _buildInformationSection(context);

          if (mobile) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[imageSection, informationSection],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 360, child: imageSection),
              Expanded(child: informationSection),
            ],
          );
        },
      ),
    );
  }

  Widget _buildImageSection(BuildContext context, bool mobile) {
    final HajjColors palette = context.hajjColors;

    return SizedBox(
      height: mobile ? 260 : 500,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(30),
              topRight: Radius.circular(mobile ? 30 : 0),
              bottomLeft: Radius.circular(mobile ? 0 : 30),
            ),
            child: Image.asset(
              context.isDarkMode
                  ? 'assets/images/kaabah_dark.jpg'
                  : 'assets/images/kaabah_light.jpg',
              fit: BoxFit.cover,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            palette.softSurface,
                            palette.gradientEnd,
                          ],
                        ),
                      ),
                      child: Center(
                        child: HajjIcon(
                          type: HajjIconType.kaaba,
                          color: palette.gold,
                          size: 92,
                          strokeWidth: 4.2,
                        ),
                      ),
                    );
                  },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(30),
                topRight: Radius.circular(mobile ? 30 : 0),
                bottomLeft: Radius.circular(mobile ? 0 : 30),
              ),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.transparent,
                  Color(0x33000000),
                  Color(0xD9000000),
                ],
              ),
            ),
          ),
          Positioned(
            top: 22,
            left: 22,
            child: StatusPill(
              hajjIcon: HajjIconType.guide,
              label: 'Panduan Haji',
              accentColor: palette.gold,
            ),
          ),
          const Positioned(
            left: 24,
            right: 24,
            bottom: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'PERJALANAN HAJI',
                  style: TextStyle(
                    color: Color(0xFFF0D38C),
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Panduan Menuju\nHaji Mabrur',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    height: 1.12,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 11),
                Text(
                  'Panduan ringkas perjalanan, lokasi '
                  'dan pelaksanaan ibadah Haji.',
                  style: TextStyle(color: Color(0xFFDCE5E2), height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInformationSection(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Padding(
      padding: const EdgeInsets.all(26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Panduan Perjalanan',
            style: TextStyle(
              color: colors.onSurface,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Pilih kategori untuk melihat maklumat.',
            style: TextStyle(color: palette.mutedText),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List<Widget>.generate(tabTitles.length, (int index) {
              final bool selected = selectedTab == index;

              return InkWell(
                onTap: () {
                  setState(() {
                    selectedTab = index;
                  });
                },
                borderRadius: BorderRadius.circular(50),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: selected ? palette.emerald : palette.glassSurface,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: selected ? palette.emerald : palette.glassBorder,
                    ),
                  ),
                  child: Text(
                    tabTitles[index],
                    style: TextStyle(
                      color: selected ? palette.onAccent : colors.onSurface,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 24),
          if (selectedTab == 0) ...<Widget>[
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _bukaInfografikTatacara,
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: palette.gold.withValues(alpha: 0.09),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: palette.gold.withValues(alpha: 0.26),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Image.asset(
                          'assets/images/journey.jpg',
                          width: 100,
                          height: 72,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (
                                BuildContext context,
                                Object error,
                                StackTrace? stackTrace,
                              ) {
                                return Container(
                                  width: 100,
                                  height: 72,
                                  alignment: Alignment.center,
                                  color: palette.softSurface,
                                  child: HajjIcon(
                                    type: HajjIconType.guide,
                                    color: palette.gold,
                                    size: 28,
                                  ),
                                );
                              },
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Lihat Infografik Tatacara Haji',
                              style: TextStyle(
                                color: colors.onSurface,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Tekan untuk buka, zoom dan gerakkan gambar.',
                              style: TextStyle(
                                color: palette.mutedText,
                                fontSize: 12,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(Icons.open_in_full_rounded, color: palette.gold),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 220),
            child: Column(
              key: ValueKey<int>(selectedTab),
              children: List<Widget>.generate(tabContents[selectedTab].length, (
                int index,
              ) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 28,
                        height: 28,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: palette.emerald.withValues(alpha: 0.11),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: palette.emerald.withValues(alpha: 0.26),
                          ),
                        ),
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: palette.emerald,
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          tabContents[selectedTab][index],
                          style: TextStyle(
                            color: colors.onSurface,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: palette.gold.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: palette.gold.withValues(alpha: 0.20)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.info_outline_rounded, color: palette.gold, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Kandungan ini ialah ringkasan prototaip. '
                    'Semak kandungan akhir bersama pembimbing '
                    'Haji atau panel syariah.',
                    style: TextStyle(
                      color: palette.mutedText,
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LearningModulePanel extends StatelessWidget {
  const LearningModulePanel({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return GlassContainer(
      borderRadius: 24,
      padding: const EdgeInsets.all(22),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool compact = constraints.maxWidth < 650;

          final Widget information = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: palette.emerald.withValues(alpha: 0.11),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: HajjIcon(
                      type: HajjIconType.learning,
                      color: palette.emerald,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Modul Belajar Haji',
                          style: TextStyle(
                            color: colors.onSurface,
                            fontSize: 19,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Belajar asas, rukun, wajib, '
                          'larangan ihram, dam dan doa.',
                          style: TextStyle(
                            color: palette.mutedText,
                            height: 1.45,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: <Widget>[
                  _LearningTopicChip(
                    label: 'Asas Haji',
                    color: palette.emerald,
                  ),
                  _LearningTopicChip(
                    label: 'Rukun & Wajib',
                    color: palette.gold,
                  ),
                  const _LearningTopicChip(
                    label: 'Doa & Zikir',
                    color: Color(0xFF4B8CCB),
                  ),
                ],
              ),
            ],
          );

          final Widget button = SizedBox(
            height: 52,
            child: FilledButton.icon(
              onPressed: onTap,
              icon: HajjIcon(
                type: HajjIconType.learning,
                color: palette.onAccent,
                size: 22,
                strokeWidth: 5,
              ),
              label: const Text('Mula Belajar'),
            ),
          );

          if (compact) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                information,
                const SizedBox(height: 20),
                button,
              ],
            );
          }

          return Row(
            children: <Widget>[
              Expanded(child: information),
              const SizedBox(width: 24),
              button,
            ],
          );
        },
      ),
    );
  }
}

class _LearningTopicChip extends StatelessWidget {
  const _LearningTopicChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: color.withValues(alpha: 0.22)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class AssessmentPanel extends StatelessWidget {
  const AssessmentPanel({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    final dynamic savedBestScore = assessmentBox.get(
      'best_score',
      defaultValue: 0,
    );

    final int bestScore = savedBestScore is int ? savedBestScore : 0;

    final bool passed =
        assessmentBox.get('passed', defaultValue: false) == true;

    return GlassContainer(
      borderRadius: 24,
      padding: const EdgeInsets.all(22),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool compact = constraints.maxWidth < 650;

          final Widget information = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: palette.gold.withValues(alpha: 0.11),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: HajjIcon(
                        type: HajjIconType.quiz,
                        color: palette.gold,
                        size: 25,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Penilaian Akhir',
                          style: TextStyle(
                            color: colors.onSurface,
                            fontSize: 19,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Jawab 20 soalan dan capai '
                          'sekurang-kurangnya 80%.',
                          style: TextStyle(
                            color: palette.mutedText,
                            height: 1.45,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: <Widget>[
                  _AssessmentTopicChip(label: '20 soalan', color: palette.gold),
                  _AssessmentTopicChip(
                    label: 'Lulus 80%',
                    color: palette.emerald,
                  ),
                  _AssessmentTopicChip(
                    label: passed ? 'Layak sijil' : 'Terbaik $bestScore%',
                    color: passed ? palette.emerald : const Color(0xFF4B8CCB),
                  ),
                ],
              ),
            ],
          );

          final Widget button = SizedBox(
            height: 52,
            child: FilledButton.icon(
              onPressed: onTap,
              icon: Icon(
                passed ? Icons.workspace_premium_rounded : Icons.quiz_rounded,
              ),
              label: Text(passed ? 'Lihat Sijil' : 'Mula Penilaian'),
            ),
          );

          if (compact) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                information,
                const SizedBox(height: 20),
                button,
              ],
            );
          }

          return Row(
            children: <Widget>[
              Expanded(child: information),
              const SizedBox(width: 24),
              button,
            ],
          );
        },
      ),
    );
  }
}

class _AssessmentTopicChip extends StatelessWidget {
  const _AssessmentTopicChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: color.withValues(alpha: 0.22)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class HajjGuidePanel extends StatelessWidget {
  const HajjGuidePanel({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return GlassContainer(
      borderRadius: 24,
      padding: const EdgeInsets.all(22),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool compact = constraints.maxWidth < 650;

          final Widget information = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: palette.gold.withValues(alpha: 0.11),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: HajjIcon(
                      type: HajjIconType.guide,
                      color: palette.gold,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Panduan Langkah demi Langkah',
                          style: TextStyle(
                            color: colors.onSurface,
                            fontSize: 19,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Ikuti perjalanan dari persediaan '
                          'hingga Tawaf Wada’.',
                          style: TextStyle(
                            color: palette.mutedText,
                            height: 1.45,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: <Widget>[
                  _GuideTopicChip(label: '9 langkah', color: palette.gold),
                  _GuideTopicChip(label: 'Checklist', color: palette.emerald),
                  const _GuideTopicChip(
                    label: 'Offline',
                    color: Color(0xFF4B8CCB),
                  ),
                ],
              ),
            ],
          );

          final Widget button = SizedBox(
            height: 52,
            child: FilledButton.icon(
              onPressed: onTap,
              icon: HajjIcon(
                type: HajjIconType.guide,
                color: palette.onAccent,
                size: 22,
                strokeWidth: 5,
              ),
              label: const Text('Buka Panduan'),
            ),
          );

          if (compact) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                information,
                const SizedBox(height: 20),
                button,
              ],
            );
          }

          return Row(
            children: <Widget>[
              Expanded(child: information),
              const SizedBox(width: 24),
              button,
            ],
          );
        },
      ),
    );
  }
}

class _GuideTopicChip extends StatelessWidget {
  const _GuideTopicChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: color.withValues(alpha: 0.22)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class TawafCounterScreen extends StatefulWidget {
  const TawafCounterScreen({required this.tawafBox, super.key});

  final Box<dynamic> tawafBox;

  @override
  State<TawafCounterScreen> createState() => _TawafCounterScreenState();
}

class _TawafCounterScreenState extends State<TawafCounterScreen> {
  static const int totalRounds = 7;

  int completedRounds = 0;

  int get currentRound =>
      completedRounds >= totalRounds ? totalRounds : completedRounds + 1;

  bool get isCompleted => completedRounds >= totalRounds;

  @override
  void initState() {
    super.initState();

    final dynamic savedValue = widget.tawafBox.get(
      'completedRounds',
      defaultValue: 0,
    );

    if (savedValue is int) {
      completedRounds = savedValue.clamp(0, totalRounds).toInt();
    }
  }

  Future<void> _tambahPusingan() async {
    if (isCompleted) {
      return;
    }

    setState(() {
      completedRounds++;
    });

    await widget.tawafBox.put('completedRounds', completedRounds);
  }

  Future<void> _undurPusingan() async {
    if (completedRounds <= 0) {
      return;
    }

    setState(() {
      completedRounds--;
    });

    await widget.tawafBox.put('completedRounds', completedRounds);
  }

  Future<void> _resetKaunter() async {
    setState(() {
      completedRounds = 0;
    });

    await widget.tawafBox.put('completedRounds', 0);
  }

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;
    final double progress = completedRounds / totalRounds;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 320),
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
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -100,
              right: -100,
              child: GlowCircle(
                size: 300,
                color: palette.emerald.withValues(alpha: 0.13),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 680),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            GlassButton(
                              tooltip: 'Kembali',
                              icon: Icons.arrow_back_rounded,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            Expanded(
                              child: Text(
                                'KAUNTER TAWAF',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: colors.onSurface,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                            GlassButton(
                              tooltip: 'Reset',
                              icon: Icons.restart_alt_rounded,
                              onPressed: _resetKaunter,
                            ),
                          ],
                        ),
                        const SizedBox(height: 34),
                        GlassContainer(
                          borderRadius: 32,
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            children: <Widget>[
                              StatusPill(
                                hajjIcon: HajjIconType.kaaba,
                                label: 'Masjidil Haram',
                                accentColor: palette.gold,
                              ),
                              const SizedBox(height: 28),
                              SizedBox(
                                width: 220,
                                height: 220,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    // BULATAN PROGRES SAHAJA (GAMBAR TELAH DIBUANG)
                                    SizedBox(
                                      width: 210,
                                      height: 210,
                                      child: CircularProgressIndicator(
                                        value: progress,
                                        strokeWidth: 12,
                                        backgroundColor: palette.softSurface,
                                        color: palette.emerald,
                                        strokeCap: StrokeCap.round,
                                      ),
                                    ),
                                    // TEKS NOMBOR
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          isCompleted ? 'SELESAI' : 'PUSINGAN',
                                          style: TextStyle(
                                            color: palette.mutedText,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 2,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '$currentRound',
                                          style: TextStyle(
                                            color: colors.onSurface,
                                            fontSize: 72,
                                            height: 1,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '$completedRounds / '
                                          '$totalRounds selesai',
                                          style: TextStyle(
                                            color: palette.emerald,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),
                              Text(
                                isCompleted
                                    ? 'Alhamdulillah, tujuh pusingan telah direkodkan.'
                                    : 'Tekan butang selepas selesai pusingan $currentRound.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: palette.mutedText,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 28),
                              SizedBox(
                                width: double.infinity,
                                height: 66,
                                child: FilledButton.icon(
                                  onPressed: isCompleted
                                      ? null
                                      : _tambahPusingan,
                                  icon: Icon(
                                    isCompleted
                                        ? Icons.check_circle_rounded
                                        : Icons.touch_app_rounded,
                                  ),
                                  label: Text(
                                    isCompleted
                                        ? 'Tawaf selesai'
                                        : 'Selesai pusingan $currentRound',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              TextButton.icon(
                                onPressed: completedRounds > 0
                                    ? _undurPusingan
                                    : null,
                                icon: const Icon(Icons.undo_rounded),
                                label: const Text('Batalkan pusingan terakhir'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        GlassContainer(
                          borderRadius: 24,
                          padding: const EdgeInsets.all(22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  HajjIcon(
                                    type: HajjIconType.doa,
                                    color: palette.gold,
                                    size: 27,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Doa dan Zikir',
                                    style: TextStyle(
                                      color: colors.onSurface,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'رَبَّنَا آتِنَا فِي الدُّنْيَا '
                                'حَسَنَةً وَفِي الْآخِرَةِ '
                                'حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: colors.onSurface,
                                  fontSize: 23,
                                  height: 2,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Ya Tuhan kami, berikanlah kami '
                                'kebaikan di dunia dan kebaikan '
                                'di akhirat, serta peliharalah '
                                'kami daripada azab neraka.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: palette.mutedText,
                                  height: 1.6,
                                ),
                              ),
                            ],
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
    );
  }
}

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    required this.child,
    required this.borderRadius,
    required this.padding,
    this.borderColor,
    super.key,
  });

  final Widget child;
  final double borderRadius;
  final EdgeInsets padding;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 260),
          padding: padding,
          decoration: BoxDecoration(
            color: palette.glassSurface,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: borderColor ?? palette.glassBorder),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: palette.shadow,
                blurRadius: 32,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

class GlassButton extends StatelessWidget {
  const GlassButton({
    required this.icon,
    this.tooltip,
    this.onPressed,
    super.key,
  });

  final IconData icon;
  final String? tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return IconButton(
      tooltip: tooltip,
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: palette.glassSurface,
        foregroundColor: colors.onSurface,
        fixedSize: const Size(46, 46),
        side: BorderSide(color: palette.glassBorder),
      ),
      icon: Icon(icon),
    );
  }
}

class StatusPill extends StatelessWidget {
  const StatusPill({
    required this.label,
    this.icon,
    this.hajjIcon,
    this.accentColor,
    super.key,
  }) : assert(icon != null || hajjIcon != null, 'Sediakan icon atau hajjIcon.');

  final IconData? icon;
  final HajjIconType? hajjIcon;
  final String label;
  final Color? accentColor;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final Color accent = accentColor ?? palette.emerald;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: accent.withValues(alpha: 0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (hajjIcon != null)
            HajjIcon(type: hajjIcon!, color: accent, size: 17, strokeWidth: 5.2)
          else
            Icon(icon, size: 15, color: accent),
          const SizedBox(width: 7),
          Text(
            label,
            style: TextStyle(
              color: accent,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class MiniInformation extends StatelessWidget {
  const MiniInformation({required this.icon, required this.label, super.key});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
      decoration: BoxDecoration(
        color: palette.glassSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: palette.glassBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 16, color: palette.emerald),
          const SizedBox(width: 7),
          Text(
            label,
            style: TextStyle(
              color: colors.onSurface,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class GlowCircle extends StatelessWidget {
  const GlowCircle({required this.size, required this.color, super.key});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class GlowDot extends StatelessWidget {
  const GlowDot({required this.size, required this.color, super.key});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: <BoxShadow>[
          BoxShadow(color: color, blurRadius: 18, spreadRadius: 3),
        ],
      ),
    );
  }
}
