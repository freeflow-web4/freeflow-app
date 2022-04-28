import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/auth/auth_controller.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/profile_button_widget.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/update_pincode_view.dart';
import 'package:get_it/get_it.dart';


class ProfileButtonListWidget extends StatelessWidget with TextThemes {
  final void Function()? onTapCommitment;
  AuthController authController = GetIt.I.get<AuthController>();
  final void Function()? onTapRememberMe;

  ProfileButtonListWidget({
    Key? key,
    required this.onTapCommitment,
    required this.onTapRememberMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: mdSpacingx2),
      child: Column(
        children: [
          const ProfileButtonWidget(
            title: "profile.showPhrase",
            icon: IconsAsset.privateKey,
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
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(normalSpacing),
                    topRight: Radius.circular(normalSpacing),
                  ),
                ),
                isScrollControlled: true,
                builder: (context) => UpdatePincodeView(),
              ).whenComplete(() {
                authController.resetPin();
                print('fechou. Reseta');
              });
            },
          ),
          const SizedBox(height: normalSpacing),
          const ProfileButtonWidget(
            title: "profile.gesturesInstruction",
            icon: IconsAsset.gestures,
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
