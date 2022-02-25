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

  AutoSizeText textH5(
    BuildContext context, {
    Color color = StandardColors.backgroundDark,
    int? maxLines,
    TextAlign textAlign = TextAlign.left,
    required String text,
  }) {
    return AutoSizeText(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: 35,
        fontWeight: FontWeight.w400,
        fontFamily: 'Akrobat',
      ),
    );
  }

  AutoSizeText textBoldSubtitle(
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
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Akrobat',
      ),
    );
  }

  AutoSizeText textBold18(
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
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Akrobat',
      ),
    );
  }
}
