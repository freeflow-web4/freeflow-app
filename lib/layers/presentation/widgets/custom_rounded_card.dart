import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';

class CustomRoundedCard extends StatelessWidget {
  final double? width, height;
  final Color? backgroundColor, borderColor;
  final Widget? child;
  final EdgeInsets? padding, margin;
  final BorderRadius? borderRadius;

  const CustomRoundedCard({
    Key? key,
    this.width,
    this.height,
    this.child,
    this.backgroundColor,
    this.borderColor,
    this.margin,
    this.padding,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? EdgeInsets.zero,
      margin: margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: backgroundColor ?? StandardColors.offWhite,
        borderRadius: borderRadius ?? BorderRadius.circular(normalSpacing),
        border: Border.all(
          width: 1.5,
          color: borderColor ?? StandardColors.borderGrey,
        ),
        boxShadow: const [
          BoxShadow(
            color: StandardColors.borderGrey,
            offset: Offset(0, 2),
            blurRadius: 8,
          )
        ],
      ),
      child: child,
    );
  }
}
