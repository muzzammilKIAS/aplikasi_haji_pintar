/// Saiz reka bentuk sijil dalam unit logik (nisbah A4 landskap).
/// [CertificatePainter] melukis dalam koordinat ini lalu diskalakan sekata,
/// jadi pratonton dan PDF sentiasa sepadan.
class CertificateLayout {
  const CertificateLayout._();

  static const double width = 1500.0;
  static const double height = 1061.0;
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
