import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/auth/auth_controller.dart';
import 'package:freeflow/layers/presentation/widgets/animated_arrow_right_widget.dart';
import 'package:freeflow/layers/presentation/widgets/custom_bottom_sheet.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/in_app_keyboard/in_app_keyboard_widget.dart';
import 'package:get_it/get_it.dart';

enum UpdatePincodeState {
  enterCurrentPinCode,
  chooseNewPincode,
  confirmNewPincode
}

class UpdatePincodeView extends StatefulWidget {
  const UpdatePincodeView({Key? key}) : super(key: key);

  @override
  State<UpdatePincodeView> createState() => _UpdatePincodeViewState();
}

class _UpdatePincodeViewState extends State<UpdatePincodeView> with TextThemes {
  AuthController authController = GetIt.I.get<AuthController>();
  late String pinAuth;

  @override
  void initState() {
    pinAuth = authController.currentPinCode;
    authController.currentPinCode = '';
    authController.isPinObscure = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return CustomBottomSheet(
        children: [
          textSubtitle(context, textKey: 'login.authTitle'),
          GradientTextFieldWidget(
            pinCode: authController.currentPinCode,
            onChanged: (_) {},
            textColor: StandardColors.backgroundDark,
            isFieldValid: authController.pinFieldState != PinFieldState.invalid,
            errorText: authController.pinFieldState != PinFieldState.wrong
                ? null
                : TranslationService.translate(
                    context,
                    'login.pinTextInputError',
                  ),
            hintText: getLabelByState(),
            fieldReadOnly: true,
            isObscureText: authController.isPinObscure,
            onObscureButtonPressed: authController.onPinObscureTextFieldTap,
            obscureButtonColor:
                obscureButtonColor(authController.pinFieldState),
            showObscureButton: true,
          ),
          InAppKeyboardWidget(
            keyColor: StandardColors.backgroundDark,
            onTap: (digit) {
              final currentText = authController.currentPinCode;
              authController.onKeyboardTap(digit, currentText);
            },
          ),
          Observer(
            builder: (context) {
              return AnimatedArrowRight(
                onTap: () {
                  if (authController.updatePincodeState ==
                      UpdatePincodeState.enterCurrentPinCode) {
                    authController.pinCodeHasMatch(pinAuth);
                  } else if (authController.updatePincodeState ==
                      UpdatePincodeState.chooseNewPincode) {
                    pinAuth = authController.currentPinCode;
                    authController.updatePincodeState =
                        UpdatePincodeState.confirmNewPincode;
                    authController.currentPinCode = '';
                  } else {
                    authController.setNewPincode(pinAuth);
                  }
                },
                isActive: authController.isPinValid,
              );
            },
          ),
        ],
      );
    });
  }

  String getLabelByState() {
    if (authController.updatePincodeState ==
        UpdatePincodeState.enterCurrentPinCode) {
      return 'Enter your PIN code';
    } else if (authController.updatePincodeState ==
        UpdatePincodeState.chooseNewPincode) {
      return 'Choose your new pincode';
    } else if (authController.updatePincodeState ==
        UpdatePincodeState.confirmNewPincode) {
      return 'Confirm your new pincode';
    }
    return '';
  }

  Color obscureButtonColor(PinFieldState state) {
    late Color color;
    if (state == PinFieldState.wrong) {
      color = StandardColors.error;
    } else if (authController.pinFieldState == PinFieldState.valid) {
      color = StandardColors.secondary;
    } else {
      color = StandardColors.backgroundDark;
    }
    return color;
  }
}
