import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:freeflow/pages/navigation/nav_option.dart';
import 'package:freeflow/pages/navigation/navigation.dart';
import 'package:flutter/material.dart' hide Image, Draggable;
import 'dart:math' as math;

enum ArcDirection { left, right }

class NavArc extends PositionComponent with HasGameRef<NavigationScreen> {
  late final List<NavOption> navOptions;
  ArcDirection direction;

  double startAngle = 0;
  double sweepAngle = math.pi;

  Vector2 gameSize;

  Vector2 padding = Vector2(120, 120);

  @override
  bool debugMode = false;

  NavArc(
    this.navOptions, {
    required this.direction,
    required this.gameSize,
    Vector2? size,
    Vector2? position,
  }) : super(
          size: size ?? Vector2(323 / 2, 323),
          position: position ?? Vector2.all(0),
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    switch (direction) {
      case ArcDirection.left:
        startAngle = -math.pi / 2;
        break;
      case ArcDirection.right:
        startAngle = math.pi / 2;
        position = Vector2(gameSize.x - (size.x) - (padding.x),
            ((gameSize.y / 2) - (size.y / 2)) - (padding.y / 2));
        break;
    }
    size.add(padding);

    for (var i = 0; i < navOptions.length; i++) {
      NavOption navOption = navOptions[i];
      add(navOption..position = getOptPosition(i));
    }
  }

  @override
  void render(Canvas canvas) async {
    final rect = Rect.fromLTRB(
      (padding.x / 2) + 32,
      padding.y / 2,
      (size.x * 2) - (padding.x),
      size.y - (padding.y / 2),
    );
    final paint = Paint()
      ..color = const Color(0xff2AB7BB)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  int calcRadius() {
    double maxWidth = (size.x * 2) - (padding.x);
    double maxHeight = size.y - (padding.y / 2);
    double circleSize = 0.9;
    double radius = 2 * maxHeight <= maxWidth
        ? maxHeight * circleSize
        : ((maxWidth / 2) * circleSize);
    return radius.round();
  }

  Vector2 getOptPosition(int i) {
    double maxWidth = (size.x * 2) - (padding.x / 2);
    double maxHeight = size.y;
    int finalRadius = calcRadius();
    double angle = -(math.pi / (navOptions.length - 1));
    double circleSize2 = 20 / 100;
    double r = ((2 * finalRadius * (1 - circleSize2)) / 2);
    double posX = r * math.cos(angle * i - math.pi / 2);
    double posY = r * math.sin(angle * i - math.pi / 2);
    posX = posX + (maxWidth / 2);
    posY = posY + (maxHeight / 2);
    return Vector2(posX, posY);
  }
}
