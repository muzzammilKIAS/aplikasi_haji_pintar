import 'package:flutter/material.dart';

import 'app_theme.dart';

class HajjJourneyViewer extends StatefulWidget {
  const HajjJourneyViewer({super.key});

  @override
  State<HajjJourneyViewer> createState() => _HajjJourneyViewerState();
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
          _ViewerIconButton(
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
          _ViewerIconButton(
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
                  child: Image.asset(
                    'assets/images/journey.jpg',
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                    errorBuilder:
                        (
                          BuildContext context,
                          Object error,
                          StackTrace? stackTrace,
                        ) {
                          return Center(
                            child: Text(
                              'Gambar tidak ditemui.\n'
                              'Pastikan fail berada di '
                              'assets/images/journey.jpg',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: colors.onSurface,
                                height: 1.5,
                              ),
                            ),
                          );
                        },
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

class _ViewerIconButton extends StatelessWidget {
  const _ViewerIconButton({
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
