import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/profile_button_widget.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/profile_image_widget.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/profile_names_widget.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/profile_shared_buttons_widget.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/small_profile_buttons.dart';
import 'package:freeflow/layers/presentation/widgets/scaffold_ff/scaffold_ff.dart';
import 'package:freeflow/layers/presentation/widgets/standard_divider_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TextThemes {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);
    print(screenHeight);
    return ScaffoldFreeFlow(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(IconsAsset.scaffoldBackground),
          fit: BoxFit.cover,
          opacity: 0.12,
        ),
      ),
      backgroundColor: StandardColors.lightBackground,
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: huge5Spacing),
              ProfileImageWidget(
                onTap: () {},
              ),
              const SizedBox(height: normalSpacing),
              const ProfileNamesWidget(
                fullname: 'Luiz Fernando Thomaz Ribeiro Coelho Junior ',
                username: 'luis_fernandoribeiro',
              ),
              const SizedBox(height: mdSpacing),
              ProfileSharedButtonsWidget(
                onTapShare: () => print('share'),
                onTapCopy: () => print('copy'),
              ),
              const SizedBox(height: mdSpacing),
              const CustomDividerWidget(horizontalPadding: mdSpacingx2),
              SmallProfileButtons(screenHeight: screenHeight),
            ],
          ),
          Positioned(
            bottom: mdSpacingx2,
            child: Visibility(
              visible: screenHeight >= 844,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: mdSpacingx2,
                    ),
                    child: ProfileButtonWidget(
                      title: "profile.logout",
                      icon: IconsAsset.logout,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
