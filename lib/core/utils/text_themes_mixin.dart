import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

mixin TextThemes {
  AutoSizeText textH4(
    BuildContext context, {
    Color color = StandardColors.backgroundDark,
    int? maxLines,
    required String text,
  }) {
    return AutoSizeText(
      text,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: 38,
        fontWeight: FontWeight.w500,
        fontFamily: 'Akrobat',
      ),
    );
  }
}
