import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/profile_button_widget.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/update_pincode_view.dart';

import '../../../../../core/utils/colors_constants.dart';

class ProfileButtonListWidget extends StatelessWidget with TextThemes {
  final void Function()? onTapCommitment;

  const ProfileButtonListWidget({
    Key? key,
    required this.onTapCommitment,
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
          const ProfileButtonWidget(
            title: "profile.rememberMe",
            icon: IconsAsset.biometry,
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
              );
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
