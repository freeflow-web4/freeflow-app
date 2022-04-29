import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
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
  String pinAuth = '';

  @override
  void initState() {
    authController.currentPinCode = '';
    authController.isPinObscure = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return CustomBottomSheet(
          children: [
            textSubtitle(context, textKey: getTitleByState()),
            inputWidget(),
            keyboardWidget(),
            confirmButton(),
          ],
        );
      },
    );
  }

  Widget confirmButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: bigSpacing),
      child: AnimatedArrowRight(
        onTap: () {
          if (authController.updatePincodeState ==
              UpdatePincodeState.enterCurrentPinCode) {
            authController.pinCodeHasMatch();
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
      ),
    );
  }

  Widget keyboardWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 104, top: huge2Spacing),
      child: InAppKeyboardWidget(
        textColor: StandardColors.backgroundDark,
        onTap: (digit) {
          final currentText = authController.currentPinCode;
          authController.onKeyboardTap(digit, currentText);
        },
      ),
    );
  }

  Widget inputWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: bigSpacing),
      child: GradientTextFieldWidget(
        value: authController.currentPinCode,
        onChanged: (_) {},
        normalTextColor: StandardColors.backgroundDark,
        isFieldValid: authController.pinFieldState != GradientTextFieldState.invalid,
        errorText: authController.pinFieldState != GradientTextFieldState.wrong
            ? null
            : TranslationService.translate(
                context,
                'login.pinTextInputError',
              ),
        hintText: getLabelByState(),
        fieldReadOnly: true,
        isObscureText: authController.isPinObscure,
        onObscureButtonPressed: authController.onPinObscureTextFieldTap,
        obscureButtonColor: obscureButtonColor(authController.pinFieldState),
        showObscureButton: true,
      ),
    );
  }

  String getTitleByState() {
    if (authController.updatePincodeState ==
        UpdatePincodeState.chooseNewPincode) {
      return FlutterI18n.translate(context, "profile.insertYourNewPinCode");
    } else if (authController.updatePincodeState ==
        UpdatePincodeState.confirmNewPincode) {
      return FlutterI18n.translate(context, "profile.confirmYourNewPinCode")
          .toUpperCase();
    }
    return FlutterI18n.translate(context, "login.authTitle").toUpperCase();
  }

  String getLabelByState() {
    if (authController.updatePincodeState ==
        UpdatePincodeState.enterCurrentPinCode) {
      return FlutterI18n.translate(context, "profile.enterYourPinCode");
    } else if (authController.updatePincodeState ==
        UpdatePincodeState.chooseNewPincode) {
      return FlutterI18n.translate(context, "profile.chooseYourPinCode");
    } else if (authController.updatePincodeState ==
        UpdatePincodeState.confirmNewPincode) {
      return FlutterI18n.translate(context, "profile.confirmYourNewPinCode");
    }
    return '';
  }

  Color obscureButtonColor(GradientTextFieldState state) {
    late Color color;
    if (state == GradientTextFieldState.wrong) {
      color = StandardColors.error;
    } else if (authController.pinFieldState == GradientTextFieldState.valid) {
      color = StandardColors.secondary;
    } else {
      color = StandardColors.backgroundDark;
    }
    return color;
  }
}
