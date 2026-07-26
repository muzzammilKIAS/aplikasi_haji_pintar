import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'islamic_icons.dart';

class OfflineMapScreen extends StatefulWidget {
  const OfflineMapScreen({super.key});

  @override
  State<OfflineMapScreen> createState() => _OfflineMapScreenState();
}

class _OfflineMapScreenState extends State<OfflineMapScreen> {
  final TransformationController _transformationController =
      TransformationController();

  int _selectedMap = 0;

  final List<_OfflineMapData> _maps = const <_OfflineMapData>[
    _OfflineMapData(
      title: 'Peta Mina',
      subtitle: 'Kawasan khemah dan laluan utama Mina',
      assetPath: 'assets/maps/mina_map.jpg',
      icon: HajjIconType.mina,
    ),
    _OfflineMapData(
      title: 'Peta Arafah',
      subtitle: 'Kawasan utama dan panduan lokasi Arafah',
      assetPath: 'assets/maps/arafah_map.jpg',
      icon: HajjIconType.arafah,
    ),
  ];

  _OfflineMapData get _currentMap => _maps[_selectedMap];

  void _selectMap(int index) {
    setState(() {
      _selectedMap = index;
      _transformationController.value = Matrix4.identity();
    });
  }

  void _resetZoom() {
    _transformationController.value = Matrix4.identity();
  }

  void _zoomIn() {
    final Matrix4 current = _transformationController.value.clone();

    final double currentScale = current.getMaxScaleOnAxis();

    if (currentScale >= 5) {
      return;
    }

    _transformationController.value = current
      ..scaleByDouble(1.25, 1.25, 1.0, 1.0);
  }

  void _zoomOut() {
    final Matrix4 current = _transformationController.value.clone();

    final double currentScale = current.getMaxScaleOnAxis();

    if (currentScale <= 1) {
      _resetZoom();
      return;
    }

    _transformationController.value = current
      ..scaleByDouble(0.8, 0.8, 1.0, 1.0);
  }

  @override
  void dispose() {
    _transformationController.dispose();
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
              _buildMapSelector(context),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 4, 18, 18),
                  child: _buildMapViewer(context),
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
      padding: const EdgeInsets.fromLTRB(18, 14, 18, 14),
      child: Row(
        children: <Widget>[
          _MapIconButton(
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
                  'PETA LUAR TALIAN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colors.onSurface,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Mina & Arafah',
                  style: TextStyle(color: palette.mutedText, fontSize: 12),
                ),
              ],
            ),
          ),
          _MapIconButton(
            tooltip: 'Reset paparan',
            icon: Icons.center_focus_strong_rounded,
            onPressed: _resetZoom,
          ),
        ],
      ),
    );
  }

  Widget _buildMapSelector(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 14),
      child: Row(
        children: List<Widget>.generate(_maps.length, (int index) {
          final bool selected = index == _selectedMap;
          final _OfflineMapData map = _maps[index];

          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: index == 0 ? 7 : 0,
                left: index == 1 ? 7 : 0,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => _selectMap(index),
                  borderRadius: BorderRadius.circular(17),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 13,
                    ),
                    decoration: BoxDecoration(
                      color: selected
                          ? palette.emerald.withValues(alpha: 0.13)
                          : palette.glassSurface,
                      borderRadius: BorderRadius.circular(17),
                      border: Border.all(
                        color: selected
                            ? palette.emerald.withValues(alpha: 0.42)
                            : palette.glassBorder,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        HajjIcon(
                          type: map.icon,
                          color: selected ? palette.emerald : palette.mutedText,
                          size: 22,
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            map.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: selected
                                  ? colors.onSurface
                                  : palette.mutedText,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildMapViewer(BuildContext context) {
    final HajjColors palette = context.hajjColors;

    return Container(
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
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: InteractiveViewer(
              transformationController: _transformationController,
              minScale: 1,
              maxScale: 5,
              boundaryMargin: const EdgeInsets.all(120),
              child: SizedBox.expand(
                child: Image.asset(
                  _currentMap.assetPath,
                  key: ValueKey<String>(_currentMap.assetPath),
                  fit: BoxFit.contain,
                  errorBuilder:
                      (
                        BuildContext context,
                        Object error,
                        StackTrace? stackTrace,
                      ) {
                        return _buildMissingImage(context);
                      },
                ),
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 86,
            child: _buildInformationCard(context),
          ),
          Positioned(right: 14, bottom: 14, child: _buildZoomControls(context)),
          Positioned(
            left: 14,
            bottom: 14,
            child: _OfflineBadge(color: palette.emerald),
          ),
        ],
      ),
    );
  }

  Widget _buildInformationCard(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colors.surface.withValues(alpha: 0.94),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: palette.glassBorder),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: palette.gold.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(13),
            ),
            child: HajjIcon(
              type: _currentMap.icon,
              color: palette.gold,
              size: 25,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _currentMap.title,
                  style: TextStyle(
                    color: colors.onSurface,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  _currentMap.subtitle,
                  style: TextStyle(
                    color: palette.mutedText,
                    fontSize: 11,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildZoomControls(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colors.surface.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: palette.glassBorder),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            tooltip: 'Zoom masuk',
            onPressed: _zoomIn,
            color: colors.onSurface,
            icon: const Icon(Icons.add_rounded),
          ),
          _divider(palette),
          IconButton(
            tooltip: 'Zoom keluar',
            onPressed: _zoomOut,
            color: colors.onSurface,
            icon: const Icon(Icons.remove_rounded),
          ),
          _divider(palette),
          IconButton(
            tooltip: 'Reset',
            onPressed: _resetZoom,
            color: palette.emerald,
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
    );
  }

  Widget _divider(HajjColors palette) {
    return Container(width: 30, height: 1, color: palette.glassBorder);
  }

  Widget _buildMissingImage(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Container(
      padding: const EdgeInsets.all(26),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: <Color>[palette.softSurface, palette.gradientEnd],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          HajjIcon(
            type: _currentMap.icon,
            color: palette.gold,
            size: 78,
            strokeWidth: 4.2,
          ),
          const SizedBox(height: 18),
          Text(
            'Gambar ${_currentMap.title} '
            'belum ditemui',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colors.onSurface,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Masukkan fail ke:\n'
            '${_currentMap.assetPath}',
            textAlign: TextAlign.center,
            style: TextStyle(color: palette.mutedText, height: 1.5),
          ),
        ],
      ),
    );
  }
}

class _OfflineMapData {
  const _OfflineMapData({
    required this.title,
    required this.subtitle,
    required this.assetPath,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final String assetPath;
  final HajjIconType icon;
}

class _OfflineBadge extends StatelessWidget {
  const _OfflineBadge({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
      decoration: BoxDecoration(
        color: context.appColorScheme.surface.withValues(alpha: 0.94),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: color.withValues(alpha: 0.26)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.offline_pin_rounded, color: color, size: 16),
          const SizedBox(width: 7),
          Text(
            'Offline',
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _MapIconButton extends StatelessWidget {
  const _MapIconButton({
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
