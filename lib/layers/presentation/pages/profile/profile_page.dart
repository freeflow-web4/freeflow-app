import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/helpers/dialog/show_dialog_default.dart';
import 'package:freeflow/layers/presentation/pages/profile/controllers/profile_page_controller.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/profile_button_widget.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/profile_image_widget.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/profile_names_widget.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/profile_shared_buttons_widget.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/small_profile_buttons.dart';
import 'package:freeflow/layers/presentation/widgets/informative_dialog.dart';
import 'package:freeflow/layers/presentation/widgets/loading_widget.dart';
import 'package:freeflow/layers/presentation/widgets/scaffold_ff/scaffold_ff.dart';
import 'package:freeflow/layers/presentation/widgets/standard_divider_widget.dart';
import 'package:freeflow/routes/routes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TextThemes {
  final ProfilePageController controller = findProfileController();

  @override
  void initState() {
    super.initState();
    controller.getUser(
      onError : ()=> showDialogError(),
    );
  }

    void showDialogError() {
    showDialogDefault(
      context,
      type: DialogType.systemInstability,
      onTap: () {
        Navigator.of(context).pop();
        Routes.instance.pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return ScaffoldFreeFlow(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(IconsAsset.scaffoldBackground),
          fit: BoxFit.cover,
          opacity: 0.12,
        ),
      ),
      backgroundColor: StandardColors.lightBackground,
      body: Observer(
        builder: (context) {
          if (controller.pageState == PageState.loading ||
              controller.user == null) {
            return const Center(
              child: LoadingWidget(
                isLoading: true,
                color: StandardColors.greyCA,
                size: 33,
              ),
            );
          }
          return Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: huge5Spacing),
                  ProfileImageWidget(
                    onTap: () => controller.goToEditProfile(),
                  ),
                  const SizedBox(height: normalSpacing),
                  ProfileNamesWidget(
                    fullname: controller.user!.displayName,
                    username: controller.user!.username,
                  ),
                  const SizedBox(height: mdSpacing),
                  ProfileSharedButtonsWidget(
                      onTapShare: () => controller.shareAddress(),
                      onTapCopy: () {
                        controller.setContentToClipBoard();
                        showDialog(
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (context) => const InformativeDialog(
                            icon: IconsAsset.checkIcon,
                            title: "profile.copiedAddress",
                          ),
                        );
                      },),
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
          );
        },
      ),
    );
  }
}
