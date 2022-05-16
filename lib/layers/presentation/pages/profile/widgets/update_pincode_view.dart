import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/adaptative_size.dart';

import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/auth/auth_controller.dart';
import 'package:freeflow/layers/presentation/widgets/animated_arrow_right_widget.dart';
import 'package:freeflow/layers/presentation/widgets/custom_bottom_sheet.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/in_app_keyboard/in_app_keyboard_widget.dart';
import 'package:freeflow/layers/presentation/widgets/informative_dialog.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:get_it/get_it.dart';

enum RecoverPincodeState {
  authentication,
  chooseNewPincode,
  confirmNewPincode,
  changeCompleted,
  error
}

class UpdatePincodeView extends StatefulWidget {
  const UpdatePincodeView({Key? key}) : super(key: key);

  @override
  State<UpdatePincodeView> createState() => _UpdatePincodeViewState();
}

class _UpdatePincodeViewState extends State<UpdatePincodeView> with TextThemes {
  AuthController authController = GetIt.I.get<AuthController>();

  @override
  void initState() {
    super.initState();
    authController.currentPinCode = '';
    authController.isPinObscure = true;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return CustomBottomSheet(
          children: [
            textH6(context, textKey: getTitleByState()),
            Padding(
              padding: EdgeInsets.only(
              
                  top: getProportionalHeightFromValue(
                    context,
                    xxlargeSpacing,
                  ),
              ),
              child: GradientTextFieldWidget(
                value: authController.currentPinCode,
                onChanged: (_) {},
                normalTextColor: StandardColors.backgroundDark,
                isFieldValid: authController.pinCodeIsInvalid,
                errorText:
                    authController.pinFieldState != GradientTextFieldState.wrong
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
            ),
            InAppKeyboardWidget(
              textColor: StandardColors.backgroundDark,
              padding: EdgeInsets.only(
                top: getProportionalHeightFromValue(
                  context,
                  largeSpacingx2,
                ),
              ),
              onTap: (digit) {
                final currentText = authController.currentPinCode;
                authController.onKeyboardTap(digit, currentText);
              },
            ),
            StatefulBuilder(
              builder: (context, setBottomSheetState) {
                return AnimatedArrowRight(
                  onTap: () {
                    showInformativeDialog();
                  },
                  isActive: authController.isPinValid &&
                      authController.currentPinCode.isNotEmpty,
                  padding: EdgeInsets.only(
                    bottom: smSpacing,
                    top: getProportionalHeightFromValue(
                      context,
                      huge3Spacing,
                    ),
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }

  void showInformativeDialog() {
    authController.onConfirmPinCodeChange(
      onFail: () {
        showDialog(
          context: context,
          builder: (context) {
            return InformativeDialog(
              icon: IconsAsset.closeBackIcon,
              title: TranslationService.translate(
                context,
                'profile.unableToChangePinCode',
              ),
            );
          },
        );
      },
      onSuccess: () {
        showDialog(
          context: context,
          builder: (context) {
            return InformativeDialog(
              icon: IconsAsset.checkIcon,
              title: TranslationService.translate(
                context,
                'profile.changeMadeSuccessfully',
              ),
            );
          },
        ).then((value) {
          Routes.instance.pop();
        });
      },
    );
  }

  String getTitleByState() {
    if (authController.recoverPincodeState ==
        RecoverPincodeState.chooseNewPincode) {
      return FlutterI18n.translate(context, "profile.insertYourNewPinCode");
    } else if (authController.recoverPincodeState ==
        RecoverPincodeState.confirmNewPincode) {
      return FlutterI18n.translate(context, "profile.confirmYourNewPinCode")
          .toUpperCase();
    }
    return FlutterI18n.translate(context, "login.authTitle").toUpperCase();
  }

  String getLabelByState() {
    if (authController.recoverPincodeState ==
        RecoverPincodeState.authentication) {
      return FlutterI18n.translate(context, "profile.enterYourPinCode");
    } else if (authController.recoverPincodeState ==
        RecoverPincodeState.chooseNewPincode) {
      return FlutterI18n.translate(context, "profile.chooseYourPinCode");
    } else if (authController.recoverPincodeState ==
        RecoverPincodeState.confirmNewPincode) {
      return FlutterI18n.translate(context, "profile.confirmYourNewPinCode");
    }
    return '';
  }

  Color obscureButtonColor(GradientTextFieldState state) {
    late Color color;
    if (state == GradientTextFieldState.wrong) {
      color = StandardColors.error;
    } else if (authController.isPinValid &&
        authController.authenticationPin.isNotEmpty) {
      color = StandardColors.secondary;
    } else {
      color = StandardColors.backgroundDark;
    }
    return color;
  }
}
