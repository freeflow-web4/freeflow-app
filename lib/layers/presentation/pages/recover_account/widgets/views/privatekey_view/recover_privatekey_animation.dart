import 'package:flutter/material.dart';

class RecoverPrivateKeyAnimation {
  RecoverPrivateKeyAnimation(this.controller, this.buttonController)
      : firstTextOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.5,
              0.62,
              curve: Curves.ease,
            ),
          ),
        ),
        textFieldHorizontalPosition = Tween<double>(
          begin: 1000,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.62,
              0.74,
              curve: Curves.linear,
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
              0.7,
              0.85,
              curve: Curves.linear,
            ),
          ),
        ),
        buttonHeight = Tween<double>(
          begin: 1.2,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: buttonController,
            curve: const Interval(
              0.85,
              0.95,
              curve: Curves.linear,
            ),
          ),
        ),
        buttonWidth = Tween<double>(
          begin: 1.2,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: buttonController,
            curve: const Interval(
              0.85,
              0.95,
              curve: Curves.linear,
            ),
          ),
        );

  late Animation<double> dotsOpacity;
  late Animation<double> firstTextOpacity;
  late Animation<double> textFieldHorizontalPosition;
  late Animation<double> buttonOpacity;
  late Animation<double> buttonWidth;
  late Animation<double> buttonHeight;
  final AnimationController controller;
  final AnimationController buttonController;
}
