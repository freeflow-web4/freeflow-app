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
        );

  late Animation<double> firstTextOpacity;
  late Animation<double> secondTextOpacity;
  late Animation<double> textFieldOpacity;
  late Animation<double> textFieldHorizontalPosition;
  final AnimationController controller;
}
