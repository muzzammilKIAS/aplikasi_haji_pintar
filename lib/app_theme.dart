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
    gradientMiddle: Color(0xFFF2E9DA),
    gradientEnd: Color(0xFFEDF5F1),
    glassSurface: Color(0xEFFFFFFF),
    glassBorder: Color(0xFFD9E2DD),
    mutedText: Color(0xFF687A73),
    gold: Color(0xFFB28A46),
    emerald: Color(0xFF176D5D),
    danger: Color(0xFFC94852),
    softSurface: Color(0xFFF2EBDD),
    shadow: Color(0x22000000),
    onAccent: Color(0xFFFFFFFF),
  );

  static const HajjColors dark = HajjColors(
    gradientStart: Color(0xFF031411),
    gradientMiddle: Color(0xFF0A2D27),
    gradientEnd: Color(0xFF041513),
    glassSurface: Color(0x14FFFFFF),
    glassBorder: Color(0x1FFFFFFF),
    mutedText: Color(0xFFA8B8B4),
    gold: Color(0xFFD9B75F),
    emerald: Color(0xFF31D6A0),
    danger: Color(0xFFFF6571),
    softSurface: Color(0xFF173A34),
    shadow: Color(0x55000000),
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
          seedColor: const Color(0xFF176D5D),
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
        headlineLarge: TextStyle(
          color: scheme.onSurface,
          fontWeight: FontWeight.w900,
          letterSpacing: -1,
        ),
        headlineMedium: TextStyle(
          color: scheme.onSurface,
          fontWeight: FontWeight.w900,
          letterSpacing: -0.6,
        ),
        titleLarge: TextStyle(
          color: scheme.onSurface,
          fontWeight: FontWeight.w800,
        ),
        titleMedium: TextStyle(
          color: scheme.onSurface,
          fontWeight: FontWeight.w800,
        ),
        bodyLarge: TextStyle(color: scheme.onSurface, height: 1.5),
        bodyMedium: TextStyle(color: palette.mutedText, height: 1.5),
      ),
      iconTheme: IconThemeData(color: scheme.onSurface),
      dividerColor: palette.glassBorder,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: scheme.surface,
        contentTextStyle: TextStyle(color: scheme.onSurface),
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
          textStyle: const TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
