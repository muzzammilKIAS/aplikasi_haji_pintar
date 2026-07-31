import 'dart:math' as math;

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
  quran,
  crescent,
  star,
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

      case HajjIconType.quran:
        return Icons.menu_book_rounded;

      case HajjIconType.crescent:
        return Icons.wb_twilight_rounded;

      case HajjIconType.star:
        return Icons.star_rounded;
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

    if (type == HajjIconType.tawaf || type == HajjIconType.tawafWada) {
      return SizedBox(
        width: size,
        height: size,
        child: CustomPaint(painter: _TawafPainter(color: color)),
      );
    }

    if (type == HajjIconType.sai) {
      return SizedBox(
        width: size,
        height: size,
        child: CustomPaint(painter: _SaiPainter(color: color)),
      );
    }

    if (type == HajjIconType.doa) {
      return SizedBox(
        width: size,
        height: size,
        child: CustomPaint(painter: _DoaPainter(color: color)),
      );
    }

    if (type == HajjIconType.rukun) {
      return SizedBox(
        width: size,
        height: size,
        child: CustomPaint(painter: _RukunPainter(color: color)),
      );
    }

    if (type == HajjIconType.arafah) {
      return SizedBox(
        width: size,
        height: size,
        child: CustomPaint(painter: _ArafahPainter(color: color)),
      );
    }

    if (type == HajjIconType.ihram) {
      return SizedBox(
        width: size,
        height: size,
        child: CustomPaint(painter: _IhramPainter(color: color)),
      );
    }

    if (type == HajjIconType.quran) {
      return SizedBox(
        width: size,
        height: size,
        child: CustomPaint(painter: _QuranPainter(color: color)),
      );
    }

    if (type == HajjIconType.crescent) {
      return SizedBox(
        width: size,
        height: size,
        child: CustomPaint(painter: _CrescentPainter(color: color)),
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

/// Melukis ikon Tawaf: kubus Kaabah kecil di tengah dengan anak panah
/// melengkung mengelilinginya, menggambarkan pusingan tawaf. Digunakan
/// untuk `tawaf` dan `tawafWada` (tawaf perpisahan) — dua-dua tetap
/// merupakan tindakan mengelilingi Kaabah.
class _TawafPainter extends CustomPainter {
  _TawafPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final double s = size.shortestSide;
    final Offset pusat = Offset(size.width / 2, size.height / 2);

    // Kubus Kaabah kecil di tengah.
    final double sisiKubus = s * 0.34;
    final Rect kubusRect = Rect.fromCenter(
      center: pusat,
      width: sisiKubus,
      height: sisiKubus,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(kubusRect, Radius.circular(sisiKubus * 0.18)),
      Paint()..color = color,
    );

    // Laluan bulatan tawaf di sekeliling kubus.
    final double jejari = s * 0.42;
    final double lebarGaris = s * 0.075;
    final Paint gelang = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = lebarGaris
      ..strokeCap = StrokeCap.round;

    const double sudutMula = -math.pi * 0.62;
    const double sudutLiputan = math.pi * 1.5;
    canvas.drawArc(
      Rect.fromCircle(center: pusat, radius: jejari),
      sudutMula,
      sudutLiputan,
      false,
      gelang,
    );

    // Kepala anak panah pada hujung laluan, menunjukkan arah pusingan.
    final double sudutHujung = sudutMula + sudutLiputan;
    final Offset hujung = Offset(
      pusat.dx + jejari * math.cos(sudutHujung),
      pusat.dy + jejari * math.sin(sudutHujung),
    );
    final double sudutTangen = sudutHujung + math.pi / 2;
    final double panjangPanah = s * 0.14;
    final Path kepalaPanah = Path()
      ..moveTo(
        hujung.dx + panjangPanah * math.cos(sudutTangen),
        hujung.dy + panjangPanah * math.sin(sudutTangen),
      )
      ..lineTo(
        hujung.dx + panjangPanah * 0.55 * math.cos(sudutHujung),
        hujung.dy + panjangPanah * 0.55 * math.sin(sudutHujung),
      )
      ..lineTo(
        hujung.dx - panjangPanah * 0.55 * math.cos(sudutTangen - math.pi),
        hujung.dy - panjangPanah * 0.55 * math.sin(sudutTangen - math.pi),
      )
      ..close();
    canvas.drawPath(kepalaPanah, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant _TawafPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Melukis ikon Sa'i: dua "bukit" (Safa dan Marwah) dengan laluan
/// melengkung di antaranya, menggambarkan perjalanan bulak-balik yang
/// sebenar — lebih tepat berbanding ikon "orang berjalan" generik.
class _SaiPainter extends CustomPainter {
  _SaiPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final double s = size.shortestSide;
    final double dasar = size.height / 2 + s * 0.22;

    Path bukit(double pusatX) {
      final double lebar = s * 0.34;
      final double tinggi = s * 0.38;
      return Path()
        ..moveTo(pusatX - lebar / 2, dasar)
        ..quadraticBezierTo(pusatX, dasar - tinggi, pusatX + lebar / 2, dasar)
        ..close();
    }

    final double kiriX = size.width / 2 - s * 0.30;
    final double kananX = size.width / 2 + s * 0.30;

    final Paint isi = Paint()..color = color;
    canvas.drawPath(bukit(kiriX), isi);
    canvas.drawPath(bukit(kananX), isi);

    // Laluan melengkung antara dua bukit.
    final Paint laluan = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = s * 0.07
      ..strokeCap = StrokeCap.round;

    final Path lengkung = Path()
      ..moveTo(kiriX + s * 0.12, dasar - s * 0.02)
      ..quadraticBezierTo(
        size.width / 2,
        dasar + s * 0.18,
        kananX - s * 0.12,
        dasar - s * 0.02,
      );
    canvas.drawPath(lengkung, laluan);

    // Garis dasar tanah.
    canvas.drawLine(
      Offset(size.width / 2 - s * 0.46, dasar),
      Offset(size.width / 2 + s * 0.46, dasar),
      Paint()
        ..color = color.withValues(alpha: 0.5)
        ..strokeWidth = s * 0.045,
    );
  }

  @override
  bool shouldRepaint(covariant _SaiPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Melukis dua tapak tangan terangkat (isyarat berdoa) — lebih tepat
/// menggambarkan "doa" berbanding ikon buku generik.
class _DoaPainter extends CustomPainter {
  _DoaPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final double s = size.shortestSide;
    final double w = size.width;
    final double h = size.height;
    final Paint isi = Paint()..color = color;

    Path tapakTangan(double arah) {
      // arah: -1 untuk kiri, 1 untuk kanan.
      return Path()
        ..moveTo(w * 0.5 + arah * s * 0.06, h * 0.82)
        ..quadraticBezierTo(
          w * 0.5 + arah * s * 0.42,
          h * 0.78,
          w * 0.5 + arah * s * 0.40,
          h * 0.40,
        )
        ..quadraticBezierTo(
          w * 0.5 + arah * s * 0.38,
          h * 0.16,
          w * 0.5 + arah * s * 0.22,
          h * 0.18,
        )
        ..quadraticBezierTo(
          w * 0.5 + arah * s * 0.16,
          h * 0.30,
          w * 0.5 + arah * s * 0.14,
          h * 0.55,
        )
        ..quadraticBezierTo(
          w * 0.5 + arah * s * 0.10,
          h * 0.72,
          w * 0.5 + arah * s * 0.06,
          h * 0.82,
        )
        ..close();
    }

    canvas.drawPath(tapakTangan(-1), isi);
    canvas.drawPath(tapakTangan(1), isi);
  }

  @override
  bool shouldRepaint(covariant _DoaPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Melukis tiga tiang (rukun) bersambung alas dan kepala — permainan
/// visual literal untuk "rukun" (tiang/asas), berbanding ikon senarai
/// semak generik.
class _RukunPainter extends CustomPainter {
  _RukunPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final double s = size.shortestSide;
    final Paint isi = Paint()..color = color;

    final double lebarTiang = s * 0.16;
    final double tinggiTiang = s * 0.52;
    final double dasarY = size.height * 0.5 + tinggiTiang / 2;

    final List<double> pusatX = <double>[
      size.width / 2 - s * 0.28,
      size.width / 2,
      size.width / 2 + s * 0.28,
    ];

    for (final double x in pusatX) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset(x, dasarY - tinggiTiang / 2),
            width: lebarTiang,
            height: tinggiTiang,
          ),
          Radius.circular(lebarTiang * 0.2),
        ),
        isi,
      );
    }

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width / 2 - s * 0.42, dasarY, s * 0.84, s * 0.08),
        Radius.circular(s * 0.04),
      ),
      isi,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width / 2 - s * 0.42,
          dasarY - tinggiTiang - s * 0.08,
          s * 0.84,
          s * 0.08,
        ),
        Radius.circular(s * 0.04),
      ),
      isi,
    );
  }

  @override
  bool shouldRepaint(covariant _RukunPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Melukis bukit dengan penanda tiang di puncak — menggambarkan Jabal
/// Rahmah di Padang Arafah, lebih khusus berbanding ikon gunung generik.
class _ArafahPainter extends CustomPainter {
  _ArafahPainter({required this.color});

  final Color color;

  static const Color _emasPenanda = Color(0xFFC9A227);

  @override
  void paint(Canvas canvas, Size size) {
    final double s = size.shortestSide;
    final double dasarY = size.height * 0.5 + s * 0.28;
    final double puncakX = size.width / 2 - s * 0.06;
    final double puncakY = dasarY - s * 0.5;

    final Path bukit = Path()
      ..moveTo(size.width / 2 - s * 0.42, dasarY)
      ..lineTo(puncakX, puncakY)
      ..lineTo(size.width / 2 + s * 0.10, dasarY - s * 0.30)
      ..lineTo(size.width / 2 + s * 0.42, dasarY)
      ..close();
    canvas.drawPath(bukit, Paint()..color = color);

    final Rect tiang = Rect.fromLTWH(
      puncakX - s * 0.025,
      puncakY - s * 0.18,
      s * 0.05,
      s * 0.18,
    );
    canvas.drawRect(tiang, Paint()..color = _emasPenanda);
  }

  @override
  bool shouldRepaint(covariant _ArafahPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Melukis dua helai kain ihram (kain bahu melengkung + kain lilit
/// pinggang), berbanding ikon penyangkut baju generik yang tak khusus.
class _IhramPainter extends CustomPainter {
  _IhramPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final double s = size.shortestSide;
    final double w = size.width;
    final double h = size.height;
    final Paint isi = Paint()..color = color;
    final Paint garisLipat = Paint()
      ..color = Colors.black.withValues(alpha: 0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = s * 0.03;

    final Path kainAtas = Path()
      ..moveTo(w * 0.5 - s * 0.36, h * 0.30)
      ..quadraticBezierTo(w * 0.5, h * 0.12, w * 0.5 + s * 0.36, h * 0.30)
      ..quadraticBezierTo(w * 0.5 + s * 0.30, h * 0.50, w * 0.5, h * 0.46)
      ..quadraticBezierTo(
        w * 0.5 - s * 0.30,
        h * 0.50,
        w * 0.5 - s * 0.36,
        h * 0.30,
      )
      ..close();
    canvas.drawPath(kainAtas, isi);

    final Rect kainBawah = Rect.fromLTWH(
      w * 0.5 - s * 0.30,
      h * 0.50,
      s * 0.60,
      s * 0.36,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(kainBawah, Radius.circular(s * 0.10)),
      isi,
    );

    for (int i = 1; i <= 2; i++) {
      final double x = kainBawah.left + (kainBawah.width / 3) * i;
      canvas.drawLine(
        Offset(x, kainBawah.top + s * 0.04),
        Offset(x, kainBawah.bottom - s * 0.04),
        garisLipat,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _IhramPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Melukis Al-Quran terbuka dengan halaman bergerinda dan
/// cahaya wau — lebih bermakna berbanding ikon buku generik.
class _QuranPainter extends CustomPainter {
  _QuranPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final double s = size.shortestSide;
    final Paint isi = Paint()..color = color;
    final Paint terang = Paint()..color = color.withValues(alpha: 0.5);

    // Bakul buku
    final Rect buku = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: s * 0.65,
      height: s * 0.85,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(buku, Radius.circular(s * 0.06)),
      isi,
    );

    // Halaman kiri
    final Rect halamanKiri = Rect.fromLTWH(
      buku.left + s * 0.08,
      buku.top + s * 0.06,
      buku.width * 0.42,
      buku.height - s * 0.12,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(halamanKiri, Radius.circular(s * 0.03)),
      terang,
    );

    // Halaman kanan
    final Rect halamanKanan = Rect.fromLTWH(
      buku.left + buku.width * 0.50,
      buku.top + s * 0.06,
      buku.width * 0.42,
      buku.height - s * 0.12,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(halamanKanan, Radius.circular(s * 0.03)),
      terang,
    );

    // Garis wau di atas buku ( dekorasi Islam )
    final double wauY = buku.top - s * 0.06;
    final Paint wau = Paint()
      ..color = color.withValues(alpha: 0.9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = s * 0.04
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, wauY + s * 0.04),
        width: s * 0.3,
        height: s * 0.15,
      ),
      math.pi,
      math.pi,
      false,
      wau,
    );

    // Cahaya kecil di atas wau
    final Paint cahaya = Paint()..color = color.withValues(alpha: 0.6);
    canvas.drawCircle(Offset(size.width / 2, wauY - s * 0.02), s * 0.04, cahaya);
  }

  @override
  bool shouldRepaint(covariant _QuranPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Melukis bulan sabit (hilal) yang lebih khas berbanding ikon
/// generik — bentuk melengkung yang jelas dan cantik.
class _CrescentPainter extends CustomPainter {
  _CrescentPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final double s = size.shortestSide;
    final Offset pusat = Offset(size.width / 2, size.height / 2);

    final Paint bulan = Paint()..color = color;

    final double jejari = s * 0.38;
    final double gap = s * 0.10;

    final Path outer = Path()
      ..addOval(
        Rect.fromCircle(center: pusat, radius: jejari),
      );

    final Path inner = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(pusat.dx + gap, pusat.dy - gap * 0.3),
          radius: jejari * 0.85,
        ),
      );

    final Path sabit = Path.combine(
      PathOperation.difference,
      outer,
      inner,
    );

    canvas.drawPath(sabit, bulan);

    // Garis bawah sabit (refleksi halus)
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(pusat.dx, pusat.dy + jejari * 0.6),
        width: jejari * 1.4,
        height: jejari * 0.4,
      ),
      0,
      math.pi,
      false,
      Paint()
        ..color = color.withValues(alpha: 0.25)
        ..style = PaintingStyle.stroke
        ..strokeWidth = s * 0.02,
    );
  }

  @override
  bool shouldRepaint(covariant _CrescentPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
