import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

class CustomDividerWidget extends StatelessWidget {
  final double horizontalPadding;
  const CustomDividerWidget({
    Key? key,
    required this.horizontalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: const Divider(
        height: 1.5,
        color: StandardColors.lightGrey2,
      ),
    );
  }
}
