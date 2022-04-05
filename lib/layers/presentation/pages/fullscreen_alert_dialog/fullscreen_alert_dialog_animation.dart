import 'package:flutter/animation.dart';

class FullscreenAlertDialogAnimation {
  FullscreenAlertDialogAnimation(this.controller)
      : textOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.1,
              0.4,
              curve: Curves.ease,
            ),
          ),
        ),
        buttonOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.4,
              0.7,
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
              0.7,
              0.9,
              curve: Curves.linear,
            ),
            reverseCurve: const Interval(
              0.7,
              0.9,
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
              0.7,
              0.9,
              curve: Curves.linear,
            ),
            reverseCurve: const Interval(
              0.7,
              0.9,
              curve: Curves.linear,
            ),
          ),
        );
  late Animation<double> buttonOpacity;
  late Animation<double> buttonHeight;
  late Animation<double> buttonWidth;
  late Animation<double> textOpacity;
  final AnimationController controller;
}
