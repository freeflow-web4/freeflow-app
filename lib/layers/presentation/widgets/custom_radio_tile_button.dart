import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

class CustomRadioTile<T> extends StatelessWidget with TextThemes {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final double width;
  final double height;
  final String label;

  const CustomRadioTile({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
    this.width = 16,
    this.height = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onChanged(value);
      },
      child: Row(
        children: [
          customRadioButton(context),
          textButton2(
            context,
            text: label,
            color: value == groupValue
                ? StandardColors.textMediumGrey
                : StandardColors.textMediumGrey.withOpacity(0.6),
          )
        ],
      ),
    );
  }

  Widget customRadioButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(normalSpacing),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: height,
            width: width,
            decoration: ShapeDecoration(
              shape: const CircleBorder(),
              gradient: value == groupValue
                  ? StandardColors.purpleBlueGradient()
                  : RadialGradient(
                      colors: [
                        StandardColors.textMediumGrey.withOpacity(0.6),
                        StandardColors.textMediumGrey.withOpacity(0.6),
                      ],
                    ),
            ),
          ),
          Container(
            height: height - 3,
            width: width - 3,
            decoration: ShapeDecoration(
              shape: const CircleBorder(),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
          Container(
            height: height - 10,
            width: height - 10,
            padding: const EdgeInsets.all(miniSpacing),
            decoration: ShapeDecoration(
              shape: const CircleBorder(),
              gradient: value == groupValue
                  ? StandardColors.purpleBlueGradient()
                  : RadialGradient(
                      colors: [
                        Theme.of(context).scaffoldBackgroundColor,
                        Theme.of(context).scaffoldBackgroundColor,
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
