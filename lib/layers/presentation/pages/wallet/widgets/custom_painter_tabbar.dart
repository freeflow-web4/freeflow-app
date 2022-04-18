import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  final double radius;

  final Color color;
  final BorderSide borderSide;

  final Gradient? gradient;

  final EdgeInsetsGeometry insets;

  final double indicatorHeight;

  const CustomTabIndicator({
    this.gradient,
    this.insets = EdgeInsets.zero,
    this.borderSide = const BorderSide(width: 2.0, color: Colors.white),
    this.radius = 4,
    this.indicatorHeight = 8,
    this.color = Colors.blue,
  });

  @override
  _CustomPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(
      this,
      onChanged,
      radius,
      color,
      indicatorHeight,
    );
  }

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is CustomTabIndicator) {
      return CustomTabIndicator(
        gradient: Gradient.lerp(a.gradient, gradient, t),
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is CustomTabIndicator) {
      return CustomTabIndicator(
        gradient: Gradient.lerp(gradient, b.gradient, t),
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t)!,
      );
    }
    return super.lerpTo(b, t);
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;
  final double radius;
  final Color color;
  final double indicatorHeight;

  _CustomPainter(
    this.decoration,
    VoidCallback? onChanged,
    this.radius,
    this.color,
    this.indicatorHeight,
  ) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    final Paint paint = Paint();
    double xAxisPos = offset.dx + configuration.size!.width / 2;
    double yAxisPos = offset.dy + configuration.size!.height - 10;
    paint.color = color;
    final Rect rect = offset & configuration.size!;
    final TextDirection textDirection = configuration.textDirection!;
    RRect fullRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(xAxisPos, yAxisPos),
        width: configuration.size!.width,
        height: indicatorHeight,
      ),
      Radius.circular(radius),
    );
    paint.shader =
        decoration.gradient?.createShader(rect, textDirection: textDirection);

    canvas.drawRRect(fullRect, paint);
  }
}
