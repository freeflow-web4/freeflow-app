import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/recover_account_view_animation.dart';
import 'package:freeflow/layers/presentation/widgets/custom_switch_widget.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/in_app_keyboard/in_app_keyboard_controller.dart';
import 'package:freeflow/layers/presentation/widgets/in_app_keyboard/in_app_keyboard_widget.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/stagger_opacity.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/stagger_position.dart';
import 'package:get_it/get_it.dart';

class RecoverAccountThirdView extends StatefulWidget {
  final RecoverAccountController recoverAccountController;
  final TextEditingController textEditingController;
  final void Function(String)? onInputChanged;

  const RecoverAccountThirdView({
    Key? key,
    required this.recoverAccountController,
    required this.textEditingController,
    required this.onInputChanged,
  }) : super(key: key);

  @override
  _RecoverAccountThirdViewState createState() =>
      _RecoverAccountThirdViewState();
}

class _RecoverAccountThirdViewState extends State<RecoverAccountThirdView>
    with TextThemes, TickerProviderStateMixin {
  late RecoverAccountViewAnimation recoverAccountViewAnimation;
  late final AnimationController animationController;
  final FocusNode inputNode = FocusNode();
  final InAppKeyboardController keyboardController =
      GetIt.I.get<InAppKeyboardController>();

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
                  textKey: "recoverAccount.enterPinCode",
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
                child: GradientTextFieldWidget(
                  inputNode: inputNode,
                  showObscureButton: true,
                  isPinInput: true,
                  isFieldValid: widget.recoverAccountController.isPinValid,
                  isObscureText: widget.recoverAccountController.isObscuredPin,
                  onChanged: widget.onInputChanged,
                  onObscureButtonPressed: () =>
                      widget.recoverAccountController.setObscuredPin(),
                  fieldReadOnly: true,
                  hintText: FlutterI18n.translate(
                      context, "recoverAccount.confirmPinCode"),
                  errorText: widget.recoverAccountController.pinCodeError,
                  textController: widget.textEditingController,
                  pinCode: keyboardController.text,
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
                      value: biometricValue,
                      onChanged: (value) {
                        biometricValue = value;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: largeSpacingx2),
              StaggerOpacity(
                opacity: recoverAccountViewAnimation.keyboardPinCodeOpacity,
                controller: animationController,
                child: const Center(
                  child: InAppKeyboardWidget(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
