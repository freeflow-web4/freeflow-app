import 'package:flutter/material.dart';
import 'package:freeflow/core/translation/translation_service.dart';

class TranslationBuilder extends StatelessWidget {
  final String textKey;
  final Widget Function(String) builder;
  const TranslationBuilder({
    Key? key,
    required this.textKey,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return builder(TranslationService.translate(context, textKey));
  }
}
