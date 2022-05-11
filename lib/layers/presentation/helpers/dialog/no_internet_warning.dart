import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';

class NoInternetWarning extends StatelessWidget {
  const NoInternetWarning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: normalSpacing,
        ),

        Text(
          TranslationService.translate(context, "noInternet.noInternetTitle",),
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.w500,
            fontFamily: 'Akrobat',
          ),
        ),

        const SizedBox(
          height: xxlargeSpacing,
        ),

        SvgPicture.asset(
          IconsAsset.noConnectionFoundWithoutBorder,
          width: 152,
        ),

        const SizedBox(
          height: xxxlargeSpacing,
        ),

        Text(
          TranslationService.translate(context, "noInternet.noInternetSubtitle",),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontFamily: 'Akrobat',
          ),
        ),

      ],
    );
  }
}
