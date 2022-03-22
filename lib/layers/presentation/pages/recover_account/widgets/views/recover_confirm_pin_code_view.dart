import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_pin_code_view_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/recover_username_view/recover_username_view_animation.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/in_app_keyboard/in_app_keyboard_widget.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/stagger_opacity.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/stagger_position.dart';
import 'package:get_it/get_it.dart';

class RecoverConfirmPinCodeView extends StatefulWidget {
  final RecoverAccountController recoverAccountController;
  final TextEditingController textEditingController;
  final void Function(String)? onInputChanged;

  const RecoverConfirmPinCodeView({
    Key? key,
    required this.recoverAccountController,
    required this.textEditingController,
    required this.onInputChanged,
  }) : super(key: key);

  @override
  _RecoverConfirmPinCodeViewState createState() =>
      _RecoverConfirmPinCodeViewState();
}

class _RecoverConfirmPinCodeViewState extends State<RecoverConfirmPinCodeView>
    with TextThemes, TickerProviderStateMixin {
  late RecoverUsernameAnimation recoverAccountViewAnimation;
  late final AnimationController animationController;
  final FocusNode inputNode = FocusNode();
  final viewController = GetIt.I.get<RecoverPinCodeViewController>();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

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
        if (widget.recoverAccountController.isAnimatingExitFourthView) {
          animationController.reverse();
        }
        if (widget.recoverAccountController.isAnimatingExitFourthViewEnd) {
          animationController.forward();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 104),
              textH4(
                context,
                textKey: "recoverAccount.enterPinCode",
                color: StandardColors.white,
                maxLines: 2,
              ),
              const SizedBox(height: mdSpacingx2),
              Observer(
                builder: (context) {
                  return GradientTextFieldWidget(
                    inputNode: inputNode,
                    showObscureButton: true,
                    isPinInput: true,
                    isFieldValid:
                        widget.recoverAccountController.isConfirmPinCodeValid,
                    isObscureText: viewController.isObscuredPin,
                    onChanged: widget.onInputChanged,
                    onObscureButtonPressed: () =>
                        viewController.setObscuredPin(),
                    fieldReadOnly: true,
                    hintText: FlutterI18n.translate(
                        context, "recoverAccount.confirmPinCode"),
                    errorText:
                        widget.recoverAccountController.confirmPinCodeError,
                    textController: widget.textEditingController,
                    pinCode: viewController.confirmPinCode,
                  );
                },
              ),
              const SizedBox(height: xxlargeSpacing),
              Center(
                child: InAppKeyboardWidget(
                  onTap: (value) => viewController.getTypeConfirmPinCode(
                    context,
                    value,
                    widget.recoverAccountController.onChangedField,
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
