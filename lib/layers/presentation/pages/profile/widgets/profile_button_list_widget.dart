import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/profile_button_widget.dart';

class ProfileButtonListWidget extends StatelessWidget with TextThemes {
  final void Function()? onTapCommitment;
  final void Function()? onShowPhraseTap;
  final void Function()? onTapGesturesInstructions;
  final void Function()? onTapRememberMe;
  final void Function()? onTapChangePincode;

  ProfileButtonListWidget({
    Key? key,
    required this.onTapCommitment,
    required this.onTapGesturesInstructions,
    required this.onShowPhraseTap,
    required this.onTapRememberMe,
    required this.onTapChangePincode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: mdSpacingx2),
      child: Column(
        children: [
          ProfileButtonWidget(
            title: "profile.showPhrase",
            icon: IconsAsset.privateKey,
            onTap: onShowPhraseTap,
          ),
          const SizedBox(height: normalSpacing),
          ProfileButtonWidget(
            title: "profile.rememberMe",
            icon: IconsAsset.biometry,
            onTap: onTapRememberMe,
          ),
          const SizedBox(height: normalSpacing),
          ProfileButtonWidget(
            title: "profile.changePinCode",
            icon: IconsAsset.pincode,
            onTap: onTapChangePincode,
          ),
          const SizedBox(height: normalSpacing),
          ProfileButtonWidget(
            title: "profile.gesturesInstruction",
            icon: IconsAsset.gestures,
            onTap: onTapGesturesInstructions,
          ),
          const SizedBox(height: normalSpacing),
          ProfileButtonWidget(
            title: "profile.commitment",
            icon: IconsAsset.commitment,
            onTap: onTapCommitment,
          ),
        ],
      ),
    );
  }
}
