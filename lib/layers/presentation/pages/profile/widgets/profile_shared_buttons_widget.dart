import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

class ProfileSharedButtonsWidget extends StatelessWidget with TextThemes {
  final void Function()? onTapShare;
  final void Function()? onTapCopy;

  const ProfileSharedButtonsWidget({
    Key? key,
    this.onTapShare,
    this.onTapCopy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: xxlargeSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onTapCopy,
            child: Row(
              children: [
                SvgPicture.asset(IconsAsset.copyText),
                const SizedBox(width: smSpacing),
                textBody2(
                  context,
                  textKey: "profile.copyAddress",
                  color: StandardColors.lightGrey,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: onTapShare,
            child: Row(
              children: [
                // SvgPicture.asset(IconsAsset.copyText),
                const Icon(
                  Icons.ios_share,
                  color: StandardColors.lightGrey,
                  size: 20,
                ),
                const SizedBox(width: smSpacing),
                textBody2(
                  context,
                  textKey: "profile.shareAddress",
                  color: StandardColors.lightGrey,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
