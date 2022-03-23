import 'package:flutter/material.dart';

class RecoverPinCodeAnimation {
  RecoverPinCodeAnimation(this.controller)
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
        biometryOpacity = Tween<double>(
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
        keyboardOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.72,
              0.84,
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
              0.84,
              0.96,
              curve: Curves.linear,
            ),
          ),
        );

  late Animation<double> firstTextOpacity;
  late Animation<double> textFieldHorizontalPosition;
  late Animation<double> biometryOpacity;
  late Animation<double> keyboardOpacity;
  late Animation<double> buttonOpacity;
  final AnimationController controller;
}
