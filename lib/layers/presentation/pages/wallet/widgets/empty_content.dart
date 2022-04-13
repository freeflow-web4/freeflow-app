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
          textWidget(
            context,
            textKey: 'wallet.noActivity',
            padding: const EdgeInsets.only(bottom: mdSpacing, top: mdSpacing),
          ),
          Image.asset(IconsAsset.logoGrey),
          textWidget(
            context,
            textKey: 'wallet.soonYouWillReceiveNotifications',
            padding: const EdgeInsets.only(top: mdSpacing),
          )
        ],
      ),
    );
  }

  Widget textWidget(
    BuildContext context, {
    required String textKey,
    EdgeInsets? padding,
  }) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: textH6(
        context,
        textKey: textKey,
        isUpperCase: true,
        color: StandardColors.borderMediumGrey,
        textAlign: TextAlign.center,
      ),
    );
  }
}
