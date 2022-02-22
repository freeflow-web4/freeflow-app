import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

class AnimatedDotWidget extends StatelessWidget {
  final bool isVisibile;
  final bool isIndex;
  final bool showIndexAnimation;

  const AnimatedDotWidget({
    Key? key,
    required this.isVisibile,
    required this.isIndex,
    required this.showIndexAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isVisibile ? 1.0 : 0.0,
      duration: const Duration(seconds: 2),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedOpacity(
            opacity: showIndexAnimation ? 1.0 : 0.0,
            duration: const Duration(seconds: 1),
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      isIndex ? StandardColors.blueLight : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(2),
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                  color: isIndex
                      ? StandardColors.blueLight
                      : StandardColors.disabled,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: showIndexAnimation ? 0 : 1.0,
            duration: const Duration(seconds: 1),
            child: Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      isIndex ? StandardColors.blueLight : Colors.transparent,
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
                      : StandardColors.disabled,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
