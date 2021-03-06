import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/helpers/show_fullscreen_dialog.dart';
import 'package:freeflow/layers/presentation/pages/auth/widgets/black_page_widget.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/private_key_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/private_key/show_key/create_wallet_private_key_show_state_controller.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/private_key/show_key/create_wallet_private_key_show_state_animations.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/widgets/create_wallet_page_indicator_widget.dart';
import 'package:freeflow/layers/presentation/pages/fullscreen_alert_dialog/fullscreen_alert_dialog.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_text.dart';
import 'package:freeflow/layers/presentation/widgets/flexible_vertical_spacer.dart';

class CreateWalletPrivateKeyShowView extends StatefulWidget {
  final void Function(PrivateKeyFormModel) onValid;
  final bool animateOnStart;
  final String privateKey;

  const CreateWalletPrivateKeyShowView({
    Key? key,
    required this.onValid,
    required this.animateOnStart,
    required this.privateKey,
  }) : super(key: key);

  @override
  State<CreateWalletPrivateKeyShowView> createState() =>
      _CreateWalletPrivateKeyShowViewState();
}

class _CreateWalletPrivateKeyShowViewState
    extends State<CreateWalletPrivateKeyShowView>
    with TickerProviderStateMixin, TextThemes {
  static const _totalDuration = Duration(milliseconds: 3600);

  late final animationController =
      AnimationController(vsync: this, duration: _totalDuration);

  final pageController = CreateWalletPrivateKeyShowStateController();

  late final animations =
      CreateWalletPrivateKeyShowStateAnimations(animationController);

  @override
  void initState() {
    super.initState();
    if (widget.animateOnStart) {
      animationController.forward();
    } else {
      animationController.value = 1.0;
    }
    Future.delayed(const Duration(milliseconds: 1000)).then(
      (value) => pageController.setButtonEnabled(),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlackScaffold(
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          return Padding(
            padding: const EdgeInsets.only(
              left: mdSpacingx2,
              right: mdSpacingx2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FlexibleVerticalSpacer(height: huge4Spacing),
                Padding(
                  padding: const EdgeInsets.only(right: 2 * mdSpacingx2),
                  child: AnimatedText(
                    text: TranslationService.translate(
                      context,
                      "createWallet.privateKeyTitle1",
                    ),
                    animationController: animationController,
                    style: textH4TextStyle.copyWith(
                      color: StandardColors.white,
                    ),
                    animation: animations.title1Opacity,
                  ),
                ),
                const FlexibleVerticalSpacer(height: mdSpacingx2),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                    bottom: mdSpacingx2,
                    right: 2 * mdSpacingx2,
                  ),
                  child: Opacity(
                    opacity: animations.title2Opacity.value,
                    child: RichText(
                      text: TextSpan(
                        style: subtitleTextStyle(),
                        children: [
                          TextSpan(
                            text: TranslationService.translate(
                              context,
                              'createWallet.privateKeyTitle2',
                            ),
                            style: subtitleTextStyle(
                              color: StandardColors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: TranslationService.translate(
                              context,
                              'createWallet.privateKeyTitle3',
                            ),
                            style: subtitleTextStyle(
                              color: StandardColors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                    bottom: mdSpacingx2,
                    right: 2 * mdSpacingx2,
                  ),
                  child: Opacity(
                    opacity: animations.title3Opacity.value,
                    child: Text(
                      widget.privateKey,
                      style: subtitleTextStyle(
                        color: StandardColors.secondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const FlexibleVerticalSpacer(height: mdSpacingx2),
                CreateWalletPageIndicator(
                  currentIndex: 3,
                  onAnimationEnd: () {
                    animationController.forward();
                  },
                  animatedOnStart: widget.animateOnStart,
                ),
                const FlexibleVerticalSpacer(height: xxlargeSpacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: animations.buttonOpacity.value,
                      child: Observer(
                        builder: (context) {
                          return AnimatedFloatButtonWidget(
                            isActive: pageController.buttonNextActivated,
                            onTap: (activate) {
                              if (activate) {
                                onValid();
                              }
                            },
                            icon: IconsAsset.arrowIcon,
                            isLargeButton: pageController.buttonNextActivated,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const FlexibleVerticalSpacer(height: bigSpacing),
              ],
            ),
          );
        },
      ),
    );
  }

  void onValid() async {
    try {
      await animationController
          .animateTo(
            0,
            duration:
                Duration(milliseconds: _totalDuration.inMilliseconds ~/ 2),
          )
          .orCancel;
    } catch (_) {}
    await showCustomDialog(
      context,
      body: Text(
        widget.privateKey,
        style: textH4TextStyle.copyWith(
          color: StandardColors.secondary,
        ),
      ),
      secondaryTextKey: 'createWallet.privateKeyWarning',
      secondaryTextPosition: SecondaryTextPosition.top,
    );
    widget.onValid(
      PrivateKeyFormModel(
        privateKey: widget.privateKey,
      ),
    );
    animationController.animateTo(
      1,
      duration: Duration.zero,
    );
  }
}
