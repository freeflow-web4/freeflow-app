import 'package:flutter/material.dart';

bool getIfTextCrossMaxLines(
  BuildContext context, {
  required String text,
  required int maxLines,
  required double maxWidth,
}) {
  final span = TextSpan(text: text);

  final TextPainter textPainter = TextPainter(
    text: span,
    maxLines: maxLines,
    textDirection: TextDirection.ltr,
  );

  textPainter.layout(
    maxWidth: maxWidth,
  );

  return textPainter.didExceedMaxLines;
}
