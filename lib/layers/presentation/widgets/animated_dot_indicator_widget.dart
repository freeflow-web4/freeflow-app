import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freeflow/layers/presentation/widgets/animated_dot_widget.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/staggered_widgets.dart';
import 'package:freeflow/layers/presentation/widgets/widget_animations/dot_indicator_widget_animation.dart';

class AnimatedDotIndicatorWidget extends StatefulWidget {
  final int currentIndex;
  final int length;
  final Duration totalAnimationStartUpTime;

  const AnimatedDotIndicatorWidget({
    Key? key,
    required this.currentIndex,
    required this.length,
    required this.totalAnimationStartUpTime,
  }) : super(key: key);

  @override
  State<AnimatedDotIndicatorWidget> createState() =>
      _AnimatedDotIndicatorWidgetState();
}

class _AnimatedDotIndicatorWidgetState extends State<AnimatedDotIndicatorWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController dotSizeControler;
  late AnimationController firstDotSizeControler;
  late AnimationController thirdDotSizeControler;
  late AnimationController secondDotSizeControler;
  late DotIndicatorAnimation animation;
  bool showIndexAnimation = false;
  late final animationTimeBetweenDotsInStartUp = Duration(
    milliseconds:
        widget.totalAnimationStartUpTime.inMilliseconds ~/ widget.length,
  );

  late final animationTimeBetweenDotsInStartUpFactor =
      animationTimeBetweenDotsInStartUp.inMilliseconds ~/
          widget.totalAnimationStartUpTime.inMilliseconds;
  int thePreviusDot = 0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: widget.totalAnimationStartUpTime,
      vsync: this,
    );
    firstDotSizeControler = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    secondDotSizeControler = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    thirdDotSizeControler = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    animation = DotIndicatorAnimation(
      animationController,
      dotSizeControler,
      firstDotSizeControler,
      secondDotSizeControler,
      thirdDotSizeControler,
    );
    animationController.forward();
    Timer.periodic(const Duration(seconds: 4), (timer) {
      firstDotSizeControler.forward();
      timer.cancel();
    });
    Timer.periodic(const Duration(seconds: 5), (timer) {
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
      dotSizeControler.reset();
      dotSizeControler.forward().then((value) => dotSizeControler.reverse());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: dotSizeControler,
      builder: (context, _) {
        return AnimatedBuilder(
          animation: animationController,
          builder: (context, __) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: getDotList(),
            );
          },
        );
      },
    );
  }

  List<Widget> getDotList() {
    final dotList = <Widget>[];
    for (var i = 0; i < widget.length; i++) {
      final opacity = getOpacityValueFromAnimationStartUp(i);
      final size = getScaleValueFromAnimationStartUp(i);
      dotList.add(
        Opacity(
          opacity: opacity,
          child: Transform.scale(
            scale: size,
            child: AnimatedDotWidget(
              isIndex: widget.currentIndex == i,
              isCompleted: widget.currentIndex > i,
            ),
          ),
        ),
      );
    }
    return dotList;
  }

  double getOpacityValueFromAnimationStartUp(int index) {
    final minTimeFactor = index * animationTimeBetweenDotsInStartUpFactor;
    final maxTimeFactor =
        minTimeFactor + animationTimeBetweenDotsInStartUpFactor;
    if (animationController.value > maxTimeFactor) {
      return 1;
    } else if (animationController.value < minTimeFactor) {
      return 0;
    } else {
      return (animationController.value - minTimeFactor) /
          animationTimeBetweenDotsInStartUpFactor;
    }
  }

  double getScaleValueFromAnimationStartUp(int index) {
    if (index == widget.currentIndex) {
      return animation.dotSize.value;
    } else if (index == thePreviusDot) {
      return 1 - animation.dotSize.value;
    }
    return 0;
  }
}
