import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'app_theme.dart';
import 'shared_widgets.dart';
import 'islamic_icons.dart';

class HajjGuideScreen extends StatefulWidget {
  const HajjGuideScreen({required this.guideBox, super.key});

  final Box<dynamic> guideBox;

  @override
  State<HajjGuideScreen> createState() => _HajjGuideScreenState();
}

class _HajjGuideScreenState extends State<HajjGuideScreen> {
  static const String storageKey = 'completed_guide_steps';

  final Set<int> completedSteps = <int>{};

  static const List<HajjGuideStepData> steps = <HajjGuideStepData>[
    HajjGuideStepData(
      number: '01',
      title: 'Persediaan Sebelum Berangkat',
      location: 'Sebelum perjalanan',
      icon: HajjIconType.preparation,
      accent: Color(0xFF2F8F79),
      summary:
          'Sediakan ilmu, dokumen, kesihatan dan keperluan asas sebelum berangkat.',
      actions: <String>[
        'Semak pasport, visa, tiket dan dokumen perjalanan.',
        'Hadiri kursus atau taklimat Haji yang diiktiraf.',
        'Sediakan ubat peribadi dan rekod kesihatan.',
        'Simpan nombor penting dan maklumat kumpulan.',
      ],
      checklist: <String>[
        'Dokumen perjalanan lengkap.',
        'Ubat dan keperluan kesihatan dibawa.',
        'Fahami perjalanan asas Haji.',
        'Maklumkan keluarga tentang jadual perjalanan.',
      ],
      reminder:
          'Gunakan senarai semak dan simpan salinan dokumen secara selamat.',
    ),
    HajjGuideStepData(
      number: '02',
      title: 'Ihram dan Niat di Miqat',
      location: 'Miqat',
      icon: HajjIconType.ihram,
      accent: Color(0xFFB18443),
      summary: 'Bersedia memakai ihram dan berniat Haji di sempadan miqat.',
      actions: <String>[
        'Bersihkan diri dan bersedia memakai pakaian ihram.',
        'Pastikan niat dilakukan pada tempat atau masa miqat yang betul.',
        'Mulakan talbiyah selepas berniat.',
        'Jaga larangan ihram selepas niat dilakukan.',
      ],
      checklist: <String>[
        'Pakaian ihram telah disediakan.',
        'Niat dilakukan sebelum melepasi miqat.',
        'Talbiyah dibaca.',
        'Larangan ihram difahami.',
      ],
      reminder:
          'Jangan melepasi miqat tanpa niat. Rujuk pembimbing Haji jika tidak pasti.',
    ),
    HajjGuideStepData(
      number: '03',
      title: 'Ketibaan di Makkah',
      location: 'Makkah',
      icon: HajjIconType.kaaba,
      accent: Color(0xFF4B8CCB),
      summary:
          'Urus ketibaan dengan tenang dan kenal pasti laluan serta tempat penginapan.',
      actions: <String>[
        'Daftar masuk dan susun barang keperluan.',
        'Kenal pasti lokasi hotel, bas dan tempat berkumpul.',
        'Rehat secukupnya sebelum melaksanakan ibadah.',
        'Ikut arahan pembimbing bagi urutan ibadah.',
      ],
      checklist: <String>[
        'Lokasi hotel dikenal pasti.',
        'Tempat berkumpul diketahui.',
        'Nombor pembimbing disimpan.',
        'Badan cukup rehat dan air.',
      ],
      reminder:
          'Elakkan bergerak bersendirian di kawasan yang belum dikenal pasti.',
    ),
    HajjGuideStepData(
      number: '04',
      title: 'Tawaf dan Sa’i',
      location: 'Masjidil Haram',
      icon: HajjIconType.tawaf,
      accent: Color(0xFF7A6CB1),
      summary: 'Laksanakan Tawaf dan Sa’i mengikut tertib serta kemampuan.',
      actions: <String>[
        'Laksanakan Tawaf sebanyak tujuh pusingan.',
        'Gunakan kaunter Tawaf bagi membantu kiraan.',
        'Laksanakan Sa’i sebanyak tujuh perjalanan.',
        'Gunakan kaunter Sa’i untuk merekod perjalanan.',
      ],
      checklist: <String>[
        'Tujuh pusingan Tawaf selesai.',
        'Tujuh perjalanan Sa’i selesai.',
        'Kiraan disemak sebelum keluar.',
        'Keadaan fizikal dipantau.',
      ],
      reminder:
          'Utamakan keselamatan dan elakkan bersesak jika keadaan terlalu padat.',
    ),
    HajjGuideStepData(
      number: '05',
      title: 'Wukuf di Arafah',
      location: 'Arafah',
      icon: HajjIconType.arafah,
      accent: Color(0xFFC05C65),
      summary:
          'Berada di Arafah pada waktu wukuf dan perbanyakkan doa serta zikir.',
      actions: <String>[
        'Pastikan berada dalam kawasan Arafah pada waktu wukuf.',
        'Jaga solat, doa, zikir dan istighfar.',
        'Gunakan masa dengan tenang dan tertib.',
        'Ikut jadual pergerakan kumpulan.',
      ],
      checklist: <String>[
        'Berada dalam sempadan Arafah.',
        'Waktu wukuf dipastikan.',
        'Doa dan zikir dilaksanakan.',
        'Arahan kumpulan dipatuhi.',
      ],
      reminder:
          'Wukuf ialah rukun utama Haji. Pastikan lokasi dan waktunya tepat.',
    ),
    HajjGuideStepData(
      number: '06',
      title: 'Bermalam di Muzdalifah',
      location: 'Muzdalifah',
      icon: HajjIconType.muzdalifah,
      accent: Color(0xFF3887B6),
      summary:
          'Bergerak ke Muzdalifah, berehat dan membuat persediaan untuk Mina.',
      actions: <String>[
        'Ikut pergerakan kumpulan dari Arafah.',
        'Laksanakan ibadah mengikut panduan pembimbing.',
        'Berehat dan jaga tenaga.',
        'Sediakan batu melontar mengikut panduan.',
      ],
      checklist: <String>[
        'Tiba di Muzdalifah.',
        'Lokasi kumpulan dikenal pasti.',
        'Keperluan melontar disediakan.',
        'Tenaga dan hidrasi dijaga.',
      ],
      reminder:
          'Jangan berpisah daripada kumpulan ketika pergerakan besar-besaran.',
    ),
    HajjGuideStepData(
      number: '07',
      title: 'Mina dan Melontar Jamrah',
      location: 'Mina',
      icon: HajjIconType.mina,
      accent: Color(0xFFCE7A38),
      summary:
          'Bermalam di Mina dan melontar jamrah mengikut jadual serta kemampuan.',
      actions: <String>[
        'Ikut jadual melontar yang ditetapkan.',
        'Pastikan batu dan bilangan lontaran mencukupi.',
        'Gunakan laluan yang ditetapkan.',
        'Kembali ke khemah atau lokasi kumpulan dengan selamat.',
      ],
      checklist: <String>[
        'Jadual melontar disemak.',
        'Bilangan lontaran dipastikan.',
        'Laluan pergi dan balik dikenal pasti.',
        'Keselamatan kumpulan dijaga.',
      ],
      reminder:
          'Jangan melawan arus atau memaksa diri ketika kawasan terlalu padat.',
    ),
    HajjGuideStepData(
      number: '08',
      title: 'Tahallul',
      location: 'Selepas melontar',
      icon: HajjIconType.tahallul,
      accent: Color(0xFF5B9279),
      summary:
          'Bercukur atau bergunting sebagai sebahagian daripada proses tahallul.',
      actions: <String>[
        'Pastikan urutan ibadah telah disemak.',
        'Bercukur atau bergunting mengikut ketetapan.',
        'Fahami larangan yang telah terangkat.',
        'Teruskan ibadah berikutnya mengikut jadual.',
      ],
      checklist: <String>[
        'Urutan ibadah disahkan.',
        'Bercukur atau bergunting selesai.',
        'Status tahallul difahami.',
        'Langkah berikutnya diketahui.',
      ],
      reminder:
          'Rujuk pembimbing Haji tentang perbezaan tahallul awal dan tahallul thani.',
    ),
    HajjGuideStepData(
      number: '09',
      title: 'Tawaf Wada’',
      location: 'Masjidil Haram',
      icon: HajjIconType.tawafWada,
      accent: Color(0xFF9A6E52),
      summary:
          'Laksanakan Tawaf Wada’ sebelum meninggalkan Makkah apabila diwajibkan.',
      actions: <String>[
        'Semak jadual keberangkatan dari Makkah.',
        'Laksanakan Tawaf Wada’ pada waktu yang sesuai.',
        'Elakkan aktiviti yang tidak perlu selepas selesai.',
        'Bersedia untuk bergerak meninggalkan Makkah.',
      ],
      checklist: <String>[
        'Jadual keluar dari Makkah diketahui.',
        'Tawaf Wada’ selesai.',
        'Barang dan dokumen telah dikemas.',
        'Tempat berkumpul disahkan.',
      ],
      reminder:
          'Terdapat keadaan tertentu yang mempunyai pengecualian. Rujuk pembimbing Haji.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _loadCompletedSteps();
  }

  void _loadCompletedSteps() {
    final dynamic savedValue = widget.guideBox.get(
      storageKey,
      defaultValue: <int>[],
    );

    completedSteps.clear();

    if (savedValue is List<dynamic>) {
      for (final dynamic value in savedValue) {
        if (value is int && value >= 0 && value < steps.length) {
          completedSteps.add(value);
        }
      }
    }
  }

  Future<void> _setStepCompleted(int index, bool completed) async {
    setState(() {
      if (completed) {
        completedSteps.add(index);
      } else {
        completedSteps.remove(index);
      }
    });

    final List<int> savedSteps = completedSteps.toList()..sort();

    await widget.guideBox.put(storageKey, savedSteps);
  }

  Future<void> _openStep(int index) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) {
          return HajjGuideDetailScreen(
            steps: steps,
            initialIndex: index,
            completedSteps: completedSteps,
            onCompletionChanged: _setStepCompleted,
          );
        },
      ),
    );

    if (mounted) {
      setState(_loadCompletedSteps);
    }
  }

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;
    final double progress = completedSteps.length / steps.length;

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
                constraints: const BoxConstraints(maxWidth: 820),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        HajjIconButton(
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
                                'PANDUAN HAJI',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: colors.onSurface,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Langkah demi langkah',
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
                    const SizedBox(height: 24),
                    _GuideProgressCard(
                      completed: completedSteps.length,
                      total: steps.length,
                      progress: progress,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Perjalanan Haji',
                      style: TextStyle(
                        color: colors.onSurface,
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Tekan langkah untuk melihat panduan dan checklist.',
                      style: TextStyle(color: palette.mutedText),
                    ),
                    const SizedBox(height: 20),
                    ...List<Widget>.generate(steps.length, (int index) {
                      return _TimelineStep(
                        step: steps[index],
                        isCompleted: completedSteps.contains(index),
                        isLast: index == steps.length - 1,
                        onTap: () {
                          _openStep(index);
                        },
                      );
                    }),
                    const SizedBox(height: 12),
                    const _GuidePrototypeNotice(),
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

class HajjGuideDetailScreen extends StatefulWidget {
  const HajjGuideDetailScreen({
    required this.steps,
    required this.initialIndex,
    required this.completedSteps,
    required this.onCompletionChanged,
    super.key,
  });

  final List<HajjGuideStepData> steps;
  final int initialIndex;
  final Set<int> completedSteps;
  final Future<void> Function(int index, bool completed) onCompletionChanged;

  @override
  State<HajjGuideDetailScreen> createState() => _HajjGuideDetailScreenState();
}

class _HajjGuideDetailScreenState extends State<HajjGuideDetailScreen> {
  late int currentIndex;
  late final Set<int> completedSteps;

  HajjGuideStepData get step => widget.steps[currentIndex];

  bool get isCompleted => completedSteps.contains(currentIndex);

  @override
  void initState() {
    super.initState();

    currentIndex = widget.initialIndex;
    completedSteps = Set<int>.from(widget.completedSteps);
  }

  Future<void> _toggleCompleted() async {
    final bool newValue = !isCompleted;

    setState(() {
      if (newValue) {
        completedSteps.add(currentIndex);
      } else {
        completedSteps.remove(currentIndex);
      }
    });

    await widget.onCompletionChanged(currentIndex, newValue);
  }

  void _goToPrevious() {
    if (currentIndex <= 0) {
      return;
    }

    setState(() {
      currentIndex--;
    });
  }

  void _goToNext() {
    if (currentIndex >= widget.steps.length - 1) {
      return;
    }

    setState(() {
      currentIndex++;
    });
  }

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
                        HajjIconButton(
                          tooltip: 'Kembali',
                          icon: Icons.arrow_back_rounded,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Expanded(
                          child: Text(
                            'LANGKAH ${step.number}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: colors.onSurface,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(width: 46),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _GuideStepHero(step: step),
                    const SizedBox(height: 16),
                    _GuideContentCard(
                      title: 'Apa yang perlu dilakukan',
                      icon: Icons.format_list_numbered_rounded,
                      accent: step.accent,
                      points: step.actions,
                    ),
                    const SizedBox(height: 14),
                    _GuideChecklistCard(step: step),
                    const SizedBox(height: 14),
                    _GuideReminderCard(
                      reminder: step.reminder,
                      accent: step.accent,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: FilledButton.icon(
                        onPressed: _toggleCompleted,
                        style: FilledButton.styleFrom(
                          backgroundColor: isCompleted
                              ? palette.softSurface
                              : step.accent,
                          foregroundColor: isCompleted
                              ? colors.onSurface
                              : Colors.white,
                        ),
                        icon: Icon(
                          isCompleted
                              ? Icons.check_circle_rounded
                              : Icons.radio_button_unchecked_rounded,
                        ),
                        label: Text(
                          isCompleted
                              ? 'Langkah telah selesai'
                              : 'Tandakan langkah selesai',
                          style: const TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: currentIndex > 0 ? _goToPrevious : null,
                            icon: const Icon(Icons.arrow_back_rounded),
                            label: const Text('Sebelumnya'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: currentIndex < widget.steps.length - 1
                                ? _goToNext
                                : null,
                            icon: const Icon(Icons.arrow_forward_rounded),
                            label: const Text('Seterusnya'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const _GuidePrototypeNotice(),
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

class HajjGuideStepData {
  const HajjGuideStepData({
    required this.number,
    required this.title,
    required this.location,
    required this.icon,
    required this.accent,
    required this.summary,
    required this.actions,
    required this.checklist,
    required this.reminder,
  });

  final String number;
  final String title;
  final String location;
  final HajjIconType icon;
  final Color accent;
  final String summary;
  final List<String> actions;
  final List<String> checklist;
  final String reminder;
}

class _GuideProgressCard extends StatelessWidget {
  const _GuideProgressCard({
    required this.completed,
    required this.total,
    required this.progress,
  });

  final int completed;
  final int total;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: palette.glassSurface,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: palette.glassBorder),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: palette.shadow,
            blurRadius: 26,
            offset: const Offset(0, 13),
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
                  color: palette.emerald.withValues(alpha: 0.11),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: HajjIcon(
                  type: HajjIconType.guide,
                  color: palette.emerald,
                  size: 29,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Kemajuan Panduan',
                      style: TextStyle(
                        color: colors.onSurface,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$completed daripada $total langkah selesai',
                      style: TextStyle(color: palette.mutedText),
                    ),
                  ],
                ),
              ),
              Text(
                '${(progress * 100).round()}%',
                style: TextStyle(
                  color: palette.emerald,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 9,
              backgroundColor: palette.softSurface,
              color: palette.emerald,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineStep extends StatelessWidget {
  const _TimelineStep({
    required this.step,
    required this.isCompleted,
    required this.isLast,
    required this.onTap,
  });

  final HajjGuideStepData step;
  final bool isCompleted;
  final bool isLast;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 52,
          child: Column(
            children: <Widget>[
              Container(
                width: 38,
                height: 38,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isCompleted
                      ? step.accent
                      : step.accent.withValues(alpha: 0.11),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: step.accent.withValues(alpha: 0.40),
                  ),
                ),
                child: isCompleted
                    ? const Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 20,
                      )
                    : Text(
                        step.number,
                        style: TextStyle(
                          color: step.accent,
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
              ),
              if (!isLast)
                Container(width: 2, height: 108, color: palette.glassBorder),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(22),
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: palette.glassSurface,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: isCompleted
                          ? step.accent.withValues(alpha: 0.32)
                          : palette.glassBorder,
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: palette.shadow,
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: step.accent.withValues(alpha: 0.11),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: HajjIcon(
                          type: step.icon,
                          color: step.accent,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              step.title,
                              style: TextStyle(
                                color: colors.onSurface,
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              step.location,
                              style: TextStyle(
                                color: step.accent,
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              step.summary,
                              style: TextStyle(
                                color: palette.mutedText,
                                fontSize: 12,
                                height: 1.45,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: palette.mutedText,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _GuideStepHero extends StatelessWidget {
  const _GuideStepHero({required this.step});

  final HajjGuideStepData step;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: step.accent.withValues(alpha: 0.11),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: step.accent.withValues(alpha: 0.28)),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              color: step.accent.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(19),
            ),
            child: HajjIcon(type: step.icon, color: step.accent, size: 35),
          ),
          const SizedBox(width: 17),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  step.location.toUpperCase(),
                  style: TextStyle(
                    color: step.accent,
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  step.title,
                  style: TextStyle(
                    color: colors.onSurface,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  step.summary,
                  style: TextStyle(color: palette.mutedText, height: 1.45),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GuideContentCard extends StatelessWidget {
  const _GuideContentCard({
    required this.title,
    required this.icon,
    required this.accent,
    required this.points,
  });

  final String title;
  final IconData icon;
  final Color accent;
  final List<String> points;

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
              Icon(icon, color: accent),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: colors.onSurface,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...List<Widget>.generate(points.length, (int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 11),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 25,
                    height: 25,
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
                      points[index],
                      style: TextStyle(color: colors.onSurface, height: 1.5),
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

class _GuideChecklistCard extends StatelessWidget {
  const _GuideChecklistCard({required this.step});

  final HajjGuideStepData step;

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
              Icon(Icons.checklist_rounded, color: step.accent),
              const SizedBox(width: 10),
              Text(
                'Checklist ringkas',
                style: TextStyle(
                  color: colors.onSurface,
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ...step.checklist.map((String item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.check_box_outline_blank_rounded,
                    color: step.accent,
                    size: 21,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item,
                      style: TextStyle(color: colors.onSurface, height: 1.5),
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

class _GuideReminderCard extends StatelessWidget {
  const _GuideReminderCard({required this.reminder, required this.accent});

  final String reminder;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: accent.withValues(alpha: 0.22)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.warning_amber_rounded, color: accent),
          const SizedBox(width: 11),
          Expanded(
            child: Text(
              reminder,
              style: TextStyle(color: palette.mutedText, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _GuidePrototypeNotice extends StatelessWidget {
  const _GuidePrototypeNotice();

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
              'Panduan ini ialah ringkasan prototaip. '
              'Urutan dan hukum akhir hendaklah disemak '
              'bersama pembimbing Haji atau panel syariah '
              'yang berautoriti.',
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
