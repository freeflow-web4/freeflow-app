import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/logout/pages/auth/controller/logout_auth_controller.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/flexible_vertical_spacer.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field/gradient_text_field_widget.dart';

import 'package:freeflow/layers/presentation/widgets/in_app_keyboard/in_app_keyboard_widget.dart';

class LogoutAuthPage extends StatefulWidget {
  final bool canAuthenticateWithBiometric;
  const LogoutAuthPage({Key? key, this.canAuthenticateWithBiometric = true})
      : super(key: key);

  @override
  State<LogoutAuthPage> createState() => _LogoutAuthPageState();
}

class _LogoutAuthPageState extends State<LogoutAuthPage> with TextThemes {
  final pageController = findLogoutAuthController();

  @override
  void initState() {
    super.initState();
    pageController.init(context,
        canAuthenticateWithBiometric: widget.canAuthenticateWithBiometric);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FlexibleVerticalSpacer(height: mdSpacing),
          Observer(
            builder: (context) {
              return GradientTextFieldWidget(
                isFieldValid: pageController.formValid,
                normalTextColor: StandardColors.lightGrey,
                errorText: pageController.pinFieldState !=
                        GradientTextFieldState.invalid
                    ? null
                    : TranslationService.translate(
                        context,
                        'login.pinTextInputError',
                      ),
                hintText: TranslationService.translate(
                  context,
                  'login.hint',
                ),
                hintTextStyle:
                    subtitleTextStyle(color: StandardColors.lightGrey),
                onChanged: pageController.onPinChanged,
                value: pageController.currentPin,
                isObscureText: pageController.isPinObscure,
                onObscureButtonPressed: pageController.onPinObscureTextFieldTap,
                isPinInput: true,
                fieldReadOnly: true,
                showObscureButton: true,
                obscureButtonColor:
                    obscureButtonColor(pageController.pinFieldState),
              );
            },
          ),
          const FlexibleVerticalSpacer(height: largeSpacing),
          InAppKeyboardWidget(
            textColor: StandardColors.black,
            onTap: pageController.onKeyboardTap,
          ),
          const FlexibleVerticalSpacer(height: huge4Spacing),
          Observer(
            builder: (context) {
              return Container(
                width: 70,
                height: 70,
                alignment: Alignment.center,
                child: AnimatedFloatButtonWidget(
                  icon: IconsAsset.arrowIcon,
                  isActive: pageController.formValid,
                  isLargeButton: pageController.formValid,
                  onTap: pageController.onButtonTap,
                ),
              );
            },
          ),
          const FlexibleVerticalSpacer(height: bigSpacing),
        ],
      ),
    );
  }

  Color obscureButtonColor(GradientTextFieldState state) {
    if (state == GradientTextFieldState.wrong ||
        state == GradientTextFieldState.invalid) {
      return StandardColors.error;
    } else if (state == GradientTextFieldState.valid) {
      return StandardColors.secondary;
    } else {
      return StandardColors.black;
    }
  }
}
