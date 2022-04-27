import 'package:flutter/material.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

class OutlineTextButton extends StatelessWidget with TextThemes {
  final void Function()? onPressed;
  final String? text;
  final String? textKey;
  final TextStyle? style;
  final Color? color;
  OutlineTextButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.color,
    this.style,
  })  : textKey = null,
        super(key: key);

  OutlineTextButton.withTextKey({
    Key? key,
    required this.textKey,
    this.onPressed,
    this.color,
    this.style,
  })  : text = null,
        super(key: key);

  static const _color = StandardColors.lightGrey;
  static const backgroundColor = Colors.white;
  static const borderRadius = 20.0;
  late final _textStyle = textButtonStyle(_color);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text ??
            TranslationService.translate(
              context,
              textKey ?? '',
            ),
        overflow: TextOverflow.ellipsis,
        style: style ?? _textStyle,
      ),
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: smSpacing,
            horizontal: mdSpacing,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
            side: BorderSide(
              color: color ?? _color,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
