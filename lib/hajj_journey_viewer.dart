import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'shared_widgets.dart';

class HajjJourneyViewer extends StatefulWidget {
  const HajjJourneyViewer({super.key});

  @override
  State<HajjJourneyViewer> createState() => _HajjJourneyViewerState();
}

class HajjJourneyInfographic extends StatelessWidget {
  const HajjJourneyInfographic({this.compact = false, super.key});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    final List<_JourneyStep> steps = <_JourneyStep>[
      const _JourneyStep(
        number: '01',
        title: 'Ihram & Miqat',
        subtitle: 'Niat dan larangan ihram',
        icon: Icons.accessibility_new_rounded,
      ),
      const _JourneyStep(
        number: '02',
        title: 'Arafah',
        subtitle: 'Wukuf pada 9 Zulhijjah',
        icon: Icons.landscape_rounded,
      ),
      const _JourneyStep(
        number: '03',
        title: 'Muzdalifah',
        subtitle: 'Mabit dan kumpul batu',
        icon: Icons.nights_stay_rounded,
      ),
      const _JourneyStep(
        number: '04',
        title: 'Mina',
        subtitle: 'Melontar mengikut tertib',
        icon: Icons.route_rounded,
      ),
      const _JourneyStep(
        number: '05',
        title: 'Makkah',
        subtitle: 'Tawaf Ifadah dan Sa’i',
        icon: Icons.mosque_rounded,
      ),
    ];

    return Container(
      padding: EdgeInsets.all(compact ? 16 : 28),
      decoration: BoxDecoration(
        color: palette.glassSurface,
        borderRadius: BorderRadius.circular(compact ? 18 : 28),
        border: Border.all(color: palette.glassBorder),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'PERJALANAN HAJI',
            style: TextStyle(
              color: palette.gold,
              fontSize: compact ? 11 : 13,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Turutan utama ibadah',
            style: TextStyle(
              color: colors.onSurface,
              fontSize: compact ? 18 : 25,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: compact ? 16 : 24),
          for (int i = 0; i < steps.length; i++)
            _JourneyStepTile(
              step: steps[i],
              compact: compact,
              isLast: i == steps.length - 1,
            ),
          SizedBox(height: compact ? 12 : 20),
          _JamaratOrderCard(compact: compact),
        ],
      ),
    );
  }
}

