import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

mixin TextThemes {
  AutoSizeText textH4(
    BuildContext context, {
    Color color = StandardColors.backgroundDark,
    int? maxLines,
    TextAlign? textAlign,
    required String textKey,
  }) {
    return AutoSizeText(
      FlutterI18n.translate(context, textKey),
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: 38,
        fontWeight: FontWeight.w500,
        fontFamily: 'Akrobat',
      ),
    );
  }

  Text textBoldSubtitle(
    BuildContext context, {
    Color color = StandardColors.backgroundDark,
    int? maxLines,
    required String text,
  }) {
    return Text(
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

  Text textCaption(
    BuildContext context, {
    Color color = StandardColors.backgroundDark,
    int? maxLines,
    required String text,
  }) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w800,
        fontFamily: 'Akrobat',
      ),
    );
  }
}
