import 'package:flutter/cupertino.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

mixin TextThemes {
  Text textH6(
    BuildContext context, {
    Color color = StandardColors.backgroundDark,
    int? maxLines,
    TextAlign? textAlign,
    bool isUpperCase = false,
    required String textKey,
  }) {
    return Text(
      isUpperCase
          ? FlutterI18n.translate(context, textKey).toUpperCase()
          : FlutterI18n.translate(context, textKey),
      maxLines: maxLines,
      textAlign: textAlign,
      style: textH6TextStyle.copyWith(color: color),
    );
  }

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
      style: textH4TextStyle.copyWith(color: color),
    );
  }

  TextStyle get textH4TextStyle => const TextStyle(
        fontSize: 38,
        fontWeight: FontWeight.w500,
        fontFamily: 'Akrobat',
      );

  TextStyle textH4TextStyleCustom(Color color) => TextStyle(
        fontSize: 38,
        fontWeight: FontWeight.w500,
        fontFamily: 'Akrobat',
        color: color,
      );

  TextStyle get textH6TextStyle => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        fontFamily: 'Akrobat',
      );

  TextStyle subtitleTextStyle({
    Color? color,
    FontWeight fontWeight = FontWeight.w500,
  }) =>
      TextStyle(
        fontSize: 20,
        fontFamily: 'Akrobat',
        fontWeight: fontWeight,
        color: color,
      );

  TextStyle get transcriptBold => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: 'Akrobat',
        color: StandardColors.black,
      );

  TextStyle get transcriptMedium => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Akrobat',
        color: StandardColors.black,
      );

  Text textH5(
    BuildContext context, {
    Color color = StandardColors.backgroundDark,
    int? maxLines,
    TextAlign textAlign = TextAlign.left,
    required String text,
  }) {
    return Text(
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

  Text textButton(
    BuildContext context, {
    Color color = StandardColors.backgroundDark,
    int? maxLines,
    required String textKey,
  }) {
    return Text(
      TranslationService.translate(context, textKey),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: textButtonStyle(color),
    );
  }

  TextStyle textButtonStyle(Color color) => TextStyle(
        color: color,
        fontSize: 18,
        fontFamily: 'Akrobat',
        fontWeight: FontWeight.bold,
      );

  Text textBody2(
    BuildContext context, {
    Color color = StandardColors.backgroundDark,
    int? maxLines,
    required String textKey,
  }) {
    return Text(
      TranslationService.translate(context, textKey),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: 12,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Text textSubtitle1(
    BuildContext context, {
    Color color = StandardColors.backgroundDark,
    int? maxLines,
    bool isUpperCase = false,
    required String textKey,
  }) {
    return Text(
      isUpperCase
          ? FlutterI18n.translate(context, textKey).toUpperCase()
          : FlutterI18n.translate(context, textKey),
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: 20,
        fontFamily: 'Akrobat',
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text textSubtitle2(
    BuildContext context, {
    Color color = StandardColors.backgroundDark,
    int? maxLines,
    bool isUpperCase = false,
    required String textKey,
  }) {
    return Text(
      isUpperCase
          ? FlutterI18n.translate(context, textKey).toUpperCase()
          : FlutterI18n.translate(context, textKey),
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: 14,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Text textBody4(
    BuildContext context, {
    Color color = StandardColors.backgroundDark,
    int? maxLines,
    required String textKey,
  }) {
    return Text(
      TranslationService.translate(context, textKey),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: 16,
        fontFamily: 'Akrobat',
        fontWeight: FontWeight.w600,
      ),
    );
  }

  TextStyle textSubtitle3Style({
    required Color color,
    double fontSize = 20,
  }) =>
      TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: 'Akrobat',
        fontWeight: FontWeight.bold,
      );

  Text textSubtitle3(
    BuildContext context, {
    Color color = StandardColors.backgroundDark,
    int? maxLines,
    required String textKey,
  }) {
    return Text(
      FlutterI18n.translate(context, textKey),
      maxLines: maxLines,
      style: textSubtitle3Style(color: color),
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

  Text textBold18(
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
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Akrobat',
      ),
    );
  }

  Text textBold20(
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

  Text textBold22(
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
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: 'Akrobat',
      ),
    );
  }

  Text textBold24(
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
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: 'Akrobat',
      ),
    );
  }

  Text textButton5(
    BuildContext context, {
    int? maxLines,
    required String text,
  }) {
    return Text(
      text,
      maxLines: maxLines,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Akrobat',
      ),
    );
  }

  Text textButton2(
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
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: 'Akrobat',
      ),
    );
  }
}
