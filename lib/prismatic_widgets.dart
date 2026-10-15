import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'app_theme.dart';

/// The original dashboard colours, paired with readable light-mode ink.
enum PrismAccent {
  emerald(Color(0xFF39C99E), Color(0xFF1C5945)),
  pink(Color(0xFFFF6FA8), Color(0xFFB12F69)),
  blue(Color(0xFF3E8BFF), Color(0xFF285DB0)),
  violet(Color(0xFF9B7BFF), Color(0xFF7151B8)),
  teal(Color(0xFF2FC6B6), Color(0xFF146F66)),
  gold(Color(0xFFFFB648), Color(0xFF8C661D));

  const PrismAccent(this.glow, this.ink);
  final Color glow;
  final Color ink;
  Color foreground(BuildContext context) => context.isDarkMode ? glow : ink;
}

/// Static ambient light: no animation work is spent on the full page.
class PrismaticBackdrop extends StatelessWidget {
  const PrismaticBackdrop({super.key});
  @override
  Widget build(BuildContext context) => IgnorePointer(
    child: RepaintBoundary(
      child: CustomPaint(
        painter: _AmbientPainter(dark: context.isDarkMode),
        child: const SizedBox.expand(),
      ),
    ),
  );
}

class _AmbientPainter extends CustomPainter {
  const _AmbientPainter({required this.dark});
  final bool dark;
  @override
  void paint(Canvas canvas, Size size) {
    final Rect bounds = Offset.zero & size;
    for (final (Alignment, Color, double) light in <(Alignment, Color, double)>[
      (const Alignment(.95, -.9), PrismAccent.pink.glow, .56),
      (const Alignment(-.9, -.5), PrismAccent.blue.glow, .70),
      (const Alignment(.75, .9), PrismAccent.violet.glow, .60),
      (const Alignment(-.8, .9), PrismAccent.emerald.glow, .64),
    ]) {
      canvas.drawRect(
        bounds,
        Paint()
          ..shader = RadialGradient(
            center: light.$1,
            radius: light.$3,
            colors: <Color>[
              light.$2.withValues(alpha: dark ? .12 : .11),
              light.$2.withValues(alpha: 0),
            ],
          ).createShader(bounds),
      );
    }
  }

  @override
  bool shouldRepaint(_AmbientPainter oldDelegate) => oldDelegate.dark != dark;
}

/// A softly tinted surface with pointer-following light and a lit border.
/// Only its paint layer updates as the pointer moves; content is retained.
class PrismaticSurface extends StatefulWidget {
  const PrismaticSurface({
    required this.child,
    this.accent = PrismAccent.emerald,
    this.background,
    this.radius = 18,
    this.lift = true,
    this.minHeight = 0,
    super.key,
  });
  final Widget child;
  final PrismAccent accent;
  final Color? background;
  final double radius;
  final bool lift;
  final double minHeight;
  @override
  State<PrismaticSurface> createState() => _PrismaticSurfaceState();
}

