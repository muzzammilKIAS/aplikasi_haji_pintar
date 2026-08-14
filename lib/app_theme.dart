import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  // Palet biru elegan + aksen pelbagai warna (emas, mawar, teal) —
  // dikongsi oleh seluruh aplikasi (dashboard dan semua paparan dalaman)
  // supaya tema kekal konsisten merentasi skrin.
  static const HajjColors light = HajjColors(
    gradientStart: Color(0xFFEAF4FD),
    gradientMiddle: Color(0xFFF6FAFF),
    gradientEnd: Color(0xFFEFF2FC),
    glassSurface: Color(0xFFFFFFFF),
    glassBorder: Color(0xFFD9E6F5),
    mutedText: Color(0xFF5E7089),
    gold: Color(0xFFC98A2E),
    emerald: Color(0xFF2D6FE0),
    danger: Color(0xFFB64949),
    softSurface: Color(0xFFDCEBFB),
    shadow: Color(0x1F0B3D91),
    onAccent: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF152A47),
    textSecondary: Color(0xFF5E7089),
    divider: Color(0xFFE1EDF8),
    success: Color(0xFF2E9E7C),
    warning: Color(0xFFC5822D),
    sand: Color(0xFFF0DDB0),
    sandSoft: Color(0xFFF7ECD6),
    skySoft: Color(0xFFDCEEFC),
    sageSoft: Color(0xFFD9F0EA),
    secondaryColor: Color(0xFFE0608F),
    secondarySoft: Color(0xFFFBE1EA),
    cardSurface: Color(0xFFFFFFFF),
    cardBorder: Color(0xFFD9E6F5),
  );

  static const HajjColors dark = HajjColors(
    gradientStart: Color(0xFF060B1A),
    gradientMiddle: Color(0xFF0B1636),
    gradientEnd: Color(0xFF060B1A),
    glassSurface: Color(0x17FFFFFF),
    glassBorder: Color(0x26FFFFFF),
    mutedText: Color(0xFFA6B3D0),
    gold: Color(0xFFFFC96B),
    emerald: Color(0xFF6FA8FF),
    danger: Color(0xFFFF6571),
    softSurface: Color(0xFF16264A),
    shadow: Color(0x66000B2E),
    onAccent: Color(0xFF041226),
    textPrimary: Color(0xFFF2F6FF),
    textSecondary: Color(0xFFA6B3D0),
    divider: Color(0x26FFFFFF),
    success: Color(0xFF4FE0CC),
    warning: Color(0xFFFFC96B),
    sand: Color(0xFF3A2E1E),
    sandSoft: Color(0xFF241C12),
    skySoft: Color(0xFF16223B),
    sageSoft: Color(0xFF123531),
    secondaryColor: Color(0xFFFF8FC5),
    secondarySoft: Color(0xFF3A1B2C),
    cardSurface: Color(0x17FFFFFF),
    cardBorder: Color(0x26FFFFFF),
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

    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: isDark ? const Color(0xFF6FA8FF) : const Color(0xFF2D6FE0),
      brightness: brightness,
    ).copyWith(
      primary: palette.emerald,
      onPrimary: palette.onAccent,
      secondary: palette.gold,
      onSecondary: isDark
          ? const Color(0xFF201A0D)
          : const Color(0xFFFFFFFF),
      surface: isDark ? const Color(0xFF0F1A38) : palette.cardSurface,
      onSurface: isDark ? const Color(0xFFF2F6FF) : palette.textPrimary,
      surfaceContainerHighest: isDark
          ? const Color(0xFF182A55)
          : palette.sandSoft,
      outline: isDark ? const Color(0xFF6B7FA8) : palette.cardBorder,
      error: palette.danger,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: palette.gradientStart,
      extensions: <ThemeExtension<dynamic>>[palette],
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.playfairDisplay(
          color: scheme.onSurface,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.6,
        ),
        headlineMedium: GoogleFonts.playfairDisplay(
          color: scheme.onSurface,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.4,
        ),
        titleLarge: GoogleFonts.playfairDisplay(
          color: scheme.onSurface,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: GoogleFonts.plusJakartaSans(
          color: scheme.onSurface,
          fontWeight: FontWeight.w800,
        ),
        bodyLarge: GoogleFonts.plusJakartaSans(
          color: scheme.onSurface,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.plusJakartaSans(
          color: palette.textSecondary,
          height: 1.5,
        ),
      ),
      iconTheme: IconThemeData(color: scheme.onSurface),
      dividerColor: palette.glassBorder,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: scheme.surface,
        contentTextStyle: GoogleFonts.plusJakartaSans(color: scheme.onSurface),
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
          textStyle: GoogleFonts.plusJakartaSans(
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
          textStyle: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w800),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: palette.emerald,
          textStyle: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