class _JourneyStep {
  const _JourneyStep({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String number;
  final String title;
  final String subtitle;
  final IconData icon;
}

class _JourneyStepTile extends StatelessWidget {
  const _JourneyStepTile({
    required this.step,
    required this.compact,
    required this.isLast,
  });

  final _JourneyStep step;
  final bool compact;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;
    final double size = compact ? 38 : 48;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: size,
          child: Column(
            children: <Widget>[
              Container(
                width: size,
                height: size,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: palette.emerald.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: palette.emerald.withValues(alpha: 0.34),
                  ),
                ),
                child: Icon(
                  step.icon,
                  color: palette.emerald,
                  size: size * 0.48,
                ),
              ),
              if (!isLast)
                Container(
                  width: 2,
                  height: compact ? 30 : 38,
                  color: palette.emerald.withValues(alpha: 0.24),
                ),
            ],
          ),
        ),
        SizedBox(width: compact ? 12 : 16),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: compact ? 3 : 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${step.number}  ${step.title}',
                  style: TextStyle(
                    color: colors.onSurface,
                    fontSize: compact ? 13 : 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  step.subtitle,
                  style: TextStyle(
                    color: palette.mutedText,
                    fontSize: compact ? 11 : 13,
                    height: 1.35,
                  ),
                ),
                SizedBox(height: compact ? 12 : 17),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _JamaratOrderCard extends StatelessWidget {
  const _JamaratOrderCard({required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(compact ? 13 : 18),
      decoration: BoxDecoration(
        color: palette.gold.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(compact ? 15 : 20),
        border: Border.all(color: palette.gold.withValues(alpha: 0.28)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.warning_amber_rounded, color: palette.gold, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Turutan melontar di Mina',
                  style: TextStyle(
                    color: colors.onSurface,
                    fontSize: compact ? 12 : 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: <Widget>[
              _JamaratChip(number: '1', label: 'Ula', compact: compact),
              _JamaratArrow(compact: compact),
              _JamaratChip(number: '2', label: 'Wusta', compact: compact),
              _JamaratArrow(compact: compact),
              _JamaratChip(number: '3', label: 'Kubra', compact: compact),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Hari Tasyrik: 7 batu pada setiap jamrah, mengikut tertib.',
            style: TextStyle(
              color: palette.mutedText,
              fontSize: compact ? 10 : 12,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _JamaratChip extends StatelessWidget {
  const _JamaratChip({
    required this.number,
    required this.label,
    required this.compact,
  });

  final String number;
  final String label;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 8 : 11,
        vertical: compact ? 6 : 8,
      ),
      decoration: BoxDecoration(
        color: palette.emerald.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: palette.emerald.withValues(alpha: 0.30)),
      ),
      child: Text(
        '$number  $label',
        style: TextStyle(
          color: palette.emerald,
          fontSize: compact ? 10 : 12,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class _JamaratArrow extends StatelessWidget {
  const _JamaratArrow({required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_forward_rounded,
      color: context.hajjColors.gold,
      size: compact ? 14 : 18,
    );
  }
}

class _HajjJourneyViewerState extends State<HajjJourneyViewer>
    with SingleTickerProviderStateMixin {
  final TransformationController transformationController =
      TransformationController();

  late final AnimationController animationController;

  Animation<Matrix4>? matrixAnimation;

  double currentScale = 1;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    animationController.addListener(() {
      final Animation<Matrix4>? animation = matrixAnimation;

      if (animation != null) {
        transformationController.value = animation.value;
      }
    });

    transformationController.addListener(() {
      currentScale = transformationController.value.getMaxScaleOnAxis();
    });
  }

  Future<void> animateTo(Matrix4 target) async {
    animationController.stop();

    matrixAnimation =
        Matrix4Tween(
          begin: transformationController.value.clone(),
          end: target,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    await animationController.forward(from: 0);
  }

  Matrix4 scaledMatrix(double targetScale) {
    final Matrix4 current = transformationController.value.clone();

    final double existingScale = current.getMaxScaleOnAxis();

    final double ratio = targetScale / existingScale;

    return current..scaleByDouble(ratio, ratio, 1, 1);
  }

  Future<void> zoomIn() async {
    final double targetScale = (currentScale * 1.35).clamp(1, 6);

    await animateTo(scaledMatrix(targetScale));
  }

  Future<void> zoomOut() async {
    final double targetScale = (currentScale / 1.35).clamp(1, 6);

    if (targetScale <= 1.02) {
      await resetView();
      return;
    }

    await animateTo(scaledMatrix(targetScale));
  }

  Future<void> resetView() async {
    await animateTo(Matrix4.identity());
  }

  Future<void> handleDoubleTap() async {
    if (currentScale > 1.2) {
      await resetView();
    } else {
      await animateTo(scaledMatrix(2.5));
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    transformationController.dispose();
    super.dispose();
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
        child: SafeArea(
          child: Column(
            children: <Widget>[
              _buildHeader(context),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                  child: _buildViewer(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
      child: Row(
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
                  'TATACARA HAJI',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colors.onSurface,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Perjalanan Haji',
                  style: TextStyle(color: palette.mutedText, fontSize: 12),
                ),
              ],
            ),
          ),
          HajjIconButton(
            tooltip: 'Reset paparan',
            icon: Icons.center_focus_strong_rounded,
            onPressed: resetView,
          ),
        ],
      ),
    );
  }

  Widget _buildViewer(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: palette.glassSurface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: palette.glassBorder),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: palette.shadow,
            blurRadius: 32,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: GestureDetector(
              onDoubleTap: handleDoubleTap,
              child: InteractiveViewer(
                transformationController: transformationController,
                minScale: 1,
                maxScale: 6,
                boundaryMargin: const EdgeInsets.all(160),
                panEnabled: true,
                scaleEnabled: true,
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(18),
                    child: HajjJourneyInfographic(),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 14,
            left: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
              decoration: BoxDecoration(
                color: colors.surface.withValues(alpha: 0.94),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: palette.gold.withValues(alpha: 0.25)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.touch_app_rounded, color: palette.gold, size: 16),
                  const SizedBox(width: 7),
                  Text(
                    'Pinch / double-tap untuk zoom',
                    style: TextStyle(
                      color: palette.gold,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 14,
            bottom: 14,
            child: Container(
              decoration: BoxDecoration(
                color: colors.surface.withValues(alpha: 0.95),
                borderRadius: BorderRadius.circular(17),
                border: Border.all(color: palette.glassBorder),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    tooltip: 'Zoom masuk',
                    onPressed: zoomIn,
                    color: colors.onSurface,
                    icon: const Icon(Icons.add_rounded),
                  ),
                  _divider(palette),
                  IconButton(
                    tooltip: 'Zoom keluar',
                    onPressed: zoomOut,
                    color: colors.onSurface,
                    icon: const Icon(Icons.remove_rounded),
                  ),
                  _divider(palette),
                  IconButton(
                    tooltip: 'Reset',
                    onPressed: resetView,
                    color: palette.emerald,
                    icon: const Icon(Icons.refresh_rounded),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider(HajjColors palette) {
    return Container(width: 30, height: 1, color: palette.glassBorder);
  }
}
