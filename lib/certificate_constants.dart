/// Koordinat dynamic text di atas template sijil rasmi.
///
/// Template asal berukuran 1492 × 1054 piksel.
/// Semua koordinat adalah dalam unit piksel template asal.
/// Preview dan PDF mesti menggunakan nilai yang sama dan menyesuaikan
/// mengikut skala paparan atau halaman PDF.
class CertificateCoordinates {
  const CertificateCoordinates._();

  static const double templateWidth = 1492.0;
  static const double templateHeight = 1054.0;

  // Nama peserta — di tengah, di atas garisan panjang.
  static const double nameX = 746.0;
  static const double nameY = 500.0;
  static const double nameFontSize = 42.0;
  static const String nameFontFamily = 'PlayfairDisplay';
  static const String nameColor = '0xFF006B57';

  // Tahap pencapaian — nilai sahaja selepas label tetap.
  static const double achievementX = 855.0;
  static const double achievementY = 692.0;
  static const double achievementFontSize = 23.0;
  static const String achievementFontFamily = 'PlayfairDisplay';
  static const String achievementColor = '0xFFB46A16';

  // Tarikh — nilai sahaja selepas label tetap.
  static const double dateX = 644.0;
  static const double dateY = 768.0;
  static const double dateFontSize = 18.0;
  static const String dateFontFamily = 'PlusJakartaSans';
  static const String dateColor = '0xFF16231F';

  // Nombor sijil — nilai sahaja selepas label tetap.
  static const double certificateNumberX = 1000.0;
  static const double certificateNumberY = 768.0;
  static const double certificateNumberFontSize = 18.0;
  static const String certificateNumberFontFamily = 'PlusJakartaSans';
  static const String certificateNumberColor = '0xFF16231F';

  /// Memilih saiz font nama berdasarkan panjang aksara.
  static double nameFontSizeForLength(int length) {
    if (length <= 24) {
      return 42.0;
    } else if (length <= 36) {
      return 36.0;
    } else if (length <= 48) {
      return 31.0;
    }
    return 27.0;
  }
}
