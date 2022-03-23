import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/helpers/show_fullscreen_dialog.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/pin_code_view/recover_pin_code_animation.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/pin_code_view/recover_pin_code_view_controller.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/custom_switch_widget.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/in_app_keyboard/in_app_keyboard_widget.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/stagger_opacity.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/stagger_position.dart';
import 'package:get_it/get_it.dart';

class RecoverPinCodeView extends StatefulWidget {
  final RecoverAccountController recoverAccountController;
  final TextEditingController textEditingController;
  final void Function(String)? onInputChanged;

  const RecoverPinCodeView({
    Key? key,
    required this.recoverAccountController,
    required this.textEditingController,
    required this.onInputChanged,
  }) : super(key: key);

  @override
  _RecoverPinCodeViewState createState() => _RecoverPinCodeViewState();
}

class _RecoverPinCodeViewState extends State<RecoverPinCodeView>
    with TextThemes, TickerProviderStateMixin {
  late RecoverPinCodeAnimation animation;
  late final AnimationController animationController;
  final FocusNode inputNode = FocusNode();
  final viewController = GetIt.I.get<RecoverPinCodeViewController>();
  bool biometricValue = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    animation = RecoverPinCodeAnimation(animationController);
    viewController.hasBiometricAvailable();
    animationController.forward().orCancel;
    viewController.userSetBiometricsUsecase(false);
    viewController.canCheckBiometrics();
    viewController.setRememberMe(false);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: mdSpacingx2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: huge4Spacing),
              StaggerOpacity(
                opacity: animation.firstTextOpacity,
                controller: animationController,
                child: textH4(
                  context,
                  textKey: "recoverAccount.configPinCode",
                  color: StandardColors.white,
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: mdSpacingx2),
              StaggerPosition(
                horizontalOffset: animation.textFieldHorizontalPosition,
                controller: animationController,
                child: Observer(
                  builder: (context) {
                    return GradientTextFieldWidget(
                      inputNode: inputNode,
                      showObscureButton: true,
                      isPinInput: true,
                      isFieldValid: viewController.isPinCodeValid,
                      isObscureText: viewController.isObscuredPin,
                      onChanged: (value) {},
                      onObscureButtonPressed: () =>
                          viewController.setObscuredPin(),
                      fieldReadOnly: true,
                      hintText: FlutterI18n.translate(
                        context,
                        "recoverAccount.confirmPinCode",
                      ),
                      errorText: viewController.pinCodeFieldState ==
                              PinCodeFieldState.invalid
                          ? FlutterI18n.translate(
                              context,
                              "recoverAccount.pleaseEnterPinCode",
                            )
                          : null,
                      textController: widget.textEditingController,
                      pinCode: viewController.currentPinCode,
                    );
                  },
                ),
              ),
              const SizedBox(height: 13),
              StaggerOpacity(
                opacity: animation.biometryOpacity,
                controller: animationController,
                child: Observer(
                  builder: (context) {
                    return Visibility(
                      visible: viewController.isBiometricAvailable,
                      child: Row(
                        children: [
                          textSubtitle(
                            context,
                            textKey: "recoverAccount.rememberMe",
                            color: StandardColors.white,
                            maxLines: 2,
                          ),
                          const SizedBox(width: mdSpacingx2),
                          CustomSwitch(
                            value: viewController.rememberMe,
                            onChanged: (value) =>
                                viewController.biometricAuth(value),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: largeSpacingx2),
              StaggerOpacity(
                opacity: animation.keyboardOpacity,
                controller: animationController,
                child: Center(
                  child: InAppKeyboardWidget(
                    onTap: (value) => viewController.getTypePinCode(
                      context,
                      value,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: normalSpacing),
              StaggerOpacity(
                opacity: animation.buttonOpacity,
                controller: animationController,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: bigSpacing),
                  child: AnimatedFloatButtonWidget(
                    isActive: viewController.isPinCodeValid,
                    icon: IconsAsset.arrowIcon,
                    onTap: () {},
                    onTapInative: () => showCustomDialog(
                      context,
                      textKey: 'recoverAccount.pleaseEnterYourRegisteredName',
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void goToNextPage() async {
    animationController.animateBack(0, duration: const Duration(seconds: 5));
    Future.delayed(const Duration(seconds: 5)).then(
      (_) {
        widget.recoverAccountController.setCurrentPage(3);
        animationController.forward();
      },
    );
  }
}
