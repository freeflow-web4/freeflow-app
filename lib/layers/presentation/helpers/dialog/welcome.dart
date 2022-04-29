import 'package:flutter/material.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:intl/intl.dart';

class Welcome extends StatelessWidget {
  final double? flw;
  Welcome({Key? key, this.flw}) : super(key: key);
  final NumberFormat numberFormat = NumberFormat("#,##0.00", "pt_BR");


  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: normalSpacing,
        ),

        Text(
          TranslationService.translate(context, "welcomeDialog.title",),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w500,
            fontFamily: 'Akrobat',
          ),
        ),

        const SizedBox(
          height: xxlargeSpacing,
        ),

        Image.asset(
          IconsAsset.logoGrey,
          color: StandardColors.black,
          width: 152,
        ),

        const SizedBox(
          height: xxxlargeSpacing,
        ),

        RichText(
          maxLines: 3,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          text:  TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: TranslationService.translate(context, "welcomeDialog.text1",),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: StandardColors.black,
                  fontFamily: 'Akrobat',
                ),
              ),
              TextSpan(
                text: TranslationService.translate(context, "welcomeDialog.text2",).replaceFirst('00', numberFormat.format(flw ?? 0.0)),
                style:  const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: StandardColors.black,
                  fontFamily: 'Akrobat',
                ),
              ),
              TextSpan(
                text: TranslationService.translate(context, "welcomeDialog.text3",),
                style:  const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: StandardColors.black,
                  fontSize: 24,
                  fontFamily: 'Akrobat',
                ),
              ),
            ],
          ),
        ),

        const SizedBox(
          height: smSpacing,
        ),

      ],
    );
  }
}
