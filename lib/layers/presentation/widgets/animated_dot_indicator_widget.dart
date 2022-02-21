import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/layers/presentation/widgets/animated_dot_widget.dart';

class AnimatedDotIndicatorWidget extends StatelessWidget {
  final bool isFirstDotVisible;
  final bool isSecondDotVisible;
  final bool isThirdDotVisible;
  final int currentIndex;

  const AnimatedDotIndicatorWidget({
    Key? key,
    required this.isFirstDotVisible,
    required this.isSecondDotVisible,
    required this.isThirdDotVisible,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedDotWidget(
          isVisibile: isFirstDotVisible,
          isIndex: true,
        ),
        const SizedBox(width: smSpacing),
        AnimatedDotWidget(
          isVisibile: isSecondDotVisible,
          isIndex: false,
        ),
        const SizedBox(width: smSpacing),
        AnimatedDotWidget(
          isVisibile: isThirdDotVisible,
          isIndex: false,
        ),
      ],
    );
  }
}
