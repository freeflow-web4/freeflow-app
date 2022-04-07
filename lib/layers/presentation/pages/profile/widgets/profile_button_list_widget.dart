import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/profile_button_widget.dart';

class ProfileButtonListWidget extends StatelessWidget with TextThemes {
  const ProfileButtonListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: mdSpacingx2),
      child: Column(
        children: const [
          ProfileButtonWidget(
            title: "profile.showPhrase",
            icon: IconsAsset.privateKey,
          ),
          SizedBox(height: normalSpacing),
          ProfileButtonWidget(
            title: "profile.rememberMe",
            icon: IconsAsset.biometry,
          ),
          SizedBox(height: normalSpacing),
          ProfileButtonWidget(
            title: "profile.changePinCode",
            icon: IconsAsset.pincode,
          ),
          SizedBox(height: normalSpacing),
          ProfileButtonWidget(
            title: "profile.gesturesInstruction",
            icon: IconsAsset.gestures,
          ),
          SizedBox(height: normalSpacing),
          ProfileButtonWidget(
            title: "profile.commitment",
            icon: IconsAsset.commitment,
          ),
        ],
      ),
    );
  }
}
