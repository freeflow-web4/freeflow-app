import 'package:flutter/material.dart';

class AuthPageAnimations {
  final Animation<double> titleAnimationOpacity;
  final Animation<double> pinFieldAnimationOpacity;
  final Animation<double> keyboardAnimationOpacity;
  final Animation<double> confirmButtonAnimationOpacity;

  AuthPageAnimations(AnimationController controller)
      : titleAnimationOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.2,
              0.4,
              curve: Curves.ease,
            ),
          ),
        ),
        pinFieldAnimationOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.4,
              0.6,
              curve: Curves.ease,
            ),
          ),
        ),
        keyboardAnimationOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.6,
              0.8,
              curve: Curves.ease,
            ),
          ),
        ),
        confirmButtonAnimationOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.8,
              1,
              curve: Curves.ease,
            ),
          ),
        );
}
