import 'package:flutter/material.dart';

class RecoverConfirmPinCodeAnimation {
  RecoverConfirmPinCodeAnimation(this.controller, this.buttonController)
      : firstTextOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.3,
              0.42,
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
              0.42,
              0.57,
              curve: Curves.linear,
            ),
          ),
        ),
        keyboardOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.6,
              0.72,
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
              0.74,
              0.86,
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
            parent: buttonController,
            curve: const Interval(
              0.95,
              1,
              curve: Curves.linear,
            ),
          ),
        );

  late Animation<double> firstTextOpacity;
  late Animation<double> textFieldHorizontalPosition;
  late Animation<double> keyboardOpacity;
  late Animation<double> buttonOpacity;
  late Animation<double> buttonWidth;
  late Animation<double> buttonHeight;
  final AnimationController controller;
  final AnimationController buttonController;
}
