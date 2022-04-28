import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/profile_button_list_widget.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/profile_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/standard_divider_widget.dart';

class SmallProfileButtons extends StatelessWidget {
  final double screenHeight;
  final void Function()? onTapCommitment;
  final void Function() onLogoutTap;
  final void Function() onShowPhraseTap;
  final void Function()? onTapRememberMe;

  const SmallProfileButtons({
    Key? key,
    required this.screenHeight,
    required this.onTapCommitment,
    required this.onLogoutTap,
    required this.onShowPhraseTap,
    required this.onTapRememberMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics:
            screenHeight >= 844 ? const NeverScrollableScrollPhysics() : null,
        child: Column(
          children: [
            const SizedBox(height: mdSpacingx2),
            ProfileButtonListWidget(
              onTapCommitment: onTapCommitment,
              onShowPhraseTap: onShowPhraseTap,
              onTapRememberMe: onTapRememberMe,
            ),
            const SizedBox(height: mdSpacingx2),
            const CustomDividerWidget(horizontalPadding: mdSpacingx2),
            const SizedBox(height: mdSpacingx2),
            Visibility(
              visible: screenHeight < 844,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: mdSpacingx2,
                    ),
                    child: ProfileButtonWidget(
                      title: "profile.logout",
                      icon: IconsAsset.logout,
                      onTap: onLogoutTap,
                    ),
                  ),
                  const SizedBox(height: mdSpacingx2),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
