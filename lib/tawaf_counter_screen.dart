import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'app_theme.dart';
import 'islamic_icons.dart';
import 'shared_widgets.dart';

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
                                style: GoogleFonts.amiri(
                                  color: colors.onSurface,
                                  fontSize: 25,
                                  height: 2.0,
                                  fontWeight: FontWeight.w600,
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
