import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

import '../../../../../core/translation/translation_service.dart';

class EmptyContent extends StatelessWidget with TextThemes {
  const EmptyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: mdSpacingx2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: mdSpacing, top: mdSpacing),
            child: textH6(
              context,
              textKey: TranslationService.translate(
                context,
                'wallet.noActivity',
              ).toUpperCase(),
              color: StandardColors.borderMediumGrey,
            ),
          ),
          Image.asset(IconsAsset.logoGrey),
          Padding(
            padding: const EdgeInsets.only(top: mdSpacing),
            child: textH6(
              context,
              textKey: TranslationService.translate(
                context,
                'wallet.soonYouWillReceiveNotifications',
              ).toUpperCase(),
              color: StandardColors.borderMediumGrey,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
