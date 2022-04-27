import 'package:flutter/material.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

class ElevatedTextButton extends StatelessWidget with TextThemes {
  final void Function()? onPressed;
  final String? text;
  final String? textKey;
  final TextStyle? style;
  final Color? color;
  ElevatedTextButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.color,
    this.style,
  })  : textKey = null,
        super(key: key);

  ElevatedTextButton.withTextKey({
    Key? key,
    required this.textKey,
    this.onPressed,
    this.color,
    this.style,
  })  : text = null,
        super(key: key);

  static const _color = StandardColors.white;
  static const backgroundColor = StandardColors.success;
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
          ),
        ),
      ),
    );
  }
}
