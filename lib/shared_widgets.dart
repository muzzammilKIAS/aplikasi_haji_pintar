// Widget-widget umum yang digunakan merentasi banyak skrin dalam aplikasi.
//
// Fail ini wujud untuk mengelakkan penyalinan kod yang sama pada setiap
// skrin (contoh: butang ikon bulat, header skrin, dan latar belakang
// gradient). Sebelum ini, kod yang serupa persis wujud secara berasingan
// dalam certificate_screen.dart, final_assessment_screen.dart,
// hajj_guide_screen.dart, learning_module_screen.dart,
// hajj_journey_viewer.dart, offline_map_screen.dart, dan
// sai_counter_screen.dart.
import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'islamic_icons.dart';

/// Butang ikon bulat dengan gaya "glass" konsisten, digunakan pada header
/// hampir semua skrin (butang kembali, reset, tetapan, dsb).
///
/// Gantian untuk: `_CertificateIconButton`, `_AssessmentIconButton`,
/// `_GuideIconButton`, `_ViewerIconButton`, `_LearningIconButton`,
/// `_MapIconButton`, `_ThemeIconButton` (semuanya kod yang sama persis).
class HajjIconButton extends StatelessWidget {
  const HajjIconButton({
    required this.tooltip,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  final String tooltip;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;

    return IconButton(
      tooltip: tooltip,
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: palette.glassSurface,
        foregroundColor: context.appColorScheme.onSurface,
        side: BorderSide(color: palette.glassBorder),
      ),
      icon: Icon(icon),
    );
  }
}

/// Header standard skrin: butang kembali, tajuk + subtajuk di tengah, dan
/// satu butang aksi pilihan di sebelah kanan (contoh: reset paparan).
///
/// Gantian untuk struktur `Row` yang diulang dalam `_buildHeader` pada
/// hajj_journey_viewer.dart, offline_map_screen.dart, dan skrin lain yang
/// mempunyai reka bentuk header serupa.
class HajjScreenHeader extends StatelessWidget {
  const HajjScreenHeader({
    required this.title,
    this.subtitle,
    this.onBack,
    this.trailingIcon,
    this.trailingTooltip,
    this.onTrailingPressed,
    super.key,
  });

  final String title;
  final String? subtitle;
  final VoidCallback? onBack;
  final IconData? trailingIcon;
  final String? trailingTooltip;
  final VoidCallback? onTrailingPressed;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
      child: Row(
        children: <Widget>[
          HajjIconButton(
            tooltip: 'Kembali',
            icon: Icons.arrow_back_rounded,
            onPressed: onBack ?? () => Navigator.of(context).pop(),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colors.onSurface,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                  ),
                ),
                if (subtitle != null) ...<Widget>[
                  const SizedBox(height: 3),
                  Text(
                    subtitle!,
                    style: TextStyle(color: palette.mutedText, fontSize: 12),
                  ),
                ],
              ],
            ),
          ),
          if (trailingIcon != null)
            HajjIconButton(
              tooltip: trailingTooltip ?? '',
              icon: trailingIcon!,
              onPressed: onTrailingPressed ?? () {},
            )
          else
            const SizedBox(width: 48),
        ],
      ),
    );
  }
}

/// Scaffold standard dengan latar belakang gradient bertema (emerald/gold)
/// yang digunakan pada hampir semua skrin dalam aplikasi. Elakkan menyalin
/// `AnimatedContainer` + `LinearGradient` yang sama pada setiap skrin baharu.
class HajjScaffold extends StatelessWidget {
  const HajjScaffold({
    required this.body,
    this.floatingActionButton,
    super.key,
  });

  final Widget body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;

    return Scaffold(
      floatingActionButton: floatingActionButton,
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 320),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              palette.gradientStart,
              palette.gradientMiddle,
              palette.gradientEnd,
            ],
          ),
        ),
        child: body,
      ),
    );
  }
}

