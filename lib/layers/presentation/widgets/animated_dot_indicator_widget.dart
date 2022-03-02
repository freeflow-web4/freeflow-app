import 'package:flutter/material.dart';
import 'package:freeflow/layers/presentation/widgets/animated_dot_widget.dart';

class AnimatedDotIndicatorWidget extends StatelessWidget {
  final bool isFirstDotVisible;
  final bool isSecondDotVisible;
  final bool isThirdDotVisible;
  final int currentIndex;
  final bool showIndexAnimation;
  final void Function() onTapFirstDot;
  final void Function() onTapSecondDot;
  final void Function() onTapThirdDot;

  const AnimatedDotIndicatorWidget({
    Key? key,
    required this.isFirstDotVisible,
    required this.isSecondDotVisible,
    required this.isThirdDotVisible,
    required this.currentIndex,
    required this.showIndexAnimation,
    required this.onTapFirstDot,
    required this.onTapSecondDot,
    required this.onTapThirdDot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedDotWidget(
          isVisibile: isFirstDotVisible,
          isIndex: currentIndex == 0,
          showIndexAnimation: currentIndex == 0 && showIndexAnimation,
          onTap: onTapFirstDot,
        ),
        AnimatedDotWidget(
          isVisibile: isSecondDotVisible,
          isIndex: currentIndex == 1,
          showIndexAnimation: currentIndex == 1 && showIndexAnimation,
          onTap: onTapSecondDot,
        ),
        AnimatedDotWidget(
          isVisibile: isThirdDotVisible,
          isIndex: currentIndex == 2,
          showIndexAnimation: currentIndex == 2 && showIndexAnimation,
          onTap: onTapThirdDot,
        ),
      ],
    );
  }
}
