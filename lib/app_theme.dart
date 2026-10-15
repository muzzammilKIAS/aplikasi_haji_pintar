import 'package:flutter/material.dart';

@immutable
class HajjColors extends ThemeExtension<HajjColors> {
  const HajjColors({
    required this.gradientStart,
    required this.gradientMiddle,
    required this.gradientEnd,
    required this.glassSurface,
    required this.glassBorder,
    required this.mutedText,
    required this.gold,
    required this.emerald,
    required this.danger,
    required this.softSurface,
    required this.shadow,
    required this.onAccent,
    required this.textPrimary,
    required this.textSecondary,
    required this.divider,
    required this.success,
    required this.warning,
    required this.sand,
    required this.sandSoft,
    required this.skySoft,
    required this.sageSoft,
    required this.secondaryColor,
    required this.secondarySoft,
    required this.cardSurface,
    required this.cardBorder,
  });

  final Color gradientStart;
  final Color gradientMiddle;
  final Color gradientEnd;
  final Color glassSurface;
  final Color glassBorder;
  final Color mutedText;
  final Color gold;
  final Color emerald;
  final Color danger;
  final Color softSurface;
  final Color shadow;
  final Color onAccent;

  final Color textPrimary;
  final Color textSecondary;
  final Color divider;
  final Color success;
  final Color warning;
  final Color sand;
  final Color sandSoft;
  final Color skySoft;
  final Color sageSoft;
  final Color secondaryColor;
  final Color secondarySoft;
  final Color cardSurface;
  final Color cardBorder;

