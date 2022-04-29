import 'package:flutter/material.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';

class FeatureNotAvailable extends StatelessWidget {
  const FeatureNotAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: normalSpacing,
        ),

        Text(
          TranslationService.translate(context, "featureNotAvailable.title",),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 38,
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

        Text(
          TranslationService.translate(context, "featureNotAvailable.text",),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontFamily: 'Akrobat',
          ),
        ),

        const SizedBox(
          height: mdSpacingx2,
        ),

      ],
    );
  }
}
