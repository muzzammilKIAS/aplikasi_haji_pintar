import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijri/hijri_calendar.dart';

import 'app_theme.dart';
import 'final_assessment_screen.dart';
import 'hajj_guide_screen.dart';
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

class DashboardHeroCard extends StatelessWidget {
  const DashboardHeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;

    return GlassContainer(
      borderRadius: 30,
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const HeroPanel(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: HajjOrnamentDivider(
              color: palette.gold.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 22),
          const TimeAndCountdownPanel(),
        ],
      ),
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
          return LearningModuleScreen(
            assessmentBox: assessmentBox,
            certificatesBox: certificatesBox,
          );
        },
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

  void _bukaPeta(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => const OfflineMapScreen(),
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
                        const SizedBox(height: 24),
                        const DashboardHeroCard(),
                        const SizedBox(height: 32),
                        const SectionTitle(title: 'Akses Pantas'),
                        const SizedBox(height: 16),
                        LayoutBuilder(
                          builder: (BuildContext context, BoxConstraints constraints) {
                            return _buildFeatureGrid(context, constraints.maxWidth);
                          },
                        ),
                        const SizedBox(height: 32),
                        const SectionTitle(title: 'Info Perjalanan'),
                        const SizedBox(height: 16),
                        HajjJourneyCompactCard(
                          onOpenGuide: () => _bukaPanduanHaji(context),
                        ),
                        const SizedBox(height: 32),
                        const SectionTitle(title: 'Kemajuan Anda'),
                        const SizedBox(height: 16),
                        AssessmentPanel(
                          onTap: () {
                            final bool passed =
                                assessmentBox.get('passed', defaultValue: false) == true;

                            if (passed) {
                              _bukaSijilSaya(context);
                            } else {
                              _bukaPenilaianAkhir(context);
                            }
                          },
                        ),
                        const SizedBox(height: 48),
                        Center(
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 46,
                                height: 1,
                                color: palette.gold.withValues(alpha: 0.3),
                              ),
                              const SizedBox(height: 14),
                              Text(
                                '© Muzzammil Najib',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: palette.mutedText.withValues(alpha: 0.75),
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
                                  color: palette.mutedText.withValues(alpha: 0.55),
                                  fontSize: 11,
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

  Widget _buildFeatureGrid(BuildContext context, double width) {
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

    final HajjColors palette = context.hajjColors;

    final List<FeatureData> features = <FeatureData>[
      FeatureData(
        title: 'Kaunter Tawaf',
        description: 'Rekod tujuh pusingan dengan paparan kemajuan.',
        icon: HajjIconType.tawaf,
        accent: palette.emerald,
        accentBg: palette.sageSoft,
        onTap: () => _bukaTawaf(context),
      ),
      FeatureData(
        title: 'Kaunter Sa’i',
        description: 'Panduan perjalanan antara Safa dan Marwah.',
        icon: HajjIconType.sai,
        accent: palette.secondaryColor,
        accentBg: palette.secondarySoft,
        onTap: () => _bukaSai(context),
      ),
      FeatureData(
        title: 'Peta Offline',
        description: 'Akses peta Mina dan Arafah tanpa internet.',
        icon: HajjIconType.map,
        accent: const Color(0xFF3D7D9E),
        accentBg: palette.skySoft,
        onTap: () => _bukaPeta(context),
      ),
      FeatureData(
        title: 'Modul Belajar',
        description: 'Asas, rukun, wajib, larangan ihram, dam dan doa.',
        icon: HajjIconType.learning,
        accent: palette.emerald,
        accentBg: palette.sageSoft,
        onTap: () => _bukaModulBelajar(context),
      ),
      FeatureData(
        title: 'Panduan Haji',
        description: 'Ikuti langkah demi langkah dari persediaan hingga Wada’.',
        icon: HajjIconType.guide,
        accent: palette.gold,
        accentBg: palette.sandSoft,
        onTap: () => _bukaPanduanHaji(context),
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
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: palette.gold, width: 1.5),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: palette.emerald.withValues(alpha: 0.23),
                blurRadius: 22,
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
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            'HAJI PINTAR',
            style: GoogleFonts.playfairDisplay(
              color: colors.onSurface,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: 3,
            ),
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

    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 26, 26, 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Assalamualaikum,',
            style: GoogleFonts.playfairDisplay(
              color: palette.gold,
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              height: 1.1,
            ),
          ),
          Text(
            sapaanMengikutMasa(),
            style: GoogleFonts.playfairDisplay(
              color: colors.onSurface,
              fontSize: 36,
              height: 1.15,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: GoogleFonts.playfairDisplay(
            color: colors.onSurface,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                palette.gold.withValues(alpha: 0.4),
                palette.gold.withValues(alpha: 0.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FeatureData {
  const FeatureData({
    required this.title,
    required this.description,
    required this.icon,
    required this.accent,
    required this.accentBg,
    required this.onTap,
  });

  final String title;
  final String description;
  final HajjIconType icon;
  final Color accent;
  final Color accentBg;
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
        setState(() { hovering = true; });
      },
      onExit: (_) {
        setState(() { hovering = false; });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform: Matrix4.translationValues(0, hovering ? -4 : 0, 0),
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
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: widget.data.accentBg,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: widget.data.accent.withValues(alpha: 0.28),
                        ),
                      ),
                      child: HajjIcon(
                        type: widget.data.icon,
                        color: widget.data.accent,
                        size: 27,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      widget.data.title,
                      style: GoogleFonts.playfairDisplay(
                        color: colors.onSurface,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.data.description,
                      style: TextStyle(
                        color: palette.mutedText,
                        fontSize: 13,
                        height: 1.45,
                      ),
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

class HajjJourneyCompactCard extends StatelessWidget {
  const HajjJourneyCompactCard({required this.onOpenGuide, super.key});

  final VoidCallback onOpenGuide;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return GlassContainer(
      borderRadius: 24,
      padding: const EdgeInsets.all(22),
      child: Row(
        children: <Widget>[
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: palette.sandSoft,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: palette.gold.withValues(alpha: 0.24),
              ),
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
                  'Perjalanan Haji',
                  style: GoogleFonts.playfairDisplay(
                    color: colors.onSurface,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Lihat tatacara, lokasi, rukun dan wajib Haji.',
                  style: TextStyle(
                    color: palette.mutedText,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            height: 44,
            child: FilledButton.icon(
              onPressed: onOpenGuide,
              icon: const Icon(Icons.arrow_forward_rounded, size: 20),
              label: const Text('Buka Panduan'),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeAndCountdownPanel extends StatefulWidget {
  const TimeAndCountdownPanel({super.key});

  @override
  State<TimeAndCountdownPanel> createState() => _TimeAndCountdownPanelState();
}

class _TimeAndCountdownPanelState extends State<TimeAndCountdownPanel> {
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
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    final DateTime tarikhSemasa = DateTime(_now.year, _now.month, _now.day);
    final DateTime tarikhSasaran = DateTime(
      _targetHajj.year,
      _targetHajj.month,
      _targetHajj.day,
    );
    final int bakiHari = tarikhSasaran.difference(tarikhSemasa).inDays;

    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 0, 26, 26),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool compact = constraints.maxWidth < 650;

          final Widget tarikhPanel = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _formatTarikhPenuhMasihi(_now),
                style: TextStyle(
                  color: colors.onSurface,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${_hijriNow.hDay} ${_hijriNow.getLongMonthName()} ${_hijriNow.hYear}H',
                style: TextStyle(
                  color: palette.mutedText,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          );

          final Widget countdownHaji = Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: palette.gold.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: palette.gold.withValues(alpha: 0.25)),
            ),
            child: Column(
              crossAxisAlignment: compact
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Anggaran menuju Wukuf',
                  style: TextStyle(
                    color: palette.gold,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.6,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      '$bakiHari',
                      style: GoogleFonts.playfairDisplay(
                        color: colors.onSurface,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'hari lagi',
                      style: TextStyle(
                        color: palette.mutedText,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  'Tertakluk kepada pengumuman rasmi.',
                  style: TextStyle(
                    color: palette.mutedText.withValues(alpha: 0.7),
                    fontSize: 11,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          );

          if (compact) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                tarikhPanel,
                const SizedBox(height: 20),
                countdownHaji,
              ],
            );
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[tarikhPanel, countdownHaji],
          );
        },
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

    final dynamic savedBestScore =
        assessmentBox.get('best_score', defaultValue: 0);

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
                      border: Border.all(
                        color: palette.gold.withValues(alpha: 0.24),
                      ),
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
                          style: GoogleFonts.playfairDisplay(
                            color: colors.onSurface,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Jawab 20 soalan dan capai sekurang-kurangnya 80%.',
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
                  _AssessmentTopicChip(label: 'Lulus 80%', color: palette.emerald),
                  _AssessmentTopicChip(
                    label: passed ? 'Layak sijil' : 'Terbaik $bestScore%',
                    color: passed ? palette.emerald : palette.secondaryColor,
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
              label: Text(passed ? 'Sijil Saya' : 'Mula Penilaian'),
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
