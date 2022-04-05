
import 'package:flutter/material.dart';

class CreateWalletPrivateKeyShowStateAnimations {
  final Animation<double> title1Opacity;
  final Animation<double> pinFieldAnimationOpacity;
  final Animation<double> keyboardAnimationOpacity;
  final Animation<double> confirmButtonAnimationOpacity;

  CreateWalletPrivateKeyShowStateAnimations(AnimationController controller)
      : title1Opacity = Tween<double>(begin: 0, end: 1).animate(
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
