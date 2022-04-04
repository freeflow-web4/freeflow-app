import 'package:flutter/material.dart';

class CustomRoundedCard extends StatelessWidget {
  final double? width, height;
  final Color? backgroundColor, borderColor;
  final Widget? child;
  final EdgeInsets? padding, margin;
  final double? borderRadius;

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
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        border: Border.all(
          width: 1.5,
          color: borderColor ?? const Color(0xffE0E2E2),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0xffE0E2E2),
            offset: Offset(0, 2),
            blurRadius: 8,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          borderRadius != null ? (borderRadius ?? 0) - 2 : 16,
        ),
        child: child,
      ),
    );
  }
}
