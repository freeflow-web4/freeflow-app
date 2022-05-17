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
import 'package:freeflow/layers/presentation/pages/create_wallet/views/private_key/confirm_key/create_wallet_private_key_confirm_animations.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/private_key/confirm_key/create_wallet_private_key_confirm_controller.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/widgets/create_wallet_page_indicator_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_text.dart';
import 'package:freeflow/layers/presentation/widgets/flexible_vertical_spacer.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field/gradient_text_field_widget.dart';

class CreateWalletPrivateKeyConfirmView extends StatefulWidget {
  final bool currentPage;
  final void Function() onValid;
  final PrivateKeyFormModel? correctPrivateKey;
  final bool animateOnStart;

  const CreateWalletPrivateKeyConfirmView({
    Key? key,
    required this.currentPage,
    required this.onValid,
    required this.correctPrivateKey,
    this.animateOnStart = true,
  }) : super(key: key);

  @override
  State<CreateWalletPrivateKeyConfirmView> createState() =>
      _CreateWalletPrivateKeyConfirmViewState();
}

class _CreateWalletPrivateKeyConfirmViewState
    extends State<CreateWalletPrivateKeyConfirmView>
    with TickerProviderStateMixin, TextThemes {
  static const _totalDuration = Duration(milliseconds: 3600);

  late final animationController =
      AnimationController(vsync: this, duration: _totalDuration);

  late final pageController = CreateWalletPrivateKeyConfirmController(
    widget.correctPrivateKey?.privateKey ?? '',
  );

  late final animations =
      CreateWalletPrivateKeyConfirmAnimations(animationController);
  late FocusNode privateKeyFieldFocusNode;

  @override
  void initState() {
    super.initState();
    privateKeyFieldFocusNode = FocusNode();
    if (widget.animateOnStart) {
      animationController.forward();
    } else {
      animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    privateKeyFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlackScaffold(
      child: SafeArea(
        top: false,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            return Padding(
              padding: const EdgeInsets.only(
                left: mdSpacingx2,
                right: mdSpacingx2,
              ),
              child: Column(
                children: [
                  const FlexibleVerticalSpacer(
                    height: huge4Spacing,
                  ),
                  AnimatedText(
                    text: TranslationService.translate(
                      context,
                      "createWallet.confirmPrivateKeyTitle1",
                    ),
                    animationController: animationController,
                    style: textH4TextStyle.copyWith(
                      color: StandardColors.white,
                    ),
                    animation: animations.title1Opacity,
                  ),
                  const FlexibleVerticalSpacer(
                    height: mdSpacingx2,
                  ),
                  AnimatedText(
                    text: TranslationService.translate(
                      context,
                      "createWallet.confirmPrivateKeyTitle2",
                    ),
                    animationController: animationController,
                    style: subtitleTextStyle(
                      color: StandardColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    animation: animations.title2Opacity,
                  ),
                  const FlexibleVerticalSpacer(
                    height: mdSpacingx2,
                  ),
                  Opacity(
                    opacity: animations.field1Opacity.value,
                    child: Observer(
                      builder: (context) {
                        return GradientTextFieldWidget(
                          errorText: pageController.gradientTextFieldState !=
                                  GradientTextFieldState.invalid
                              ? null
                              : TranslationService.translate(
                                  context,
                                  'createWallet.confirmPrivateTextFieldError',
                                ),
                          hintText: TranslationService.translate(
                            context,
                            'createWallet.confirmPrivateTextFieldHint',
                          ),
                          onChanged: pageController.onPrivateKeyChanged,
                          isFieldValid: pageController.isGradientTextFieldValid,
                          inputNode: privateKeyFieldFocusNode,
                        );
                      },
                    ),
                  ),
                  const FlexibleVerticalSpacer(
                    height: xxlargeSpacing,
                  ),
                  CreateWalletPageIndicator(
                    currentIndex: 3,
                    onAnimationEnd: () {
                      animationController
                          .forward()
                          .then((value) => requestFocus());
                    },
                    animatedOnStart: widget.animateOnStart,
                  ),
                  const FlexibleVerticalSpacer(height: 130),
                  Opacity(
                    opacity: animations.buttonOpacity.value,
                    child: Observer(
                      builder: (context) {
                        return AnimatedFloatButtonWidget(
                          isActive: pageController.buttonNextActivated,
                          onTap: (activate) {
                            pageController.onNextButtonPressed(
                              onValid,
                              onInvalid,
                            );
                          },
                          icon: IconsAsset.arrowIcon,
                          isLargeButton: pageController.buttonNextActivated,
                        );
                      },
                    ),
                  ),
                  const FlexibleVerticalSpacer(height: bigSpacing)
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void onValid() async {
    await animationController.animateTo(
      0,
      duration: Duration(milliseconds: _totalDuration.inMilliseconds ~/ 2),
    );
    widget.onValid();
    animationController.animateTo(
      1,
      duration: Duration.zero,
    );
  }

  void onInvalid() {
    showCustomDialog(context, textKey: 'createWallet.confirmPrivateKeyWarning');
  }

  void requestFocus() {
    if (!mounted || !widget.currentPage) {
      return;
    }
    privateKeyFieldFocusNode.requestFocus();
  }

  void removeFocus() {
    if (!mounted || !widget.currentPage) {
      return;
    }
    privateKeyFieldFocusNode.unfocus();
  }
}
