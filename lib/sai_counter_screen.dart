import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'app_theme.dart';
import 'shared_widgets.dart';
import 'islamic_icons.dart';

class SaiCounterScreen extends StatefulWidget {
  const SaiCounterScreen({required this.saiBox, super.key});

  final Box<dynamic> saiBox;

  @override
  State<SaiCounterScreen> createState() => _SaiCounterScreenState();
}

class _SaiCounterScreenState extends State<SaiCounterScreen> {
  static const int totalTrips = 7;
  static const String storageKey = 'completedSaiTrips';

  int completedTrips = 0;

  bool get isCompleted => completedTrips >= totalTrips;

  int get currentTrip => isCompleted ? totalTrips : completedTrips + 1;

  String get currentDirection {
    if (isCompleted) {
      return 'Sa’i selesai di Marwah';
    }

    return completedTrips.isEven ? 'Safa → Marwah' : 'Marwah → Safa';
  }

  @override
  void initState() {
    super.initState();

    final dynamic savedValue = widget.saiBox.get(storageKey, defaultValue: 0);

    if (savedValue is int) {
      completedTrips = savedValue.clamp(0, totalTrips).toInt();
    }
  }

  Future<void> tambahPerjalanan() async {
    if (isCompleted) {
      return;
    }

    setState(() {
      completedTrips++;
    });

    await widget.saiBox.put(storageKey, completedTrips);
  }

  Future<void> undurPerjalanan() async {
    if (completedTrips <= 0) {
      return;
    }

    setState(() {
      completedTrips--;
    });

    await widget.saiBox.put(storageKey, completedTrips);
  }

  Future<void> resetKaunter() async {
    setState(() {
      completedTrips = 0;
    });

    await widget.saiBox.put(storageKey, 0);
  }

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;
    final double progress = completedTrips / totalTrips;

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
            padding: const EdgeInsets.all(20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 680),
                child: Column(
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
                            'KAUNTER SA’I',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: colors.onSurface,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                        HajjIconButton(
                          tooltip: 'Reset',
                          icon: Icons.restart_alt_rounded,
                          onPressed: resetKaunter,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        color: palette.glassSurface,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: palette.glassBorder),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: palette.shadow,
                            blurRadius: 28,
                            offset: const Offset(0, 14),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 13,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: palette.gold.withValues(alpha: 0.10),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: palette.gold.withValues(alpha: 0.25),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                HajjIcon(
                                  type: HajjIconType.sai,
                                  color: palette.gold,
                                  size: 20,
                                  strokeWidth: 5,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Safa dan Marwah',
                                  style: TextStyle(
                                    color: palette.gold,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 28),
                          SizedBox(
                            width: 220,
                            height: 220,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
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
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      isCompleted ? 'SELESAI' : 'PERJALANAN',
                                      style: TextStyle(
                                        color: palette.mutedText,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '$currentTrip',
                                      style: TextStyle(
                                        color: colors.onSurface,
                                        fontSize: 72,
                                        height: 1,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '$completedTrips / '
                                      '$totalTrips selesai',
                                      style: TextStyle(
                                        color: palette.emerald,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 26),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(17),
                            decoration: BoxDecoration(
                              color: palette.emerald.withValues(alpha: 0.09),
                              borderRadius: BorderRadius.circular(17),
                              border: Border.all(
                                color: palette.emerald.withValues(alpha: 0.20),
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'ARAH SEMASA',
                                  style: TextStyle(
                                    color: palette.mutedText,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 1.8,
                                  ),
                                ),
                                const SizedBox(height: 7),
                                Text(
                                  currentDirection,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: colors.onSurface,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            height: 66,
                            child: FilledButton.icon(
                              onPressed: isCompleted ? null : tambahPerjalanan,
                              icon: Icon(
                                isCompleted
                                    ? Icons.check_circle_rounded
                                    : Icons.touch_app_rounded,
                              ),
                              label: Text(
                                isCompleted
                                    ? 'Sa’i selesai'
                                    : 'Selesai perjalanan $currentTrip',
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextButton.icon(
                            onPressed: completedTrips > 0
                                ? undurPerjalanan
                                : null,
                            icon: const Icon(Icons.undo_rounded),
                            label: const Text('Batalkan perjalanan terakhir'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: palette.gold.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: palette.gold.withValues(alpha: 0.18),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.info_outline_rounded, color: palette.gold),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Safa ke Marwah dikira satu perjalanan. '
                              'Perjalanan kembali dari Marwah ke Safa '
                              'dikira sebagai perjalanan berikutnya.',
                              style: TextStyle(
                                color: palette.mutedText,
                                height: 1.5,
                              ),
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
      ),
    );
  }
}
