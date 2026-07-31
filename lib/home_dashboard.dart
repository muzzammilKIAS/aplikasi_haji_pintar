import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijri/hijri_calendar.dart';

import 'app_theme.dart';
import 'certificate_screen.dart';
import 'final_assessment_screen.dart';
import 'hajj_guide_screen.dart';
import 'hajj_journey_viewer.dart';
import 'islamic_icons.dart';
import 'learning_module_screen.dart';
import 'main.dart';
import 'offline_map_screen.dart';
import 'sai_counter_screen.dart';
import 'shared_widgets.dart';
import 'tawaf_counter_screen.dart';
import 'theme_controller.dart';

// ---------------------------------------------------------------------
// Penukaran Masihi <-> Hijrah (algoritma tabular Kuwait) supaya tarikh
// Wukuf (9 Zulhijjah) boleh dikira secara automatik setiap tahun, tanpa
// perlu hardcode tarikh Masihi yang akan menjadi lapuk selepas 2027.
// Ketepatan lebih kurang ±1 hari berbanding kalendar rasmi cerapan hilal.
// ---------------------------------------------------------------------
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

/// Kira tarikh 9 Zulhijjah (hari Wukuf) yang akan datang, secara automatik
/// mengikut tahun semasa. Jika tarikh tahun ini sudah berlalu, dikira maju
/// ke tahun Hijrah seterusnya.
DateTime kiraTarikhWukufAkanDatang(DateTime sekarang) {
  final Map<String, int> hSekarang = _tarikhMasihiKeHijrahTabular(sekarang);
  int tahunHijrah = hSekarang['tahun']!;

  DateTime calonWukuf = _julianDayKeMasihi(
    _hijrahKeJulianDay(tahunHijrah, 12, 9),
  );

  final DateTime hariIni = DateTime(
    sekarang.year,
    sekarang.month,
    sekarang.day,
  );

  if (calonWukuf.isBefore(hariIni)) {
    tahunHijrah += 1;
    calonWukuf = _julianDayKeMasihi(_hijrahKeJulianDay(tahunHijrah, 12, 9));
  }

  return calonWukuf;
}

/// Sapaan mengikut waktu semasa peranti (pagi/tengah hari/petang/malam),
/// dipaparkan pada kad hero halaman utama.
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

