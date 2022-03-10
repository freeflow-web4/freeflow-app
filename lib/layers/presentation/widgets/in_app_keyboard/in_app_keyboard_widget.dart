import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

class InAppKeyboardWidget extends StatefulWidget {
  final void Function(String)? onTap;
  const InAppKeyboardWidget({Key? key, this.onTap}) : super(key: key);

  @override
  State<InAppKeyboardWidget> createState() => _InAppKeyboardWidgetState();
}

class _InAppKeyboardWidgetState extends State<InAppKeyboardWidget>
    with TextThemes {
  static const List<dynamic> keys = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'X',
    '0',
    'del',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 225,
      height: 285,
      child: Wrap(
        runSpacing: 15,
        children: keys.map((key) {
          if (key == 'del') {
            return GestureDetector(
              onTap: () => widget.onTap?.call('del'),
              child: SizedBox(
                width: 75,
                height: 60,
                child: Center(
                  child: SvgPicture.asset(
                    IconsAsset.arrowLeftIcon,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            );
          } else {
            return GestureDetector(
              onTap: () => widget.onTap?.call(key),
              child: SizedBox(
                width: 75,
                height: 60,
                child: key == 'X'
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: textH4(
                          context,
                          textKey: key,
                          color: Colors.white,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : textH3(
                        context,
                        textKey: key,
                        color: Colors.white,
                        textAlign: TextAlign.center,
                      ),
              ),
            );
          }
        }).toList(),
      ),
    );
  }
}
