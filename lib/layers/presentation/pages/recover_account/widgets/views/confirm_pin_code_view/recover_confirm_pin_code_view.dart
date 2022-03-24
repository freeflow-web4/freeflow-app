import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/helpers/show_fullscreen_dialog.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/confirm_pin_code_view/recover_confirm_pin_code_animation.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/confirm_pin_code_view/recover_confirm_pin_code_view_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/pin_code_view/recover_pin_code_view_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/username_view/recover_username_animation.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_text.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/in_app_keyboard/in_app_keyboard_widget.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/staggered_widgets.dart';
import 'package:get_it/get_it.dart';

class RecoverConfirmPinCodeView extends StatefulWidget {
  final TextEditingController textEditingController;

  const RecoverConfirmPinCodeView({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  @override
  _RecoverConfirmPinCodeViewState createState() =>
      _RecoverConfirmPinCodeViewState();
}

class _RecoverConfirmPinCodeViewState extends State<RecoverConfirmPinCodeView>
    with TextThemes, TickerProviderStateMixin {
  late RecoverConfirmPinCodeAnimation animation;
  late final AnimationController animationController;
  final FocusNode inputNode = FocusNode();
  final viewController = GetIt.I.get<RecoverConfirmPinCodeViewController>();
  final pinCodeViewController = GetIt.I.get<RecoverPinCodeViewController>();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    animation = RecoverConfirmPinCodeAnimation(animationController);

    animationController.forward().orCancel;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Observer(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: huge4Spacing),
                AnimatedText(
                  text: TranslationService.translate(
                    context,
                    "recoverAccount.enterPinCode",
                  ),
                  animationController: animationController,
                  style: textH4TextStyle.copyWith(
                    color: StandardColors.white,
                  ),
                  animation: animation.firstTextOpacity,
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
                        isFieldValid: viewController.isConfirmPinCodeValid,
                        isObscureText: viewController.isObscuredPin,
                        onChanged: (value) {},
                        onObscureButtonPressed: () =>
                            viewController.setObscuredPin(),
                        fieldReadOnly: true,
                        hintText: FlutterI18n.translate(
                          context,
                          "recoverAccount.confirmPinCode",
                        ),
                        errorText: viewController.confirmPinCodeFieldState ==
                                ConfirmPinCodeFieldState.invalid
                            ? FlutterI18n.translate(
                                context,
                                "recoverAccount.pleaseEnterSamePinCode",
                              )
                            : null,
                        textController: widget.textEditingController,
                        pinCode: viewController.currentConfirmPinCode,
                      );
                    },
                  ),
                ),
                const SizedBox(height: xxlargeSpacing),
                StaggerOpacity(
                  opacity: animation.keyboardOpacity,
                  controller: animationController,
                  child: Center(
                    child: InAppKeyboardWidget(
                      onTap: (value) => viewController.getTypePinCode(
                        context,
                        value,
                        pinCodeViewController.currentPinCode,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                StaggerOpacity(
                  opacity: animation.buttonOpacity,
                  controller: animationController,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: bigSpacing),
                      child: AnimatedFloatButtonWidget(
                        isActive: viewController.isConfirmPinCodeValid,
                        icon: IconsAsset.arrowIcon,
                        onTap: () {},
                        onTapInative: () => showCustomDialog(
                          context,
                          textKey: 'recoverAccount.pleaseConfirmYourPinCode',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
