import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AnimatedDotIndicatorWidget extends StatelessWidget {
  const AnimatedDotIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: 0,
      curve: Curves.easeInOut,
      count: 3,
      effect: const CustomizableEffect(
        dotDecoration: DotDecoration(
          width: 10.67,
          height: 10.67,
          color: StandardColors.disabled,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        activeDotDecoration: DotDecoration(
          width: 10.67,
          height: 10.67,
          color: StandardColors.blueLight,
          dotBorder: DotBorder(
            color: StandardColors.blueLight,
            padding: 2,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
    );
  }
}
