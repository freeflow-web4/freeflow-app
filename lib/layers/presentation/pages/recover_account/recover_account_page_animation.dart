import 'package:flutter/animation.dart';

class RecoverAccountPageAnimation {
  RecoverAccountPageAnimation(this.controller)
      : buttonOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.85,
              0.95,
              curve: Curves.ease,
            ),
          ),
        ),
        buttonHeight = Tween<double>(
          begin: 1.2,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.95,
              1,
              curve: Curves.linear,
            ),
          ),
        ),
        buttonWidth = Tween<double>(
          begin: 1.2,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.95,
              1,
              curve: Curves.linear,
            ),
          ),
        ),
        dotOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.1,
              0.15,
              curve: Curves.ease,
            ),
          ),
        );
  late Animation<double> buttonOpacity;
  late Animation<double> buttonHeight;
  late Animation<double> buttonWidth;
  late Animation<double> dotOpacity;
  final AnimationController controller;
}
