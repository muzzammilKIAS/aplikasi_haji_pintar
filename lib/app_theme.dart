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

  static const HajjColors light = HajjColors(
    gradientStart: Color(0xFFF7F5EF),
    gradientMiddle: Color(0xFFEEF6F2),
    gradientEnd: Color(0xFFF5EEE1),
    glassSurface: Color(0xFFFFFFFF),
    glassBorder: Color(0xFFD7E1DC),
    mutedText: Color(0xFF5F716B),
    gold: Color(0xFFC4953A),
    emerald: Color(0xFF176B5B),
    danger: Color(0xFFB64949),
    softSurface: Color(0xFFF4E8CF),
    shadow: Color(0x1F000000),
    onAccent: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF19332E),
    textSecondary: Color(0xFF5F716B),
    divider: Color(0xFFE5EBE8),
    success: Color(0xFF2E7D5B),
    warning: Color(0xFFC5822D),
    sand: Color(0xFFE8D7B8),
    sandSoft: Color(0xFFF5EEE1),
    skySoft: Color(0xFFE6F1F5),
    sageSoft: Color(0xFFE7EFE6),
    secondaryColor: Color(0xFF3F8C8A),
    secondarySoft: Color(0xFFDCEEEE),
    cardSurface: Color(0xFFFFFFFF),
    cardBorder: Color(0xFFD7E1DC),
  );

  static const HajjColors dark = HajjColors(
    gradientStart: Color(0xFF020F0C),
    gradientMiddle: Color(0xFF0A2E27),
    gradientEnd: Color(0xFF031210),
    glassSurface: Color(0x17FFFFFF),
    glassBorder: Color(0x26FFFFFF),
    mutedText: Color(0xFFAAB9B4),
    gold: Color(0xFFE3C177),
    emerald: Color(0xFF37DBA8),
    danger: Color(0xFFFF6571),
    softSurface: Color(0xFF163B34),
    shadow: Color(0x66000000),
    onAccent: Color(0xFF041513),
    textPrimary: Color(0xFFF5F2EA),
    textSecondary: Color(0xFFAAB9B4),
    divider: Color(0x26FFFFFF),
    success: Color(0xFF37DBA8),
    warning: Color(0xFFE3C177),
    sand: Color(0xFF2A3A35),
    sandSoft: Color(0xFF1A2A25),
    skySoft: Color(0xFF1A252B),
    sageSoft: Color(0xFF1A2A22),
    secondaryColor: Color(0xFF5BBFB8),
    secondarySoft: Color(0xFF1A3A38),
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
      seedColor: isDark ? const Color(0xFF37DBA8) : const Color(0xFF176B5B),
      brightness: brightness,
    ).copyWith(
      primary: palette.emerald,
      onPrimary: palette.onAccent,
      secondary: palette.gold,
      onSecondary: isDark
          ? const Color(0xFF201A0D)
          : const Color(0xFFFFFFFF),
      surface: isDark ? const Color(0xFF102822) : palette.cardSurface,
      onSurface: isDark ? const Color(0xFFF5F2EA) : palette.textPrimary,
      surfaceContainerHighest: isDark
          ? const Color(0xFF183A33)
          : palette.sandSoft,
      outline: isDark ? const Color(0xFF789088) : palette.cardBorder,
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