/// Kad "hero" utama papan pemuka — menyatukan sapaan/pengenalan (HeroPanel)
/// dan maklumat mendesak (tarikh Masihi/Hijrah, waktu semasa, countdown
/// Wukuf daripada TimeAndCountdownPanel) dalam SATU kad kaca yang menonjol,
/// dipisahkan oleh pembahagi emas. Ini supaya jemaah nampak semua maklumat
/// paling penting sekali imbas, tanpa kad berasingan yang berselerak.
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
                        const SizedBox(height: 24),
                        const DashboardHeroCard(),
                        const SizedBox(height: 40),
                        const SectionTitle(
                          title: 'Modul Utama',
                          subtitle: 'Akses pantas kepada fungsi utama.',
                        ),
                        const SizedBox(height: 18),
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
                        const SizedBox(height: 40),
                        const SectionTitle(
                          title: 'Info Perjalanan',
                          subtitle:
                              'Ringkasan tatacara, tempat, rukun dan wajib.',
                        ),
                        const SizedBox(height: 18),
                        HajjJourneyBox(
                          onOpenGuide: () => _bukaPanduanHaji(context),
                        ),
                        const SizedBox(height: 40),
                        const SectionTitle(
                          title: 'Kemajuan Anda',
                          subtitle: 'Penilaian akhir dan sijil pencapaian.',
                        ),
                        const SizedBox(height: 18),
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

                        // --- KOD COPYRIGHT ---
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
                                  color: palette.mutedText.withValues(
                                    alpha: 0.75,
                                  ),
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
                                  color: palette.mutedText.withValues(
                                    alpha: 0.55,
                                  ),
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
    int columns = 1;

    if (width >= 900) {
      columns = 3;
    } else if (width >= 560) {
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
        number: '04',
        title: 'Modul Belajar',
        description: 'Asas, rukun, wajib, larangan ihram, dam dan doa.',
        icon: HajjIconType.learning,
        accent: palette.emerald,
        onTap: () => _bukaModulBelajar(context),
      ),
      FeatureData(
        number: '05',
        title: 'Panduan Haji',
        description: 'Ikuti langkah demi langkah dari persediaan hingga Wada’.',
        icon: HajjIconType.guide,
        accent: palette.gold,
        onTap: () => _bukaPanduanHaji(context),
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
            borderRadius: BorderRadius.circular(15),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: palette.emerald.withValues(alpha: 0.23),
                blurRadius: 22,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset('assets/images/app_icon.png', fit: BoxFit.cover),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'HAJI PINTAR',
                style: GoogleFonts.playfairDisplay(
                  color: colors.onSurface,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 3,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                'SMART PILGRIMAGE COMPANION',
                style: TextStyle(
                  color: palette.gold,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.6,
                ),
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
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: palette.gold.withValues(alpha: 0.55)),
          ),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: palette.softSurface,
            child: Text(
              'U',
              style: GoogleFonts.playfairDisplay(
                color: palette.gold,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
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

    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 26, 26, 26),
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
              const SizedBox(height: 24),
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
              const SizedBox(height: 18),
              SizedBox(
                width: 96,
                child: HajjOrnamentDivider(color: palette.gold),
              ),
              const SizedBox(height: 18),
              Text(
                'HajiPintar adalah panduan digital yang membantu perjalanan '
                'haji anda lebih tersusun, selamat dan tenang.',
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
  const SectionTitle({required this.title, required this.subtitle, super.key});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
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
                  const SizedBox(height: 5),
                  Text(subtitle, style: TextStyle(color: palette.mutedText)),
                ],
              ),
            ),
            const StatusPill(
              icon: Icons.cloud_done_rounded,
              label: 'Sistem aktif',
            ),
          ],
        ),
        const SizedBox(height: 14),
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
                          style: GoogleFonts.playfairDisplay(
                            color: accent.withValues(alpha: 0.80),
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      widget.data.title,
                      style: GoogleFonts.playfairDisplay(
                        color: colors.onSurface,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
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
  const HajjJourneyBox({required this.onOpenGuide, super.key});

  final VoidCallback onOpenGuide;

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

  static const List<IconData> tabIcons = <IconData>[
    Icons.route_rounded,
    Icons.location_on_rounded,
    Icons.verified_rounded,
    Icons.checklist_rounded,
  ];

  static const List<String> tabDescriptions = <String>[
    'Susunan utama perjalanan ibadah Haji.',
    'Lokasi penting yang perlu dikenal pasti.',
    'Perkara yang menentukan sahnya Haji.',
    'Amalan wajib yang melengkapkan Haji.',
  ];

  static const List<List<String>> tabContents = <List<String>>[
    <String>[
      'Berniat ihram Haji di miqat.',
      'Berwukuf di Arafah.',
      'Bermalam di Muzdalifah.',
      'Melontar Jamrah Kubra pada 10 Zulhijjah.',
      'Bercukur atau bergunting untuk tahallul awal.',
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
            style: GoogleFonts.playfairDisplay(
              color: colors.onSurface,
              fontSize: 23,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            tabDescriptions[selectedTab],
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
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: palette.emerald.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: palette.emerald.withValues(alpha: 0.20),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(tabIcons[selectedTab], color: palette.emerald, size: 21),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Semak ${tabContents[selectedTab].length} perkara '
                    'utama sebelum meneruskan perjalanan.',
                    style: TextStyle(
                      color: colors.onSurface,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      height: 1.45,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
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
                      Column(
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
                          if (index < tabContents[selectedTab].length - 1)
                            Container(
                              width: 1,
                              height: 28,
                              color: palette.emerald.withValues(alpha: 0.22),
                            ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            tabContents[selectedTab][index],
                            style: TextStyle(
                              color: colors.onSurface,
                              height: 1.5,
                            ),
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
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton.icon(
              onPressed: widget.onOpenGuide,
              icon: HajjIcon(
                type: HajjIconType.guide,
                color: palette.gold,
                size: 21,
              ),
              label: const Text('Buka Panduan Haji Penuh'),
            ),
          ),
          const SizedBox(height: 16),
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
                      border: Border.all(
                        color: palette.emerald.withValues(alpha: 0.24),
                      ),
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
                          style: GoogleFonts.playfairDisplay(
                            color: colors.onSurface,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
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
                          'Panduan Langkah demi Langkah',
                          style: GoogleFonts.playfairDisplay(
                            color: colors.onSurface,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
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
  late int _hariIni; // Digunakan untuk menyemak pertukaran hari yang tepat

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _hariIni = _now.day;
    _targetHajj = kiraTarikhWukufAkanDatang(_now);

    // 1. Daftarkan kamus Bahasa Melayu mengikut format Map<int, String>
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

    // 2. Sekarang baru kita boleh gunakan 'ms'
    HijriCalendar.setLocal('ms');
    _hijriNow = HijriCalendar.now();

    // 3. Mengemas kini masa setiap 1 saat
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (mounted) {
        setState(() {
          _now = DateTime.now();

          // Memperbaiki ralat pertukaran hari - kini menyemak tarikh berbanding saat tepat
          if (_now.day != _hariIni) {
            _hariIni = _now.day;
            _hijriNow = HijriCalendar.now();
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

  String _formatWaktu(DateTime masa) {
    final int jam = masa.hour > 12
        ? masa.hour - 12
        : (masa.hour == 0 ? 12 : masa.hour);
    final String minit = masa.minute.toString().padLeft(2, '0');
    final String saat = masa.second.toString().padLeft(2, '0');
    final String ampm = masa.hour >= 12 ? 'PM' : 'AM';
    return '$jam:$minit:$saat $ampm';
  }

  String _formatTarikhMasihi(DateTime masa) {
    const List<String> bulan = <String>[
      'Jan',
      'Feb',
      'Mac',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Ogos',
      'Sep',
      'Okt',
      'Nov',
      'Dis',
    ];
    return '${masa.day} ${bulan[masa.month - 1]} ${masa.year}';
  }

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    // Memperbaiki ralat .inDays - Memastikan pengiraan hari menggunakan tarikh kalendar mutlak
    // tanpa dipengaruhi oleh waktu jam/minit/saat.
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

          final Widget jamSekarang = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _formatWaktu(_now),
                style: GoogleFonts.playfairDisplay(
                  color: colors.onSurface,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 6),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: palette.emerald.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: palette.emerald.withValues(alpha: 0.25),
                      ),
                    ),
                    child: Text(
                      _formatTarikhMasihi(_now),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colors.onSurface,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        height: 1.0,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: palette.gold.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: palette.gold.withValues(alpha: 0.25),
                      ),
                    ),
                    child: Text(
                      '${_hijriNow.hDay} ${_hijriNow.getLongMonthName()} ${_hijriNow.hYear}H',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colors.onSurface,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        height: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );

          final Widget countdownHaji = Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            decoration: BoxDecoration(
              color: palette.gold.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: palette.gold.withValues(alpha: 0.3)),
            ),
            child: Column(
              crossAxisAlignment: compact
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'WUKUF',
                  style: TextStyle(
                    color: palette.gold,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      '$bakiHari',
                      style: GoogleFonts.playfairDisplay(
                        color: colors.onSurface,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'HARI LAGI',
                      style: TextStyle(
                        color: palette.mutedText,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );

          if (compact) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                jamSekarang,
                const SizedBox(height: 20),
                countdownHaji,
              ],
            );
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[jamSekarang, countdownHaji],
          );
        },
      ),
    );
  }
}
