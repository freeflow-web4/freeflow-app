import 'package:flutter/animation.dart';

class DotIndicatorAnimation {
  DotIndicatorAnimation(
    this.controller,
    this.firstDotSizeController,
    this.secondDotSizeController,
    this.thirdDotSizeController,
  )   : firstDotOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.1,
              0.2,
              curve: Curves.ease,
            ),
          ),
        ),
        secondDotOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.2,
              0.3,
              curve: Curves.ease,
            ),
          ),
        ),
        thirdDotOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.3,
              0.4,
              curve: Curves.ease,
            ),
          ),
        ),
        firstDotHeight = Tween<double>(
          begin: 1,
          end: 1.5,
        ).animate(
          CurvedAnimation(
            parent: firstDotSizeController,
            curve: const Interval(
              0,
              0.5,
              curve: Curves.ease,
            ),
            reverseCurve: const Interval(
              0.5,
              1,
              curve: Curves.ease,
            ),
          ),
        ),
        firstDotWidth = Tween<double>(
          begin: 1,
          end: 1.5,
        ).animate(
          CurvedAnimation(
            parent: firstDotSizeController,
            curve: const Interval(
              0,
              0.5,
              curve: Curves.ease,
            ),
            reverseCurve: const Interval(
              0.5,
              1,
              curve: Curves.ease,
            ),
          ),
        ),
        secondDotHeight = Tween<double>(
          begin: 1,
          end: 1.5,
        ).animate(
          CurvedAnimation(
            parent: secondDotSizeController,
            curve: const Interval(
              0,
              0.5,
              curve: Curves.ease,
            ),
            reverseCurve: const Interval(
              0.5,
              1,
              curve: Curves.ease,
            ),
          ),
        ),
        secondDotWidth = Tween<double>(
          begin: 1,
          end: 1.5,
        ).animate(
          CurvedAnimation(
            parent: secondDotSizeController,
            curve: const Interval(
              0,
              0.5,
              curve: Curves.ease,
            ),
            reverseCurve: const Interval(
              0.5,
              1,
              curve: Curves.ease,
            ),
          ),
        ),
        thirdDotHeight = Tween<double>(
          begin: 1,
          end: 1.5,
        ).animate(
          CurvedAnimation(
            parent: thirdDotSizeController,
            curve: const Interval(
              0,
              0.5,
              curve: Curves.ease,
            ),
            reverseCurve: const Interval(
              0.5,
              1,
              curve: Curves.ease,
            ),
          ),
        ),
        thirdDotWidth = Tween<double>(
          begin: 1,
          end: 1.5,
        ).animate(
          CurvedAnimation(
            parent: thirdDotSizeController,
            curve: const Interval(
              0,
              0.5,
              curve: Curves.ease,
            ),
            reverseCurve: const Interval(
              0.5,
              1,
              curve: Curves.ease,
            ),
          ),
        );

  late Animation<double> firstDotOpacity;
  late Animation<double> secondDotOpacity;
  late Animation<double> thirdDotOpacity;
  late Animation<double> firstDotHeight;
  late Animation<double> firstDotWidth;
  late Animation<double> secondDotHeight;
  late Animation<double> secondDotWidth;
  late Animation<double> thirdDotHeight;
  late Animation<double> thirdDotWidth;
  final AnimationController controller;
  final AnimationController firstDotSizeController;
  final AnimationController secondDotSizeController;
  final AnimationController thirdDotSizeController;
}
