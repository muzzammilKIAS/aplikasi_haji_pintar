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

  static const HajjColors light = HajjColors(
    gradientStart: Color(0xFFFBF8F1),
    gradientMiddle: Color(0xFFF4E9CE),
    gradientEnd: Color(0xFFE7F2EC),
    glassSurface: Color(0xF5FFFFFF),
    glassBorder: Color(0xFFDCE3DC),
    mutedText: Color(0xFF63756E),
    gold: Color(0xFFAD7B27),
    emerald: Color(0xFF0E5C4F),
    danger: Color(0xFFC94852),
    softSurface: Color(0xFFF3ECD9),
    shadow: Color(0x28000000),
    onAccent: Color(0xFFFFFFFF),
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

    final ColorScheme scheme =
        ColorScheme.fromSeed(
          seedColor: const Color(0xFF0E5C4F),
          brightness: brightness,
        ).copyWith(
          primary: palette.emerald,
          onPrimary: palette.onAccent,
          secondary: palette.gold,
          onSecondary: isDark
              ? const Color(0xFF201A0D)
              : const Color(0xFFFFFFFF),
          surface: isDark ? const Color(0xFF102822) : const Color(0xFFFFFDF8),
          onSurface: isDark ? const Color(0xFFF5F2EA) : const Color(0xFF25332E),
          surfaceContainerHighest: isDark
              ? const Color(0xFF183A33)
              : const Color(0xFFF1EBDD),
          outline: isDark ? const Color(0xFF789088) : const Color(0xFF899991),
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
          color: palette.mutedText,
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
          foregroundColor: scheme.onSurface,
          side: BorderSide(color: palette.glassBorder, width: 1.3),
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
