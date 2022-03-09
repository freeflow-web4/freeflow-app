import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

class AnimatedDotWidget extends StatelessWidget {
  final bool isIndex;
  final bool isCompleted;

  const AnimatedDotWidget({
    Key? key,
    required this.isIndex,
    required this.isCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isIndex ? StandardColors.blueLight : Colors.transparent,
          width: 2,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(2),
        height: 10.6,
        width: 10.6,
        decoration: BoxDecoration(
          color: isIndex
              ? StandardColors.blueLight
              : isCompleted
                  ? StandardColors.blueLight
                  : StandardColors.disabled,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
