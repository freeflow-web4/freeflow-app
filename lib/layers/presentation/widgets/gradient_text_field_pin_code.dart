import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

class GradientTextFieldPinCode extends StatelessWidget {
  final String pinCode;
  final Color? color;

  const GradientTextFieldPinCode({Key? key, required this.pinCode, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> subString = pinCode.split("");
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CircleAvatar(
            radius: subString.isNotEmpty ? 5 : 3,
            backgroundColor: color ??
                (subString.isNotEmpty
                    ? StandardColors.blueLight
                    : StandardColors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CircleAvatar(
            radius: subString.length >= 2 ? 4 : 2,
            backgroundColor: color ??
                (subString.length >= 2
                    ? StandardColors.blueLight
                    : StandardColors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CircleAvatar(
            radius: subString.length >= 3 ? 4 : 2,
            backgroundColor: color ??
                (subString.length >= 3
                    ? StandardColors.blueLight
                    : StandardColors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CircleAvatar(
            radius: subString.length >= 4 ? 4 : 2,
            backgroundColor: color ??
                (subString.length >= 4
                    ? StandardColors.blueLight
                    : StandardColors.grey),
          ),
        ),
      ],
    );
  }
}
