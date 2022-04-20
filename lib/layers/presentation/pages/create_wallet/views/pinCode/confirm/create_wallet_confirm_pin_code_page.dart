import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/adaptative_size.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/helpers/show_fullscreen_dialog.dart';
import 'package:freeflow/layers/presentation/pages/auth/widgets/black_page_widget.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/pin_code_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/pinCode/choose/create_wallet_pin_code_controller.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/pinCode/confirm/create_wallet_confirm_pin_code_controller.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_text.dart';
import 'package:freeflow/layers/presentation/widgets/custom_switch_widget.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/in_app_keyboard/in_app_keyboard_widget.dart';
import 'package:get_it/get_it.dart';
part 'create_wallet_confirm_pin_code_animations.dart';

class CreateWalletConfirmPinCodeView extends StatefulWidget {
  final bool animatedOnStart;
  final void Function() onValid;

  const CreateWalletConfirmPinCodeView({
    Key? key,
    required this.animatedOnStart,
    required this.onValid,
  }) : super(key: key);

  @override
  State<CreateWalletConfirmPinCodeView> createState() =>
      _CreateWalletConfirmPinCodeViewState();
}

class _CreateWalletConfirmPinCodeViewState extends State<CreateWalletConfirmPinCodeView>
    with TickerProviderStateMixin, TextThemes {
  static const _totalDuration = Duration(milliseconds: 3600);

  late final animationController =
      AnimationController(vsync: this, duration: _totalDuration);

  late final animations =
      CreateWalletConfirmPinCodePageAnimations(animationController);

  final pageController = GetIt.I.get<CreateWalletConfirmPinCodeController>();

  @override
  void didUpdateWidget(covariant CreateWalletConfirmPinCodeView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.animatedOnStart != widget.animatedOnStart) {
      if (widget.animatedOnStart) {
        animationController.forward();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlackScaffold(
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: mdSpacingx2,
                  right: mdSpacingx2,
                  top: huge4Spacing,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedText(
                      text: TranslationService.translate(
                        context,
                        "createWallet.pinCodeTitle1",
                      ),
                      animationController: animationController,
                      style:
                          textH4TextStyle.copyWith(color: StandardColors.white),
                      animation: animations.title1Opacity,
                    ),
                    const SizedBox(
                      height: mdSpacingx2,
                    ),
                    Opacity(
                      //TODO: add opacity from class
                      opacity: animationController.value,
                      child: Observer(
                        builder: (context) {
                          return GradientTextFieldWidget(
                            showObscureButton: true,
                            fieldReadOnly: true,
                            hintText: TranslationService.translate(
                              context,
                              'createWallet.pinCodeTextFieldHint',
                            ),
                            onChanged: pageController.onPinChanged,
                            isFieldValid:
                                pageController.isGradientTextFieldValid,
                            isPinInput: true,
                            value: pageController.currentPinCode,
                            isObscureText: pageController.isPinObscure,
                            onObscureButtonPressed:
                                pageController.onPinObscureTextFieldTap,
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          TranslationService.translate(
                            context,
                            'createWallet.pinCodeTitle2',
                          ),
                          style: subtitleTextStyle.copyWith(
                            color: StandardColors.white,
                          ),
                        ),
                        const SizedBox(
                          width: mdSpacingx2,
                        ),
                        Observer(
                          builder: (context) {
                            return CustomSwitch(
                              value: pageController.rememberMe,
                              onChanged: pageController.onRememberMeChanged,
                            );
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: mdSpacingx2,
                    ),
                    Opacity(
                      opacity: animationController.value,
                      child: InAppKeyboardWidget(
                        onTap: pageController.onKeyboardTap,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(
                    top: getProportionalHeightFromValue(
                      context,
                      huge3Spacing,
                    ),
                    bottom: largeSpacing,
                  ),
                  child: Opacity(
                    opacity: animations.confirmButtonAnimationOpacity.value,
                    child: Observer(
                      builder: (context) {
                        return AnimatedFloatButtonWidget(
                          isActive: pageController.formValid,
                          onTap: (activate) {
                            pageController.onNextButtonPressed(
                              onValid,
                              onInvalid,
                            );
                          },
                          icon: IconsAsset.arrowIcon,
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          );
        },
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
    showCustomDialog(context, textKey: 'createWallet.nameWarning');
  }
}
