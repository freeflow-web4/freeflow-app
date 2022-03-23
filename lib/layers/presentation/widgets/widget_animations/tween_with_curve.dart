import 'package:flutter/material.dart';

class TweenWithCurve<T extends num> extends Tween<T> {
  final Curve curve;

  TweenWithCurve({
    required T begin,
    required T end,
    this.curve = Curves.linear,
  }) : super(begin: begin, end: end);

  @override
  T lerp(double t) {
    return super.lerp(curve.transform(t));
  }
}
