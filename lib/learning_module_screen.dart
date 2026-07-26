import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'app_theme.dart';
import 'final_assessment_screen.dart';
import 'islamic_icons.dart';

class LearningModuleScreen extends StatelessWidget {
  const LearningModuleScreen({required this.assessmentBox, super.key});

  final Box<dynamic> assessmentBox;

  static const List<LearningModuleData> modules = <LearningModuleData>[
    LearningModuleData(
      number: '01',
      title: 'Asas Haji',
      subtitle: 'Kenali maksud Haji, syarat wajib dan gambaran perjalanan.',
      icon: HajjIconType.kaaba,
      accent: Color(0xFF2F8F79),
      sections: <LearningSection>[
        LearningSection(
          title: 'Pengertian Haji',
          points: <String>[
            'Haji ialah mengunjungi Baitullah al-Haram pada masa tertentu untuk melaksanakan ibadah tertentu.',
            'Ibadah Haji dilaksanakan dengan niat dan mengikuti tatacara yang ditetapkan.',
          ],
        ),
        LearningSection(
          title: 'Syarat wajib Haji',
          points: <String>[
            'Beragama Islam.',
            'Baligh dan berakal.',
            'Merdeka.',
            'Mempunyai kemampuan dari sudut kewangan, kesihatan dan keselamatan perjalanan.',
          ],
        ),
        LearningSection(
          title: 'Gambaran perjalanan',
          points: <String>[
            'Berihram dan berniat di miqat.',
            'Wukuf di Arafah.',
            'Bermalam di Muzdalifah dan Mina.',
            'Melontar jamrah, bertahallul, Tawaf dan Sa’i.',
          ],
        ),
      ],
    ),
    LearningModuleData(
      number: '02',
      title: 'Rukun & Wajib Haji',
      subtitle: 'Fahami perkara yang menentukan sah atau sempurnanya Haji.',
      icon: HajjIconType.rukun,
      accent: Color(0xFFB18443),
      sections: <LearningSection>[
        LearningSection(
          title: 'Rukun Haji',
          points: <String>[
            'Niat ihram Haji.',
            'Wukuf di Arafah.',
            'Tawaf Ifadah.',
            'Sa’i antara Safa dan Marwah.',
            'Bercukur atau bergunting.',
            'Tertib pada kebanyakan rukun.',
          ],
        ),
        LearningSection(
          title: 'Wajib Haji',
          points: <String>[
            'Berniat ihram di miqat.',
            'Menjaga larangan ihram.',
            'Bermalam di Muzdalifah.',
            'Melontar Jamrah Kubra.',
            'Bermalam di Mina.',
            'Melontar ketiga-tiga jamrah.',
            'Melaksanakan Tawaf Wada’.',
          ],
        ),
        LearningSection(
          title: 'Perbezaan ringkas',
          points: <String>[
            'Rukun yang ditinggalkan menyebabkan Haji tidak sempurna sehingga rukun itu dilaksanakan.',
            'Wajib Haji yang ditinggalkan boleh menyebabkan kewajipan dam, tertakluk kepada keadaan dan hukum.',
          ],
        ),
      ],
    ),
    LearningModuleData(
      number: '03',
      title: 'Larangan Ihram',
      subtitle:
          'Kenali perkara yang perlu dijaga sepanjang berada dalam ihram.',
      icon: HajjIconType.ihram,
      accent: Color(0xFFC05C65),
      sections: <LearningSection>[
        LearningSection(
          title: 'Penjagaan diri',
          points: <String>[
            'Tidak memakai wangi-wangian selepas berniat ihram.',
            'Tidak memotong kuku atau mencabut rambut tanpa keperluan yang dibenarkan.',
            'Menjaga pakaian ihram mengikut ketetapan bagi lelaki dan wanita.',
          ],
        ),
        LearningSection(
          title: 'Hubungan dan akhlak',
          points: <String>[
            'Menjauhi hubungan suami isteri dan perkara yang membangkitkan syahwat.',
            'Tidak melakukan akad nikah semasa dalam ihram.',
            'Menjaga percakapan, kesabaran dan adab sepanjang ibadah.',
          ],
        ),
        LearningSection(
          title: 'Alam sekitar',
          points: <String>[
            'Tidak memburu binatang buruan darat ketika dalam ihram.',
            'Menjaga kebersihan dan tidak merosakkan kawasan suci.',
          ],
        ),
      ],
    ),
    LearningModuleData(
      number: '04',
      title: 'Pengenalan Dam',
      subtitle: 'Fahami maksud dam dan keadaan yang memerlukan rujukan lanjut.',
      icon: HajjIconType.dam,
      accent: Color(0xFF7A6CB1),
      sections: <LearningSection>[
        LearningSection(
          title: 'Apakah dam?',
          points: <String>[
            'Dam ialah bayaran atau sembelihan tertentu yang dikenakan dalam keadaan tertentu ketika Haji atau Umrah.',
            'Hukum dan bentuk dam bergantung pada punca, keadaan dan kemampuan jemaah.',
          ],
        ),
        LearningSection(
          title: 'Sebab umum',
          points: <String>[
            'Meninggalkan sesuatu yang diwajibkan.',
            'Melakukan larangan ihram.',
            'Melaksanakan Haji Tamattu’ atau Qiran dalam keadaan yang berkaitan.',
          ],
        ),
        LearningSection(
          title: 'Tindakan jemaah',
          points: <String>[
            'Jangan menentukan dam sendiri hanya berdasarkan andaian.',
            'Catat perkara yang berlaku dan rujuk pembimbing Haji atau pegawai bertauliah.',
          ],
        ),
      ],
    ),
    LearningModuleData(
      number: '05',
      title: 'Doa & Zikir',
      subtitle: 'Rujukan ringkas doa dan zikir yang mudah diamalkan.',
      icon: HajjIconType.doa,
      accent: Color(0xFF3887B6),
      sections: <LearningSection>[
        LearningSection(
          title: 'Talbiyah',
          points: <String>[
            'Perbanyakkan talbiyah selepas berniat ihram sehingga tiba waktu yang berkaitan dengan ibadah.',
            'Hayati maksud menyahut panggilan Allah dengan penuh rendah diri.',
          ],
        ),
        LearningSection(
          title: 'Doa kebaikan dunia dan akhirat',
          points: <String>[
            'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
            'Ya Tuhan kami, berikanlah kami kebaikan di dunia dan kebaikan di akhirat serta peliharalah kami daripada azab neraka.',
          ],
        ),
        LearningSection(
          title: 'Amalan umum',
          points: <String>[
            'Berdoa menggunakan bahasa yang difahami.',
            'Perbanyakkan istighfar, selawat, tasbih, tahmid dan takbir.',
            'Utamakan keikhlasan dan kefahaman berbanding menghafal tanpa menghayati.',
          ],
        ),
      ],
    ),
    LearningModuleData(
      number: '06',
      title: 'Penilaian Akhir',
      subtitle: 'Jawab 20 soalan dan capai sekurang-kurangnya 80% untuk lulus.',
      icon: HajjIconType.quiz,
      accent: Color(0xFFCE7A38),
      sections: <LearningSection>[
        LearningSection(
          title: 'Format penilaian',
          points: <String>[
            'Penilaian mengandungi 20 soalan pilihan jawapan.',
            'Markah lulus ialah 80% atau sekurang-kurangnya 16 jawapan betul.',
          ],
        ),
        LearningSection(
          title: 'Selepas menjawab',
          points: <String>[
            'Keputusan dipaparkan serta-merta.',
            'Jawapan yang salah boleh disemak untuk ulang kaji.',
            'Pengguna yang lulus akan diberikan status layak menerima sijil pencapaian.',
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

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
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1050),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        _LearningIconButton(
                          tooltip: 'Kembali',
                          icon: Icons.arrow_back_rounded,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'BELAJAR HAJI',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: colors.onSurface,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Belajar, faham dan jadikan panduan',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: palette.mutedText,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 46),
                      ],
                    ),
                    const SizedBox(height: 26),
                    _LearningIntroCard(moduleCount: modules.length),
                    const SizedBox(height: 24),
                    Text(
                      'Modul Pembelajaran',
                      style: TextStyle(
                        color: colors.onSurface,
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Pilih satu modul dan belajar mengikut topik.',
                      style: TextStyle(color: palette.mutedText),
                    ),
                    const SizedBox(height: 18),
                    LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                            final int columns = constraints.maxWidth >= 820
                                ? 3
                                : constraints.maxWidth >= 540
                                ? 2
                                : 1;

                            const double spacing = 14;

                            final double width =
                                (constraints.maxWidth -
                                    spacing * (columns - 1)) /
                                columns;

                            return Wrap(
                              spacing: spacing,
                              runSpacing: spacing,
                              children: modules.map((
                                LearningModuleData module,
                              ) {
                                return SizedBox(
                                  width: width,
                                  child: _LearningModuleCard(
                                    module: module,
                                    onTap: () {
                                      if (module.number == '06') {
                                        Navigator.of(context).push(
                                          MaterialPageRoute<void>(
                                            builder: (_) {
                                              return FinalAssessmentScreen(
                                                assessmentBox: assessmentBox,
                                              );
                                            },
                                          ),
                                        );
                                        return;
                                      }

                                      Navigator.of(context).push(
                                        MaterialPageRoute<void>(
                                          builder: (_) {
                                            return LearningDetailScreen(
                                              module: module,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }).toList(),
                            );
                          },
                    ),
                    const SizedBox(height: 22),
                    _PrototypeNotice(),
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

class LearningDetailScreen extends StatelessWidget {
  const LearningDetailScreen({required this.module, super.key});

  final LearningModuleData module;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

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
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        _LearningIconButton(
                          tooltip: 'Kembali',
                          icon: Icons.arrow_back_rounded,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Expanded(
                          child: Text(
                            module.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: colors.onSurface,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        const SizedBox(width: 46),
                      ],
                    ),
                    const SizedBox(height: 26),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: module.accent.withValues(alpha: 0.11),
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(
                          color: module.accent.withValues(alpha: 0.28),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: module.accent.withValues(alpha: 0.14),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: HajjIcon(
                              type: module.icon,
                              color: module.accent,
                              size: 34,
                            ),
                          ),
                          const SizedBox(width: 17),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'MODUL ${module.number}',
                                  style: TextStyle(
                                    color: module.accent,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  module.title,
                                  style: TextStyle(
                                    color: colors.onSurface,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  module.subtitle,
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
                    ),
                    const SizedBox(height: 18),
                    ...module.sections.map((LearningSection section) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: _LearningSectionCard(
                          section: section,
                          accent: module.accent,
                        ),
                      );
                    }),
                    const SizedBox(height: 8),
                    const _PrototypeNotice(),
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

class LearningModuleData {
  const LearningModuleData({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accent,
    required this.sections,
  });

  final String number;
  final String title;
  final String subtitle;
  final HajjIconType icon;
  final Color accent;
  final List<LearningSection> sections;
}

class LearningSection {
  const LearningSection({required this.title, required this.points});

  final String title;
  final List<String> points;
}

class _LearningIntroCard extends StatelessWidget {
  const _LearningIntroCard({required this.moduleCount});

  final int moduleCount;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: palette.glassSurface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: palette.glassBorder),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: palette.shadow,
            blurRadius: 28,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool compact = constraints.maxWidth < 580;

          final Widget icon = Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: palette.emerald.withValues(alpha: 0.11),
              shape: BoxShape.circle,
              border: Border.all(
                color: palette.emerald.withValues(alpha: 0.24),
              ),
            ),
            child: HajjIcon(
              type: HajjIconType.learning,
              color: palette.emerald,
              size: 54,
              strokeWidth: 4.2,
            ),
          );

          final Widget text = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Belajar Sebelum & Semasa Haji',
                style: TextStyle(
                  color: colors.onSurface,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 9),
              Text(
                'Modul ringkas untuk membantu jemaah '
                'memahami asas ibadah dan merujuk panduan '
                'semasa perjalanan.',
                style: TextStyle(color: palette.mutedText, height: 1.55),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: palette.gold.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: palette.gold.withValues(alpha: 0.24),
                  ),
                ),
                child: Text(
                  '$moduleCount modul pembelajaran',
                  style: TextStyle(
                    color: palette.gold,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          );

          if (compact) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[icon, const SizedBox(height: 20), text],
            );
          }

          return Row(
            children: <Widget>[
              icon,
              const SizedBox(width: 24),
              Expanded(child: text),
            ],
          );
        },
      ),
    );
  }
}

class _LearningModuleCard extends StatefulWidget {
  const _LearningModuleCard({required this.module, required this.onTap});

  final LearningModuleData module;
  final VoidCallback onTap;

  @override
  State<_LearningModuleCard> createState() => _LearningModuleCardState();
}

class _LearningModuleCardState extends State<_LearningModuleCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;
    final LearningModuleData module = widget.module;

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
        transform: Matrix4.translationValues(0, hovering ? -5 : 0, 0),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(24),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: palette.glassSurface,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: hovering
                      ? module.accent.withValues(alpha: 0.45)
                      : palette.glassBorder,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: palette.shadow,
                    blurRadius: 24,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: module.accent.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: HajjIcon(
                          type: module.icon,
                          color: module.accent,
                          size: 29,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        module.number,
                        style: TextStyle(
                          color: module.accent,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.4,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    module.title,
                    style: TextStyle(
                      color: colors.onSurface,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    module.subtitle,
                    style: TextStyle(
                      color: palette.mutedText,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: <Widget>[
                      Text(
                        'Buka modul',
                        style: TextStyle(
                          color: module.accent,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: module.accent,
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
    );
  }
}

class _LearningSectionCard extends StatelessWidget {
  const _LearningSectionCard({required this.section, required this.accent});

  final LearningSection section;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: palette.glassSurface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: palette.glassBorder),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: palette.shadow,
            blurRadius: 22,
            offset: const Offset(0, 11),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  color: accent,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  section.title,
                  style: TextStyle(
                    color: colors.onSurface,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ...List<Widget>.generate(section.points.length, (int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 24,
                    height: 24,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: accent.withValues(alpha: 0.11),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: accent,
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(width: 11),
                  Expanded(
                    child: Text(
                      section.points[index],
                      style: TextStyle(color: colors.onSurface, height: 1.55),
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

class _PrototypeNotice extends StatelessWidget {
  const _PrototypeNotice();

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: palette.gold.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: palette.gold.withValues(alpha: 0.20)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.info_outline_rounded, color: palette.gold, size: 20),
          const SizedBox(width: 11),
          Expanded(
            child: Text(
              'Kandungan ini ialah ringkasan prototaip. '
              'Semak kandungan akhir bersama pembimbing '
              'Haji atau panel syariah yang berautoriti.',
              style: TextStyle(
                color: palette.mutedText,
                fontSize: 12,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LearningIconButton extends StatelessWidget {
  const _LearningIconButton({
    required this.tooltip,
    required this.icon,
    required this.onPressed,
  });

  final String tooltip;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;

    return IconButton(
      tooltip: tooltip,
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: palette.glassSurface,
        foregroundColor: context.appColorScheme.onSurface,
        side: BorderSide(color: palette.glassBorder),
      ),
      icon: Icon(icon),
    );
  }
}