class _PrismaticSurfaceState extends State<PrismaticSurface>
    with SingleTickerProviderStateMixin {
  late final AnimationController _light = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 240),
    reverseDuration: const Duration(milliseconds: 380),
  );
  final ValueNotifier<Offset?> _pointer = ValueNotifier<Offset?>(null);
  bool _hovered = false;
  bool _focused = false;

  void _updateLight() {
    final double target = _hovered || _focused ? 1 : 0;
    if (context.reduceMotion) {
      _light.value = target;
    } else {
      _light.animateTo(target, curve: HajjMotion.ease);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (context.reduceMotion) _light.value = _hovered || _focused ? 1 : 0;
  }

  @override
  void dispose() {
    _light.dispose();
    _pointer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool dark = context.isDarkMode;
    final Color accent = widget.accent.glow;
    final Color background =
        widget.background ?? context.hajjColors.cardSurface;
    final BorderRadius radius = BorderRadius.circular(widget.radius);
    return MouseRegion(
      onEnter: (event) {
        _hovered = true;
        _pointer.value = event.localPosition;
        _updateLight();
      },
      onHover: (event) => _pointer.value = event.localPosition,
      onExit: (_) {
        _hovered = false;
        _updateLight();
      },
      child: Focus(
        canRequestFocus: false,
        onFocusChange: (focused) {
          _focused = focused;
          if (focused && !_hovered) _pointer.value = null;
          _updateLight();
        },
        child: AnimatedBuilder(
          animation: _light,
          builder: (context, child) => Transform.translate(
            offset: Offset(
              0,
              widget.lift && !context.reduceMotion ? -3 * _light.value : 0,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: radius,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: accent.withValues(
                      alpha: .035 + _light.value * (dark ? .22 : .14),
                    ),
                    blurRadius: 12 + 18 * _light.value,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: child,
            ),
          ),
          child: RepaintBoundary(
            child: ClipRRect(
              borderRadius: radius,
              child: CustomPaint(
                foregroundPainter: _SpotlightPainter(
                  light: _light,
                  pointer: _pointer,
                  accent: accent,
                  radius: widget.radius,
                  dark: dark,
                  borderOnly: true,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Color.alphaBlend(
                          accent.withValues(alpha: dark ? .09 : .07),
                          background,
                        ),
                        background,
                        Color.alphaBlend(
                          accent.withValues(alpha: dark ? .055 : .035),
                          background,
                        ),
                      ],
                    ),
                  ),
                  child: CustomPaint(
                    painter: _SpotlightPainter(
                      light: _light,
                      pointer: _pointer,
                      accent: accent,
                      radius: widget.radius,
                      dark: dark,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: widget.minHeight),
                      child: widget.child,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SpotlightPainter extends CustomPainter {
  _SpotlightPainter({
    required this.light,
    required this.pointer,
    required this.accent,
    required this.radius,
    required this.dark,
    this.borderOnly = false,
  }) : super(repaint: Listenable.merge(<Listenable>[light, pointer]));
  final Animation<double> light;
  final ValueNotifier<Offset?> pointer;
  final Color accent;
  final double radius;
  final bool dark;
  final bool borderOnly;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect bounds = Offset.zero & size;
    final RRect frame = RRect.fromRectAndRadius(
      bounds.deflate(.7),
      Radius.circular(radius),
    );
    final Offset centre =
        pointer.value ?? Offset(size.width / 2, size.height / 2);
    // Static edge keeps the surface visible on touchscreens and without motion.
    if (borderOnly) {
      canvas.drawRRect(
        frame,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.1
          ..color = accent.withValues(alpha: dark ? .24 : .21),
      );
    }
    if (light.value == 0) return;
    final Rect halo = Rect.fromCircle(center: centre, radius: 180);
    if (!borderOnly) {
      canvas.drawRect(
        bounds,
        Paint()
          ..shader = RadialGradient(
            colors: <Color>[
              accent.withValues(alpha: light.value * (dark ? .16 : .11)),
              accent.withValues(alpha: 0),
            ],
          ).createShader(halo),
      );
    }
    if (borderOnly) {
      canvas.drawRRect(
        frame,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5
          ..shader = RadialGradient(
            colors: <Color>[
              Color.lerp(
                accent,
                Colors.white,
                .5,
              )!.withValues(alpha: light.value),
              accent.withValues(alpha: light.value * .7),
              accent.withValues(alpha: 0),
            ],
            stops: const <double>[0, .4, 1],
          ).createShader(halo),
      );
    }
  }

  @override
  bool shouldRepaint(_SpotlightPainter oldDelegate) =>
      oldDelegate.accent != accent ||
      oldDelegate.dark != dark ||
      oldDelegate.radius != radius ||
      oldDelegate.borderOnly != borderOnly ||
      oldDelegate.light != light;
}

/// A bounded, slow eight-fold rosette. Animation repaints only this layer.
class KaleidoscopeField extends StatefulWidget {
  const KaleidoscopeField({this.enabled = true, super.key});
  final bool enabled;
  @override
  State<KaleidoscopeField> createState() => _KaleidoscopeFieldState();
}

class _KaleidoscopeFieldState extends State<KaleidoscopeField>
    with SingleTickerProviderStateMixin {
  late final AnimationController _turn = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 44),
  );
  void _sync() {
    if (widget.enabled &&
        !context.reduceMotion &&
        TickerMode.valuesOf(context).enabled) {
      if (!_turn.isAnimating) _turn.repeat();
    } else {
      _turn.stop();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sync();
  }

  @override
  void didUpdateWidget(KaleidoscopeField oldWidget) {
    super.didUpdateWidget(oldWidget);
    _sync();
  }

  @override
  void dispose() {
    _turn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ExcludeSemantics(
    child: IgnorePointer(
      child: RepaintBoundary(
        child: CustomPaint(painter: _KaleidoscopePainter(_turn)),
      ),
    ),
  );
}

class _KaleidoscopePainter extends CustomPainter {
  _KaleidoscopePainter(this.turn) : super(repaint: turn);
  final Animation<double> turn;
  @override
  void paint(Canvas canvas, Size size) {
    final double r = math.min(size.width, size.height) * .43;
    final double angle = turn.value * math.pi * 2;
    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(angle);
    final Rect orb = Rect.fromCircle(center: Offset.zero, radius: r * 1.3);
    canvas.drawCircle(
      Offset.zero,
      r * 1.3,
      Paint()
        ..shader = RadialGradient(
          colors: <Color>[
            PrismAccent.violet.glow.withValues(alpha: .07),
            PrismAccent.pink.glow.withValues(alpha: .13),
            PrismAccent.blue.glow.withValues(alpha: 0),
          ],
          stops: const <double>[0, .52, 1],
        ).createShader(orb),
    );
    for (int layer = 0; layer < 3; layer++) {
      canvas.save();
      canvas.rotate(-angle * layer * .45 + layer * math.pi / 8);
      final double radius = r * (1 - layer * .23);
      for (int petal = 0; petal < 8; petal++) {
        canvas.save();
        canvas.rotate(petal * math.pi / 4);
        final Color color = <Color>[
          PrismAccent.pink.glow,
          PrismAccent.blue.glow,
          PrismAccent.teal.glow,
          PrismAccent.violet.glow,
        ][(petal + layer) % 4];
        final Path facet = Path()
          ..moveTo(0, -radius)
          ..lineTo(radius * .30, -radius * .38)
          ..lineTo(0, -radius * .09)
          ..lineTo(-radius * .30, -radius * .38)
          ..close();
        canvas.drawPath(facet, Paint()..color = color.withValues(alpha: .045));
        canvas.drawPath(
          facet,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = .8
            ..color = color.withValues(alpha: .34 - layer * .055),
        );
        canvas.drawCircle(
          Offset(0, -radius),
          1.7,
          Paint()
            ..color = Color.lerp(
              color,
              Colors.white,
              .55,
            )!.withValues(alpha: .65),
        );
        canvas.restore();
      }
      canvas.restore();
    }
    canvas.drawCircle(
      Offset.zero,
      r * .97,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = .6
        ..color = const Color(0xFFD3D8FF).withValues(alpha: .16),
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(_KaleidoscopePainter oldDelegate) =>
      oldDelegate.turn != turn;
}

/// Ambient light plus the slow kaleidoscope, bundled for secondary screens.
/// `opacity` lets each screen keep the motif subtle behind its content.
class KaleidoscopeBackdrop extends StatelessWidget {
  const KaleidoscopeBackdrop({
    this.opacity = 0.5,
    this.ambientMotion = true,
    super.key,
  });
  final double opacity;
  final bool ambientMotion;

  @override
  Widget build(BuildContext context) => Stack(
    children: <Widget>[
      const Positioned.fill(child: PrismaticBackdrop()),
      Positioned.fill(
        child: Opacity(
          opacity: opacity,
          child: KaleidoscopeField(enabled: ambientMotion),
        ),
      ),
    ],
  );
}

/// Fades and lifts [child] into place once it enters the viewport of its
/// nearest scrollable ancestor, and only then — the scroll listener is
/// removed right after the reveal fires. Items already on screen when the
/// page first builds reveal immediately (after [delay]), which doubles as
/// the page's staggered entrance animation; items further down reveal as
/// the user scrolls to them. Respects reduced-motion settings.
class ScrollReveal extends StatefulWidget {
  const ScrollReveal({
    required this.child,
    this.delay = Duration.zero,
    this.offset = const Offset(0, 22),
    super.key,
  });
  final Widget child;
  final Duration delay;
  final Offset offset;

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: HajjMotion.slow,
  );
  late final Animation<double> _fade = CurvedAnimation(
    parent: _controller,
    curve: HajjMotion.ease,
  );
  ScrollPosition? _position;
  bool _revealed = false;
  bool _pending = false;
  Timer? _delayTimer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final ScrollPosition? current = Scrollable.maybeOf(context)?.position;
    if (current != _position) {
      _position?.removeListener(_checkVisibility);
      _position = current;
      _position?.addListener(_checkVisibility);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());
  }

  void _checkVisibility() {
    if (_revealed || _pending || !mounted) return;
    final RenderObject? object = context.findRenderObject();
    if (object is! RenderBox || !object.attached) return;
    final Offset topLeft = object.localToGlobal(Offset.zero);
    final double viewport = MediaQuery.sizeOf(context).height;
    final bool visible =
        topLeft.dy < viewport * 0.94 && topLeft.dy + object.size.height > 0;
    if (!visible) return;
    _revealed = true;
    _pending = true;
    _position?.removeListener(_checkVisibility);
    if (context.reduceMotion) {
      _controller.value = 1;
      _pending = false;
      return;
    }
    _delayTimer = Timer(widget.delay, () {
      _pending = false;
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _delayTimer?.cancel();
    _position?.removeListener(_checkVisibility);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (context.reduceMotion && !_revealed) {
      _revealed = true;
      _controller.value = 1;
    }
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _fade,
        builder: (context, child) => Opacity(
          opacity: _fade.value,
          child: Transform.translate(
            offset: widget.offset * (1 - _fade.value),
            child: child,
          ),
        ),
        child: widget.child,
      ),
    );
  }
}
