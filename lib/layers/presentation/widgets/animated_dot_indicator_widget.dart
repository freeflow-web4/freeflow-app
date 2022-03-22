import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freeflow/layers/presentation/widgets/animated_dot_widget.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/staggered_widgets.dart';
import 'package:freeflow/layers/presentation/widgets/widget_animations/dot_indicator_widget_animation.dart';

class AnimatedDotIndicatorWidget extends StatefulWidget {
  final int currentIndex;
  final bool makeAnimation;

  const AnimatedDotIndicatorWidget({
    Key? key,
    required this.currentIndex,
    this.makeAnimation = true,
  }) : super(key: key);

  @override
  State<AnimatedDotIndicatorWidget> createState() =>
      _AnimatedDotIndicatorWidgetState();
}

class _AnimatedDotIndicatorWidgetState extends State<AnimatedDotIndicatorWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController firstDotSizeControler;
  late AnimationController thirdDotSizeControler;
  late AnimationController secondDotSizeControler;
  late DotIndicatorAnimation animation;
  bool showIndexAnimation = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: widget.makeAnimation ? 10 : 0),
      vsync: this,
    );
    firstDotSizeControler = AnimationController(
      duration: Duration(seconds: widget.makeAnimation ? 2 : 0),
      vsync: this,
    );
    secondDotSizeControler = AnimationController(
      duration: Duration(seconds: widget.makeAnimation ? 2 : 0),
      vsync: this,
    );
    thirdDotSizeControler = AnimationController(
      duration: Duration(seconds: widget.makeAnimation ? 2 : 0),
      vsync: this,
    );

    animation = DotIndicatorAnimation(
      animationController,
      firstDotSizeControler,
      secondDotSizeControler,
      thirdDotSizeControler,
    );
    animationController.forward();
    Timer.periodic(Duration(seconds: widget.makeAnimation ? 4 : 0), (timer) {
      firstDotSizeControler.forward();
      timer.cancel();
    });
    Timer.periodic(Duration(seconds: widget.makeAnimation ? 5 : 0), (timer) {
      firstDotSizeControler.reverse();
      timer.cancel();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AnimatedDotIndicatorWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      switch (widget.currentIndex) {
        case 0:
          firstDotSizeControler.forward();
          Timer.periodic(const Duration(seconds: 1), (timer) {
            firstDotSizeControler.reverse();
            timer.cancel();
          });
          break;
        case 1:
          secondDotSizeControler.forward();
          Timer.periodic(const Duration(seconds: 1), (timer) {
            secondDotSizeControler.reverse();
            timer.cancel();
          });
          break;
        case 2:
          thirdDotSizeControler.forward();
          Timer.periodic(const Duration(seconds: 1), (timer) {
            thirdDotSizeControler.reverse();
            timer.cancel();
          });
          break;
        default:
          firstDotSizeControler.forward();
          Timer.periodic(const Duration(seconds: 1), (timer) {
            timer.cancel();
            firstDotSizeControler.reverse();
          });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StaggerOpacity(
          opacity: animation.firstDotOpacity,
          controller: animationController,
          child: StaggerScale(
            controller: firstDotSizeControler,
            height: animation.firstDotHeight,
            width: animation.firstDotWidth,
            child: AnimatedDotWidget(
              isIndex: widget.currentIndex == 0,
              isCompleted: widget.currentIndex == 1 || widget.currentIndex == 2,
            ),
          ),
        ),
        const SizedBox(width: 4),
        StaggerOpacity(
          opacity: animation.secondDotOpacity,
          controller: animationController,
          child: StaggerScale(
            controller: secondDotSizeControler,
            height: animation.secondDotHeight,
            width: animation.secondDotWidth,
            child: AnimatedDotWidget(
              isIndex: widget.currentIndex == 1,
              isCompleted: widget.currentIndex == 2,
            ),
          ),
        ),
        const SizedBox(width: 4),
        StaggerOpacity(
          opacity: animation.thirdDotOpacity,
          controller: animationController,
          child: StaggerScale(
            controller: thirdDotSizeControler,
            height: animation.thirdDotHeight,
            width: animation.thirdDotWidth,
            child: AnimatedDotWidget(
              isIndex: widget.currentIndex == 2,
              isCompleted: widget.currentIndex == 3,
            ),
          ),
        ),
      ],
    );
  }
}
