import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/adaptative_size.dart';

/// Use this widget when you need **relative adaptative size**
///
/// Relative adaptative size = size is **proportional** to screen size compare to **Iphone 12**
class AdaptativeSize extends StatelessWidget {
  ///the height value in **Figma**
  final double? heightValue;

  ///the width value in **Figma**
  final double? widthValue;

  ///the factor, being 1 equals to 100% of screen height size
  final double? heightFactor;

  ///the factor, being 1 equals to 100% of screen width size
  final double? widthFactor;
  final Widget child;
  const AdaptativeSize({
    Key? key,
    this.heightFactor,
    this.widthFactor,
    this.heightValue,
    this.widthValue,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightFromValue = heightValue != null
        ? getProportionalHeightFromValue(context, heightValue!)
        : null;
    final heightFromFactor = heightFactor != null
        ? getProporcionalHeightFromFactor(context, heightFactor!)
        : null;
    final widthFromValue =
        widthValue != null ? getProportionalWidth(context, widthValue!) : null;
    final widthFromFactor =
        widthFactor != null ? getWidthFromFactor(context, widthFactor!) : null;
    final height = heightFromValue ?? heightFromFactor ?? 0;
    final width = widthFromValue ?? widthFromFactor ?? 0;
    return SizedBox(
      height: height,
      width: width,
      child: child,
    );
  }
}
