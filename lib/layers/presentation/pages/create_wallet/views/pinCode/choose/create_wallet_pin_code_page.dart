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
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_text.dart';
import 'package:freeflow/layers/presentation/widgets/custom_switch_widget.dart';
import 'package:freeflow/layers/presentation/widgets/flexible_vertical_spacer.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/in_app_keyboard/in_app_keyboard_widget.dart';
import 'package:get_it/get_it.dart';
part 'create_wallet_pin_code_animations.dart';

class CreateWalletPinCodeView extends StatefulWidget {
  final bool animatedOnStart;
  final void Function(PinCodeFormModel pinCodeFormModel) onValid;

  const CreateWalletPinCodeView({
    Key? key,
    required this.animatedOnStart,
    required this.onValid,
  }) : super(key: key);

  @override
  State<CreateWalletPinCodeView> createState() =>
      _CreateWalletPinCodeViewState();
}

class _CreateWalletPinCodeViewState extends State<CreateWalletPinCodeView>
    with TickerProviderStateMixin, TextThemes {
  static const _totalDuration = Duration(milliseconds: 3600);

  late final animationController =
      AnimationController(vsync: this, duration: _totalDuration);

  late final animations =
      CreateWalletPinCodePageAnimations(animationController);

  final pageController = GetIt.I.get<CreateWalletPinCodeController>();

  @override
  void initState() {
    super.initState();
    if (!widget.animatedOnStart) {
      animationController.animateTo(1, duration: Duration.zero);
    } else {
      animationController.forward();
    }
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
              children: [
                const FlexibleVerticalSpacer(
                  height: huge4Spacing,
                ),
                AnimatedText(
                  text: TranslationService.translate(
                    context,
                    "createWallet.pinCodeTitle1",
                  ),
                  animationController: animationController,
                  style: textH4TextStyle.copyWith(color: StandardColors.white),
                  animation: animations.title1Opacity,
                ),
                const FlexibleVerticalSpacer(
                  height: mdSpacingx2,
                ),
                Opacity(
                  opacity: animations.field1Opacity.value,
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
                        isFieldValid: pageController.isGradientTextFieldValid,
                        isPinInput: true,
                        value: pageController.currentPinCode,
                        isObscureText: pageController.isPinObscure,
                        onObscureButtonPressed:
                            pageController.onPinObscureTextFieldTap,
                      );
                    },
                  ),
                ),
                Opacity(
                  opacity: animations.rememberOpacity.value,
                  child: Row(
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
                ),
                const FlexibleVerticalSpacer(
                  height: mdSpacingx2,
                ),
                Opacity(
                  opacity: animations.keyboardAnimationOpacity.value,
                  child: InAppKeyboardWidget(
                    onTap: pageController.onKeyboardTap,
                  ),
                ),
                const FlexibleVerticalSpacer(
                  height: huge3Spacing,
                ),
                Opacity(
                  opacity: animations.confirmButtonAnimationOpacity.value,
                  child: Observer(
                    builder: (context) {
                      return Container(
                        height: 70,
                        width: 70,
                        alignment: Alignment.center,
                        child: AnimatedFloatButtonWidget(
                          isActive: pageController.formValid,
                          onTap: (activate) {
                            pageController.onNextButtonPressed(
                              onValid,
                              onInvalid,
                            );
                          },
                          icon: IconsAsset.arrowIcon,
                          isLargeButton: pageController.formValid,
                        ),
                      );
                    },
                  ),
                ),
                const FlexibleVerticalSpacer(
                  height: largeSpacing,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void onValid(PinCodeFormModel pinCodeFormModel) async {
    await animationController.animateTo(
      0,
      duration: Duration(milliseconds: _totalDuration.inMilliseconds ~/ 2),
    );
    widget.onValid(pinCodeFormModel);
    animationController.animateTo(
      1,
      duration: Duration.zero,
    );
  }

  void onInvalid() {
    showCustomDialog(context, textKey: 'createWallet.nameWarning');
  }
}
