import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

class CircularGradientIconButton extends StatelessWidget {
  final Widget child;
  final double? size;
  final Function onTap;
  final bool isSelected;
  final EdgeInsets? margin;
  const CircularGradientIconButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.size,
    this.isSelected = false,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: () => onTap(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: getRecalculatedSize,
              width: getRecalculatedSize,
              decoration: isSelected
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: StandardColors.purpleBlueGradient(),
                    )
                  : const BoxDecoration(
                      color: StandardColors.borderMediumGrey,
                      shape: BoxShape.circle,
                    ),
            ),
            Container(
              height: size,
              width: size,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: child,
            )
          ],
        ),
      ),
    );
  }

  double get getRecalculatedSize => (size ?? 22) + (size ?? 22) * 0.25;
}
