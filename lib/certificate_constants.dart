import 'dart:ui';

/// Ruang teks dinamik di atas templat sijil (1492 × 1054 piksel).
///
/// Semua nilai dalam piksel templat asal dan diukur terus daripada
/// assets/images/sijil-pencapaian-hajipintar.png. Pratonton dan PDF
/// dilukis oleh [CertificatePainter] yang sama, jadi nilai di sini hanya
/// perlu dilaras sekali.
class CertificateLayout {
  const CertificateLayout._();

  static const double templateWidth = 1492.0;
  static const double templateHeight = 1054.0;
  static const String templateAsset =
      'assets/images/sijil-pencapaian-hajipintar.png';

  /// Nama: di tengah, duduk di atas garisan panjang (y=545, x 223–1283).
  static const CertificateSlot name = CertificateSlot(
    left: 246,
    width: 1000,
    baseline: 528,
    fontSize: 52,
    align: TextAlign.center,
  );

  /// Tahap: selepas label "Tahap Pencapaian:" (tamat x=825), sebelum
  /// ornamen kanan (bermula x=1015). Garis dasar sama dengan label.
  static const CertificateSlot achievement = CertificateSlot(
    left: 845,
    width: 162,
    baseline: 716,
    fontSize: 32,
  );

  /// Tarikh: di atas garisan x 579–707; boleh melepasi hujung garisan
  /// sehingga sebelum pembahagi menegak (x≈745).
  static const CertificateSlot date = CertificateSlot(
    left: 584,
    width: 152,
    baseline: 791,
    fontSize: 19,
  );

  /// Nombor sijil: di atas garisan x 937–1055, dengan sedikit limpahan.
  static const CertificateSlot number = CertificateSlot(
    left: 942,
    width: 132,
    baseline: 791,
    fontSize: 19,
  );

  static const Color nameColor = Color(0xFF006B57);
  static const Color achievementColor = Color(0xFFB46A16);
  static const Color detailColor = Color(0xFF16231F);
}

/// Satu ruang teks: kotak mendatar dan garis dasar abjad (baseline).
/// Teks yang lebih lebar daripada [width] dikecilkan supaya muat.
class CertificateSlot {
  const CertificateSlot({
    required this.left,
    required this.width,
    required this.baseline,
    required this.fontSize,
    this.align = TextAlign.left,
  });

  final double left;
  final double width;
  final double baseline;
  final double fontSize;
  final TextAlign align;
}

/// Tahap pencapaian mengikut markah — sama dengan ambang penilaian akhir.
String achievementLevelForScore(int score) {
  if (score >= 95) {
    return 'CEMERLANG';
  } else if (score >= 90) {
    return 'SANGAT BAIK';
  }
  return 'LULUS';
}

String formatCertificateDate(DateTime date) {
  const List<String> months = <String>[
    'Januari',
    'Februari',
    'Mac',
    'April',
    'Mei',
    'Jun',
    'Julai',
    'Ogos',
    'September',
    'Oktober',
    'November',
    'Disember',
  ];
  return '${date.day} ${months[date.month - 1]} ${date.year}';
}
