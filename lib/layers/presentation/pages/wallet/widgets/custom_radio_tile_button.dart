import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

class CustomRadioTile<T> extends StatelessWidget with TextThemes {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final double width;
  final double height;
  final String label;

  const CustomRadioTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
    this.width = 16,
    this.height = 16,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onChanged(value);
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: height,
                  width: width,
                  decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    gradient: LinearGradient(
                      colors: value == groupValue
                          ? const [
                              Color(0xFFDE83E0),
                              Color(0xFF32B4FF),
                            ]
                          : const [
                              Color(0xff797D83),
                              Color(0xff797D83),
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
                  padding: const EdgeInsets.all(4),
                  decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    gradient: RadialGradient(
                      colors: value == groupValue
                          ? const [
                              Color(0xFF32B4FF),
                              Color(0xFFDE83E0),
                            ]
                          : [
                              Theme.of(context).scaffoldBackgroundColor,
                              Theme.of(context).scaffoldBackgroundColor,
                            ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          button2(context, text: label)
        ],
      ),
    );
  }
}