/// Kotak "glass" separuh lut sinar yang digunakan sebagai bekas kad pada
/// papan pemuka dan pelbagai skrin lain.
class GlassContainer extends StatelessWidget {
  const GlassContainer({
    required this.child,
    required this.borderRadius,
    required this.padding,
    this.borderColor,
    super.key,
  });

  final Widget child;
  final double borderRadius;
  final EdgeInsets padding;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 260),
          padding: padding,
          decoration: BoxDecoration(
            color: palette.glassSurface,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: borderColor ?? palette.glassBorder),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: palette.shadow,
                blurRadius: 32,
                offset: const Offset(0, 16),
              ),
              BoxShadow(
                color: palette.shadow.withValues(alpha: 0.06),
                blurRadius: 60,
                offset: const Offset(0, 30),
                spreadRadius: -6,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

/// Butang bulat gaya "glass" bersaiz tetap (46x46), digunakan pada panel
/// papan pemuka dan skrin kaunter Tawaf.
class GlassButton extends StatelessWidget {
  const GlassButton({
    required this.icon,
    this.tooltip,
    this.onPressed,
    super.key,
  });

  final IconData icon;
  final String? tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return IconButton(
      tooltip: tooltip,
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: palette.glassSurface,
        foregroundColor: colors.onSurface,
        fixedSize: const Size(46, 46),
        side: BorderSide(color: palette.glassBorder),
      ),
      icon: Icon(icon),
    );
  }
}

/// "Pil" status kecil dengan ikon + label (contoh: "Sistem aktif").
class StatusPill extends StatelessWidget {
  const StatusPill({
    required this.label,
    this.icon,
    this.hajjIcon,
    this.accentColor,
    super.key,
  }) : assert(icon != null || hajjIcon != null, 'Sediakan icon atau hajjIcon.');

  final IconData? icon;
  final HajjIconType? hajjIcon;
  final String label;
  final Color? accentColor;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final Color accent = accentColor ?? palette.emerald;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: accent.withValues(alpha: 0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (hajjIcon != null)
            HajjIcon(type: hajjIcon!, color: accent, size: 17, strokeWidth: 5.2)
          else
            Icon(icon, size: 15, color: accent),
          const SizedBox(width: 7),
          Text(
            label,
            style: TextStyle(
              color: accent,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

/// Cebisan maklumat kecil bergaya "glass" (contoh: "Online", "Sambungan
/// selamat") digunakan pada kad panel papan pemuka.
class MiniInformation extends StatelessWidget {
  const MiniInformation({required this.icon, required this.label, super.key});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
      decoration: BoxDecoration(
        color: palette.glassSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: palette.glassBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 16, color: palette.emerald),
          const SizedBox(width: 7),
          Text(
            label,
            style: TextStyle(
              color: colors.onSurface,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

/// Bulatan cahaya lembut (decorative glow) untuk hiasan latar belakang.
class GlowCircle extends StatelessWidget {
  const GlowCircle({required this.size, required this.color, super.key});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
        child: const SizedBox.expand(),
      ),
    );
  }
}

/// Titik bercahaya kecil (contoh: penunjuk status "aktif").
class GlowDot extends StatelessWidget {
  const GlowDot({required this.size, required this.color, super.key});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: <BoxShadow>[
          BoxShadow(color: color, blurRadius: 18, spreadRadius: 3),
        ],
      ),
    );
  }
}

/// Pembahagi hiasan pendek — garis nipis, berlian kecil di tengah, garis
/// nipis — digunakan untuk memisahkan sapaan daripada penerangan pada kad
/// hero halaman utama.
class HajjOrnamentDivider extends StatelessWidget {
  const HajjOrnamentDivider({required this.color, super.key});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(height: 1, color: color.withValues(alpha: 0.5)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Transform.rotate(
            angle: 0.7853981633974483, // 45 darjah
            child: Container(width: 6, height: 6, color: color),
          ),
        ),
        Expanded(
          child: Container(height: 1, color: color.withValues(alpha: 0.5)),
        ),
      ],
    );
  }
}
