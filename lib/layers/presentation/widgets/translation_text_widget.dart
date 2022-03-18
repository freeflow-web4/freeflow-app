import 'package:flutter/material.dart';
import 'package:freeflow/core/translation/translation_service.dart';

class TranslationText extends StatelessWidget {
  final String textKey;
  final TextStyle? style;
  const TranslationText({
    Key? key,
    required this.textKey,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      TranslationService.translate(context, textKey),
      style: style,
    );
  }
}
