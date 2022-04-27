import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/helpers/dialog/show_dialog_default.dart';
import 'package:freeflow/layers/presentation/helpers/show_flex_bottom_sheet.dart';
import 'package:freeflow/layers/presentation/pages/profile/controllers/profile_page_controller.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/profile_button_widget.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/profile_image_widget.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/profile_names_widget.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/profile_shared_buttons_widget.dart';
import 'package:freeflow/layers/presentation/pages/profile/widgets/small_profile_buttons.dart';
import 'package:freeflow/layers/presentation/widgets/informative_dialog.dart';
import 'package:freeflow/layers/presentation/widgets/loading_widget.dart';
import 'package:freeflow/layers/presentation/widgets/scaffold_ff/scaffold_ff.dart';
import 'package:freeflow/layers/presentation/widgets/show_modal_bottom_sheet/remember_me/remember_me_widget.dart';
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
      onError: () => showDialogError(),
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
          if (controller.loadingIsNotCompleted) {
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
                    imageUrl: controller.user!.profileImageUrl,
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
                    },
                  ),
                  const SizedBox(height: mdSpacing),
                  const CustomDividerWidget(horizontalPadding: mdSpacingx2),
                  SmallProfileButtons(
                    screenHeight: screenHeight,
                    onLogoutTap: () => controller.showLogoutPage(context),
                    onTapCommitment: () => showCommitmentBottomSheet(),
                    onTapRememberMe: () => showRememberMeBottomSheet2(),
                  ),
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
                          onTap: () => controller.showLogoutPage(context),
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

  showCommitmentBottomSheet() {
    return showFlexBottomSheet(
      context,
      title: textH6(
        context,
        textKey: 'profile.commitment',
        textAlign: TextAlign.center,
      ),
      content: Center(
        child: textSubtitle(
          context,
          textKey: 'profile.commitmentContent',
        ),
      ),
    );
  }


  showRememberMeBottomSheet2() {
    return showFlexBottomSheet(
      context,
      title: textH6(
        context,
        textKey: 'rememberMe.touchId',
        textAlign: TextAlign.center,
      ),
      content: const RememberMeWidget(),
    );
  }

  showRememberMeBottomSheet() {
    return showFlexibleBottomSheet(
      context: context,
      minHeight: 0,
      initHeight: .9,
      maxHeight: 1,
      anchors: [0, 0.9, 1],
      builder: (BuildContext context, ScrollController scrollController, double bottomSheetOffset,) {
        return SafeArea(
          bottom: false,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: mdSpacing,
                vertical: bottomSheetOffset > 0.9 ? mdSpacingx2 : normalSpacing,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: ListView(
                  controller: scrollController,
                  children: [
                    Center(
                      child: Container(
                        width: 52,
                        height: 4,
                        decoration: BoxDecoration(
                          color: StandardColors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const RememberMeWidget(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

