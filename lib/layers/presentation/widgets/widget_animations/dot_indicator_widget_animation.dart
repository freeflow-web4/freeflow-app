import 'package:flutter/animation.dart';

class DotIndicatorAnimation {
  DotIndicatorAnimation(this.controller)
      : firstDotOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.1,
              0.2,
              curve: Curves.ease,
            ),
          ),
        ),
        secondDotOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.2,
              0.3,
              curve: Curves.ease,
            ),
          ),
        ),
        thirdDotOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.3,
              0.4,
              curve: Curves.ease,
            ),
          ),
        );

  late Animation<double> firstDotOpacity;
  late Animation<double> secondDotOpacity;
  late Animation<double> thirdDotOpacity;
  final AnimationController controller;
}
