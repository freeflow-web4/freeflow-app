import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_pin_code_view_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/recover_account_view_animation.dart';
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
  late RecoverAccountViewAnimation recoverAccountViewAnimation;
  late final AnimationController animationController;
  final FocusNode inputNode = FocusNode();
  final viewController = GetIt.I.get<RecoverPinCodeViewController>();

  bool biometricValue = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    recoverAccountViewAnimation =
        RecoverAccountViewAnimation(animationController);
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
        if (widget.recoverAccountController.isAnimatingExitThirdView) {
          animationController.reverse();
        }
        if (widget.recoverAccountController.isAnimatingExitThirdViewEnd) {
          animationController.forward();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 104),
              StaggerOpacity(
                opacity: recoverAccountViewAnimation.firstTextPinCodeOpacity,
                controller: animationController,
                child: textH4(
                  context,
                  textKey: "recoverAccount.configPinCode",
                  color: Colors.white,
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: mdSpacingx2),
              StaggerPosition(
                opacity: recoverAccountViewAnimation.textFieldPinCodeOpacity,
                horizontalOffset: recoverAccountViewAnimation
                    .textFieldPinCodeHorizontalPosition,
                controller: animationController,
                child: Observer(
                  builder: (context) {
                    return GradientTextFieldWidget(
                      inputNode: inputNode,
                      showObscureButton: true,
                      isPinInput: true,
                      isFieldValid: widget.recoverAccountController.isPinValid,
                      isObscureText: viewController.isObscuredPin,
                      onChanged: widget.onInputChanged,
                      onObscureButtonPressed: () =>
                          viewController.setObscuredPin(),
                      fieldReadOnly: true,
                      hintText: FlutterI18n.translate(
                          context, "recoverAccount.confirmPinCode"),
                      errorText: widget.recoverAccountController.pinCodeError,
                      textController: widget.textEditingController,
                      pinCode: viewController.pinCode,
                    );
                  },
                ),
              ),
              const SizedBox(height: 13),
              StaggerOpacity(
                opacity: recoverAccountViewAnimation.secondTextPinCodeOpacity,
                controller: animationController,
                child: Row(
                  children: [
                    textSubtitle(
                      context,
                      textKey: "recoverAccount.rememberMe",
                      color: Colors.white,
                      maxLines: 2,
                    ),
                    const SizedBox(width: mdSpacingx2),
                    CustomSwitch(
                      value: viewController.rememberMe,
                      onChanged: (value) => viewController.biometricAuth(value),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: largeSpacingx2),
              StaggerOpacity(
                opacity: recoverAccountViewAnimation.keyboardPinCodeOpacity,
                controller: animationController,
                child: Center(
                  child: InAppKeyboardWidget(
                    onTap: (value) => viewController.getTypePinCode(
                      context,
                      value,
                      widget.recoverAccountController.onChangedField,
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
}
