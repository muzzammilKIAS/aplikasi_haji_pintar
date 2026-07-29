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
        return Icons.waving_hand_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double glowBlur = size * (0.24 + (strokeWidth * 0.004));

    if (type == HajjIconType.kaaba) {
      return SizedBox(
        width: size,
        height: size,
        child: CustomPaint(painter: _KaabaPainter(color: color)),
      );
    }

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

/// Melukis ikon Kaabah ringkas (kubus + jalur emas kiswah + pintu) supaya
/// nampak dikenali sebagai Kaabah, bukan kotak 3D generik. Warna kubus
/// mengikut parameter `color` (jadi automatik sepadan mod gelap/terang);
/// jalur kiswah kekal warna emas fizikal Kaabah tanpa mengira tema.
class _KaabaPainter extends CustomPainter {
  _KaabaPainter({required this.color});

  final Color color;

  static const Color _jalurEmas = Color(0xFFC9A227);

  @override
  void paint(Canvas canvas, Size size) {
    final double s = size.shortestSide;
    final Rect kubusRect = Rect.fromLTWH(
      (size.width - s) / 2,
      (size.height - s) / 2,
      s,
      s,
    );
    final RRect kubus = RRect.fromRectAndRadius(
      kubusRect,
      Radius.circular(s * 0.14),
    );

    canvas.drawRRect(kubus, Paint()..color = color);

    // Jalur emas (kiswah) melintang pada aras satu pertiga atas kubus.
    final Rect jalurRect = Rect.fromLTWH(
      kubusRect.left,
      kubusRect.top + s * 0.32,
      s,
      s * 0.16,
    );
    canvas.save();
    canvas.clipRRect(kubus);
    canvas.drawRect(jalurRect, Paint()..color = _jalurEmas);
    canvas.restore();

    // Aksen pintu Kaabah kecil di bahagian bawah kanan.
    final double lebarPintu = s * 0.16;
    final double tinggiPintu = s * 0.22;
    final Rect pintuRect = Rect.fromLTWH(
      kubusRect.left + s * 0.62,
      kubusRect.bottom - tinggiPintu,
      lebarPintu,
      tinggiPintu,
    );
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        pintuRect,
        topLeft: Radius.circular(lebarPintu * 0.4),
        topRight: Radius.circular(lebarPintu * 0.4),
      ),
      Paint()..color = _jalurEmas.withValues(alpha: 0.85),
    );
  }

  @override
  bool shouldRepaint(covariant _KaabaPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
