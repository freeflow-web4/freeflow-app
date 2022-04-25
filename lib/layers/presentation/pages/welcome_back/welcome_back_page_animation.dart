import 'package:flutter/animation.dart';

class WelcomeBackPageAnimation {
  WelcomeBackPageAnimation(this.controller)
      : firstTextOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.3,
              0.7,
              curve: Curves.ease,
            ),
          ),
        ),
        secondTextOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.7,
              1,
              curve: Curves.ease,
            ),
          ),
        );

  late Animation<double> firstTextOpacity;
  late Animation<double> secondTextOpacity;
  final AnimationController controller;
}
