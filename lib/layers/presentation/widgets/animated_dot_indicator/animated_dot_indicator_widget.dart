import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freeflow/layers/presentation/widgets/animated_dot_widget.dart';

import '../widget_animations/tween_with_curve.dart';
part './starting_dot_indicator_widget_animation.dart';
part './swiping_dot_indicator_widget_animation.dart';

class AnimatedDotIndicatorWidget extends StatefulWidget {
  final int currentIndex;
  final int length;
  final Duration totalAnimationStartUpDuration;
  final void Function()? onAnimationEnd;

  /// The duration of the animation of the dot indicator.
  ///
  /// Default is 1.5 second
  final Duration? swipeAnimationDuration;

  /// Set it to false if the opacity and quicking animation is **not** desired
  final bool animatedOnStart;

  const AnimatedDotIndicatorWidget({
    Key? key,
    required this.currentIndex,
    required this.length,
    required this.totalAnimationStartUpDuration,
    this.swipeAnimationDuration,
    this.animatedOnStart = true,
    this.onAnimationEnd,
  }) : super(key: key);

  @override
  State<AnimatedDotIndicatorWidget> createState() =>
      _AnimatedDotIndicatorWidgetState();
}

class _AnimatedDotIndicatorWidgetState extends State<AnimatedDotIndicatorWidget>
    with TickerProviderStateMixin {
  late AnimationController startingAnimationController;
  late AnimationController swipingAnimationController;
  late _StartingDotIndicatorAnimation startingAnimation;
  late _SwipingDotIndicatorAnimation swipingAnimation;
  bool showIndexAnimation = false;
  late final animationTimeBetweenDotsInStartUp = Duration(
    milliseconds:
        widget.totalAnimationStartUpDuration.inMilliseconds ~/ widget.length,
  );

  late final animationTimeBetweenDotsInStartUpFactor =
      animationTimeBetweenDotsInStartUp.inMilliseconds /
          widget.totalAnimationStartUpDuration.inMilliseconds;
  bool isInitDone = false;

  @override
  void initState() {
    super.initState();
    startingAnimationController = AnimationController(
      duration: widget.totalAnimationStartUpDuration,
      vsync: this,
    );

    swipingAnimationController = AnimationController(
      duration:
          widget.swipeAnimationDuration ?? const Duration(milliseconds: 1500),
      vsync: this,
    );

    startingAnimation = _StartingDotIndicatorAnimation(
      startingAnimationController,
    );
    swipingAnimation = _SwipingDotIndicatorAnimation(
      swipingAnimationController,
    );
    if (widget.animatedOnStart) {
      startingAnimationController.forward().then((value) {
        setState(() {
          isInitDone = true;
        });
        swipeAnimation();
      });
    } else {
      startingAnimationController
          .animateTo(1, duration: Duration.zero)
          .then((value) => isInitDone = true);
    }
  }

  @override
  void dispose() {
    startingAnimationController.dispose();
    swipingAnimationController.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AnimatedDotIndicatorWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      swipeAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation:
          isInitDone ? swipingAnimationController : startingAnimationController,
      builder: (context, _) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: getDotList(),
        );
      },
    );
  }

  Future<void> swipeAnimation() {
    swipingAnimationController.reset();
    return swipingAnimationController
        .forward()
        .then((value) => widget.onAnimationEnd?.call());
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
      if (i < widget.length - 1) {
        dotList.add(
          const SizedBox(width: 4),
        );
      }
    }
    return dotList;
  }

  double getOpacityValueFromAnimationStartUp(int index) {
    final time = startingAnimationController.value;
    final minTimeFactor = index * animationTimeBetweenDotsInStartUpFactor;
    final maxTimeFactor =
        minTimeFactor + animationTimeBetweenDotsInStartUpFactor;
    if (time > maxTimeFactor) {
      return 1;
    } else if (time < minTimeFactor) {
      return 0;
    } else {
      final opacity =
          (time - minTimeFactor) / animationTimeBetweenDotsInStartUpFactor;
      if (opacity > 1) return 1;
      if (opacity < 0) return 0;
      return opacity;
    }
  }

  double getScaleValueFromAnimationStartUp(
    int index,
  ) {
    if (!isInitDone) return getOpacityValueFromAnimationStartUp(index);
    if (index == widget.currentIndex) {
      final scale = swipingAnimation.currentDotSize.value;
      return scale;
    }
    return 1;
  }
}
