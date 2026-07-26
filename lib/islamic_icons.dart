import 'package:flutter/material.dart';

enum HajjIconType {
  mosque,
  kaaba,
  tawaf,
  sai,
  map,
  emergency,
  learning,
  guide,
  rukun,
  ihram,
  dam,
  doa,
  quiz,
  preparation,
  arafah,
  muzdalifah,
  mina,
  tahallul,
  tawafWada,
}

class HajjIcon extends StatelessWidget {
  const HajjIcon({
    required this.type,
    required this.color,
    this.size = 28,
    this.strokeWidth = 4.2,
    super.key,
  });

  final HajjIconType type;
  final Color color;
  final double size;

  // Dikekalkan untuk keserasian dengan kod lama.
  final double strokeWidth;

  IconData get iconData {
    switch (type) {
      case HajjIconType.mosque:
        return Icons.mosque_rounded;

      case HajjIconType.kaaba:
        return Icons.view_in_ar_rounded;

      case HajjIconType.tawaf:
        return Icons.rotate_right_rounded;

      case HajjIconType.sai:
        return Icons.directions_walk_rounded;

      case HajjIconType.map:
        return Icons.map_rounded;

      case HajjIconType.emergency:
        return Icons.sos_rounded;

      case HajjIconType.learning:
        return Icons.menu_book_rounded;

      case HajjIconType.guide:
        return Icons.route_rounded;

      case HajjIconType.rukun:
        return Icons.fact_check_rounded;

      case HajjIconType.ihram:
        return Icons.checkroom_rounded;

      case HajjIconType.dam:
        return Icons.volunteer_activism_rounded;

      case HajjIconType.doa:
        return Icons.auto_stories_rounded;

      case HajjIconType.quiz:
        return Icons.quiz_rounded;

      case HajjIconType.preparation:
        return Icons.luggage_rounded;

      case HajjIconType.arafah:
        return Icons.landscape_rounded;

      case HajjIconType.muzdalifah:
        return Icons.nights_stay_rounded;

      case HajjIconType.mina:
        return Icons.holiday_village_rounded;

      case HajjIconType.tahallul:
        return Icons.content_cut_rounded;

      case HajjIconType.tawafWada:
        return Icons.directions_walk_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double glowBlur = size * (0.24 + (strokeWidth * 0.004));

    return Icon(
      iconData,
      size: size,
      color: color,
      shadows: <Shadow>[
        Shadow(color: color.withValues(alpha: 0.20), blurRadius: glowBlur),
      ],
    );
  }
}
