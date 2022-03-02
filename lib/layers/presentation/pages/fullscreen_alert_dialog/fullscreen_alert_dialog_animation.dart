import 'dart:math';

import 'package:flutter/animation.dart';

class FullscreenAlertDialogAnimation {
  FullscreenAlertDialogAnimation(this.controller)
      : buttonOpacity = Tween<double>(
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
        buttonHeight = Tween<double>(
          begin: 1,
          end: 0.8,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.4,
              0.7,
              curve: Curves.linear,
            ),
            reverseCurve: const Interval(
              0.4,
              0.7,
              curve: Curves.linear,
            ),
          ),
        ),
        buttonWidth = Tween<double>(
          begin: 1,
          end: 0.8,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.4,
              0.7,
              curve: Curves.linear,
            ),
            reverseCurve: const Interval(
              0.4,
              0.7,
              curve: Curves.linear,
            ),
          ),
        );
  late Animation<double> buttonOpacity;
  late Animation<double> buttonHeight;
  late Animation<double> buttonWidth;
  final AnimationController controller;
}
