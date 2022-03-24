import 'package:flutter/material.dart';

class RecoverConfirmPinCodeAnimation {
  RecoverConfirmPinCodeAnimation(this.controller)
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
        );

  late Animation<double> firstTextOpacity;
  late Animation<double> textFieldHorizontalPosition;
  late Animation<double> keyboardOpacity;
  late Animation<double> buttonOpacity;
  final AnimationController controller;
}
