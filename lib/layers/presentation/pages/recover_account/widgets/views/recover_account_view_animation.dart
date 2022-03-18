import 'package:flutter/material.dart';

class RecoverAccountViewAnimation {
  RecoverAccountViewAnimation(this.controller)
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
        secondTextOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.62,
              0.74,
              curve: Curves.ease,
            ),
          ),
        ),
        textFieldOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.62,
              0.74,
              curve: Curves.bounceIn,
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
              0.7,
              0.85,
              curve: Curves.linear,
            ),
          ),
        ),
        firstTextPinCodeOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.1,
              0.24,
              curve: Curves.ease,
            ),
          ),
        ),
        textFieldPinCodeOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.24,
              0.48,
              curve: Curves.bounceIn,
            ),
          ),
        ),
        textFieldPinCodeHorizontalPosition = Tween<double>(
          begin: 1000,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.24,
              0.48,
              curve: Curves.linear,
            ),
          ),
        ),
        secondTextPinCodeOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.52,
              0.76,
              curve: Curves.ease,
            ),
          ),
        ),
        keyboardPinCodeOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.76,
              1,
              curve: Curves.ease,
            ),
          ),
        );

  late Animation<double> firstTextOpacity;
  late Animation<double> secondTextOpacity;
  late Animation<double> textFieldOpacity;
  late Animation<double> textFieldHorizontalPosition;
  final AnimationController controller;

  late Animation<double> firstTextPinCodeOpacity;
  late Animation<double> secondTextPinCodeOpacity;
  late Animation<double> textFieldPinCodeOpacity;
  late Animation<double> keyboardPinCodeOpacity;
  late Animation<double> textFieldPinCodeHorizontalPosition;
}