  // Zamrud sebagai asas, dengan bias cahaya biru dan aksen pink asal.
  static const HajjColors light = HajjColors(
    gradientStart: Color(0xFFF5F8FA),
    gradientMiddle: Color(0xFFFBF5FA),
    gradientEnd: Color(0xFFEDF8F4),
    glassSurface: Color(0xFFFFFFFF),
    glassBorder: Color(0xFFE3E7DF),
    mutedText: Color(0xFF657369),
    gold: Color(0xFF927035),
    emerald: Color(0xFF1C5945),
    danger: Color(0xFFB64949),
    softSurface: Color(0xFFECF2EB),
    shadow: Color(0x1F213D2D),
    onAccent: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF20392E),
    textSecondary: Color(0xFF657369),
    divider: Color(0xFFE3E7DF),
    success: Color(0xFF28704F),
    warning: Color(0xFF927035),
    sand: Color(0xFFE2CCA5),
    sandSoft: Color(0xFFF5F0E5),
    skySoft: Color(0xFFE5F0FF),
    sageSoft: Color(0xFFECF2EB),
    secondaryColor: Color(0xFFB12F69),
    secondarySoft: Color(0xFFFCE6F1),
    cardSurface: Color(0xFFFFFFFF),
    cardBorder: Color(0xFFE3E7DF),
  );

  static const HajjColors dark = HajjColors(
    gradientStart: Color(0xFF111D19),
    gradientMiddle: Color(0xFF14231D),
    gradientEnd: Color(0xFF111D19),
    glassSurface: Color(0xFF1B2B23),
    glassBorder: Color(0xFF34483D),
    mutedText: Color(0xFFADBCB0),
    gold: Color(0xFFD8BE88),
    emerald: Color(0xFF9ACCAE),
    danger: Color(0xFFFF6571),
    softSurface: Color(0xFF223A2C),
    shadow: Color(0x66040E08),
    onAccent: Color(0xFF12261C),
    textPrimary: Color(0xFFF0F3EB),
    textSecondary: Color(0xFFADBCB0),
    divider: Color(0xFF34483D),
    success: Color(0xFF9ACCAE),
    warning: Color(0xFFD8BE88),
    sand: Color(0xFF4B402C),
    sandSoft: Color(0xFF302D22),
    skySoft: Color(0xFF243632),
    sageSoft: Color(0xFF223A2C),
    secondaryColor: Color(0xFFFF8FC5),
    secondarySoft: Color(0xFF392335),
    cardSurface: Color(0xFF1B2B23),
    cardBorder: Color(0xFF34483D),
  );

  @override
  HajjColors copyWith({
    Color? gradientStart,
    Color? gradientMiddle,
    Color? gradientEnd,
    Color? glassSurface,
    Color? glassBorder,
    Color? mutedText,
    Color? gold,
    Color? emerald,
    Color? danger,
    Color? softSurface,
    Color? shadow,
    Color? onAccent,
    Color? textPrimary,
    Color? textSecondary,
    Color? divider,
    Color? success,
    Color? warning,
    Color? sand,
    Color? sandSoft,
    Color? skySoft,
    Color? sageSoft,
    Color? secondaryColor,
    Color? secondarySoft,
    Color? cardSurface,
    Color? cardBorder,
  }) {
    return HajjColors(
      gradientStart: gradientStart ?? this.gradientStart,
      gradientMiddle: gradientMiddle ?? this.gradientMiddle,
      gradientEnd: gradientEnd ?? this.gradientEnd,
      glassSurface: glassSurface ?? this.glassSurface,
      glassBorder: glassBorder ?? this.glassBorder,
      mutedText: mutedText ?? this.mutedText,
      gold: gold ?? this.gold,
      emerald: emerald ?? this.emerald,
      danger: danger ?? this.danger,
      softSurface: softSurface ?? this.softSurface,
      shadow: shadow ?? this.shadow,
      onAccent: onAccent ?? this.onAccent,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      divider: divider ?? this.divider,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      sand: sand ?? this.sand,
      sandSoft: sandSoft ?? this.sandSoft,
      skySoft: skySoft ?? this.skySoft,
      sageSoft: sageSoft ?? this.sageSoft,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      secondarySoft: secondarySoft ?? this.secondarySoft,
      cardSurface: cardSurface ?? this.cardSurface,
      cardBorder: cardBorder ?? this.cardBorder,
    );
  }

  @override
  HajjColors lerp(ThemeExtension<HajjColors>? other, double t) {
    if (other is! HajjColors) {
      return this;
    }

    return HajjColors(
      gradientStart: Color.lerp(gradientStart, other.gradientStart, t)!,
      gradientMiddle: Color.lerp(gradientMiddle, other.gradientMiddle, t)!,
      gradientEnd: Color.lerp(gradientEnd, other.gradientEnd, t)!,
      glassSurface: Color.lerp(glassSurface, other.glassSurface, t)!,
      glassBorder: Color.lerp(glassBorder, other.glassBorder, t)!,
      mutedText: Color.lerp(mutedText, other.mutedText, t)!,
      gold: Color.lerp(gold, other.gold, t)!,
      emerald: Color.lerp(emerald, other.emerald, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      softSurface: Color.lerp(softSurface, other.softSurface, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      onAccent: Color.lerp(onAccent, other.onAccent, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      sand: Color.lerp(sand, other.sand, t)!,
      sandSoft: Color.lerp(sandSoft, other.sandSoft, t)!,
      skySoft: Color.lerp(skySoft, other.skySoft, t)!,
      sageSoft: Color.lerp(sageSoft, other.sageSoft, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      secondarySoft: Color.lerp(secondarySoft, other.secondarySoft, t)!,
      cardSurface: Color.lerp(cardSurface, other.cardSurface, t)!,
      cardBorder: Color.lerp(cardBorder, other.cardBorder, t)!,
    );
  }
}

extension HajjThemeContext on BuildContext {
  HajjColors get hajjColors =>
      Theme.of(this).extension<HajjColors>() ?? HajjColors.light;

  ColorScheme get appColorScheme => Theme.of(this).colorScheme;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  bool get reduceMotion => MediaQuery.maybeDisableAnimationsOf(this) ?? false;
}

/// Token gerakan: lengkung perlahan dan anggun (tanpa lantunan), dengan
/// tempoh dipendekkan kepada sifar apabila pengguna memilih "kurangkan
/// animasi" dalam tetapan peranti.
class HajjMotion {
  HajjMotion._();

  static const Curve ease = Cubic(0.25, 1, 0.5, 1);

  static const Duration fast = Duration(milliseconds: 180);
  static const Duration medium = Duration(milliseconds: 280);
  static const Duration slow = Duration(milliseconds: 450);

  static Duration of(BuildContext context, Duration duration) {
    return context.reduceMotion ? Duration.zero : duration;
  }
}

/// Gaya teks Arab. Amiri dibundel dalam assets/fonts supaya doa dan dalil
/// kekal dipaparkan dengan betul walaupun tanpa internet.
/// Nama keluarga fon seperti didaftarkan dalam pubspec.yaml. Semua berat
/// dibundel, jadi `fontWeight` sentiasa menemui wajah yang betul.
class AppFonts {
  AppFonts._();

  static const String display = 'SourceSerif4';
  static const String body = 'Inter';
  static const String arabic = 'Amiri';
}

class HajjArabic {
  HajjArabic._();

  /// Doa, talbiyah dan ayat yang dibaca — saiz besar, jarak baris lapang.
  static TextStyle recitation(Color color) {
    return TextStyle(
      fontFamily: AppFonts.arabic,
      color: color,
      fontSize: 24,
      height: 2.0,
      fontWeight: FontWeight.w700,
    );
  }

  /// Petikan teks kitab dan dalil di dalam kad rujukan.
  static TextStyle citation(Color color) {
    return TextStyle(
      fontFamily: AppFonts.arabic,
      color: color,
      fontSize: 20,
      height: 1.9,
      fontWeight: FontWeight.w700,
    );
  }
}

class AppTheme {
  AppTheme._();

  static final ThemeData light = _buildTheme(
    brightness: Brightness.light,
    palette: HajjColors.light,
  );

  static final ThemeData dark = _buildTheme(
    brightness: Brightness.dark,
    palette: HajjColors.dark,
  );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required HajjColors palette,
  }) {
    final bool isDark = brightness == Brightness.dark;

    final ColorScheme scheme =
        ColorScheme.fromSeed(
          seedColor: palette.emerald,
          brightness: brightness,
        ).copyWith(
          primary: palette.emerald,
          onPrimary: palette.onAccent,
          secondary: palette.gold,
          onSecondary: isDark
              ? const Color(0xFF201A0D)
              : const Color(0xFFFFFFFF),
          surface: palette.cardSurface,
          onSurface: palette.textPrimary,
          surfaceContainerHighest: palette.sandSoft,
          outline: palette.textSecondary,
          error: palette.danger,
        );

    final ThemeData theme = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      fontFamily: AppFonts.body,
      scaffoldBackgroundColor: palette.gradientStart,
      extensions: <ThemeExtension<dynamic>>[palette],
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontFamily: AppFonts.display,
          color: scheme.onSurface,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.6,
        ),
        headlineMedium: TextStyle(
          fontFamily: AppFonts.display,
          color: scheme.onSurface,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.4,
        ),
        titleLarge: TextStyle(
          fontFamily: AppFonts.display,
          color: scheme.onSurface,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          fontFamily: AppFonts.body,
          color: scheme.onSurface,
          fontWeight: FontWeight.w800,
        ),
        bodyLarge: TextStyle(
          fontFamily: AppFonts.body,
          color: scheme.onSurface,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          fontFamily: AppFonts.body,
          color: palette.textSecondary,
          height: 1.5,
        ),
      ),
      iconTheme: IconThemeData(color: scheme.onSurface),
      dividerColor: palette.glassBorder,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: scheme.surface,
        contentTextStyle: TextStyle(
          fontFamily: AppFonts.body,
          color: scheme.onSurface,
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: palette.emerald,
          foregroundColor: palette.onAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          textStyle: const TextStyle(
            fontFamily: AppFonts.body,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.2,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: palette.emerald,
          side: BorderSide(color: palette.emerald, width: 1.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          textStyle: const TextStyle(
            fontFamily: AppFonts.body,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: palette.emerald,
          textStyle: const TextStyle(
            fontFamily: AppFonts.body,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );

    // Arabic phrases embedded in Malay sentences fall back to Amiri instead
    // of the browser's generic Noto, matching the dedicated Arabic blocks.
    final List<String> arabicFallback = <String>[AppFonts.arabic];
    return theme.copyWith(
      textTheme: theme.textTheme.apply(fontFamilyFallback: arabicFallback),
      primaryTextTheme: theme.primaryTextTheme.apply(
        fontFamilyFallback: arabicFallback,
      ),
    );
  }
}
