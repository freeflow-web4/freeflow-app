import 'package:flutter/cupertino.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

mixin TextThemes {
  Text textH4(
    BuildContext context, {
    Color color = StandardColors.backgroundDark,
    int? maxLines,
    TextAlign? textAlign,
    required String textKey,
  }) {
    return Text(
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

  Text textH3(
    BuildContext context, {
    Color color = StandardColors.backgroundDark,
    int? maxLines,
    TextAlign? textAlign,
    required String textKey,
  }) {
    return Text(
      FlutterI18n.translate(context, textKey),
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: 50,
        fontWeight: FontWeight.w500,
        fontFamily: 'Akrobat',
      ),
    );
  }

  Text textBoldSubtitle(
    BuildContext context, {
    Color color = StandardColors.backgroundDark,
    int? maxLines,
    required String textKey,
  }) {
    return Text(
      FlutterI18n.translate(context, textKey),
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Akrobat',
      ),
    );
  }

  Text textSubtitle(
    BuildContext context, {
    Color color = StandardColors.backgroundDark,
    int? maxLines,
    required String textKey,
  }) {
    return Text(
      FlutterI18n.translate(context, textKey),
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: 20,
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
