import 'package:flutter/material.dart';

class FlexibleVerticalSpacer extends StatelessWidget {
  /// The height distance in the figma prototype, for example
  final num height;
  const FlexibleVerticalSpacer({
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Spacer(
      flex: height.toInt(),
    );
  }
}
