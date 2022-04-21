import 'package:flutter/material.dart';

class FlexibleVerticalSpacer extends StatelessWidget {
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
