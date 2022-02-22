import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/layers/presentation/widgets/animated_dot_widget.dart';

class AnimatedDotIndicatorWidget extends StatelessWidget {
  final bool isFirstDotVisible;
  final bool isSecondDotVisible;
  final bool isThirdDotVisible;
  final int currentIndex;
  final bool showIndexAnimation;

  const AnimatedDotIndicatorWidget({
    Key? key,
    required this.isFirstDotVisible,
    required this.isSecondDotVisible,
    required this.isThirdDotVisible,
    required this.currentIndex,
    required this.showIndexAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedDotWidget(
          isVisibile: isFirstDotVisible,
          isIndex: currentIndex == 0,
          showIndexAnimation:
              (currentIndex == 0 || currentIndex == 1) && showIndexAnimation,
        ),
        AnimatedDotWidget(
          isVisibile: isSecondDotVisible,
          isIndex: currentIndex == 1,
          showIndexAnimation: currentIndex == 1 && showIndexAnimation,
        ),
        AnimatedDotWidget(
          isVisibile: isThirdDotVisible,
          isIndex: currentIndex == 2,
          showIndexAnimation: currentIndex == 2 && showIndexAnimation,
        ),
      ],
    );
  }
}
