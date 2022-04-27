import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/adaptative_size.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/auth/auth_controller.dart';
import 'package:freeflow/layers/presentation/pages/auth/auth_page_animations.dart';
import 'package:freeflow/layers/presentation/pages/auth/widgets/black_page_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_arrow_right_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_text.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/in_app_keyboard/in_app_keyboard_widget.dart';
import 'package:get_it/get_it.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with TickerProviderStateMixin, TextThemes {
  static const animationDurationInMili = 1000;
  final authController = GetIt.I.get<AuthController>();
  late final animatedController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: animationDurationInMili),
  );
  late final AuthPageAnimations animations =
      AuthPageAnimations(animatedController);

  @override
  void initState() {
    super.initState();
    animatedController.forward().orCancel.then(
          (value) => authController.loginWithBiometrics(
            context,
            onLoginSuccess,
            onBiometricsError,
          ),
        );
  }

  @override
  void dispose() {
    animatedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlackScaffold(
      child: AnimatedBuilder(
        animation: animatedController,
        builder: (context, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: mdSpacingx2,
                ),
                child: AnimatedText(
                  text: TranslationService.translate(
                    context,
                    'login.authTitle',
                  ),
                  animation: animatedController,
                  style: textH4TextStyle.copyWith(
                    color: StandardColors.white,
                  ),
                  animationController: animatedController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: mdSpacingx2,
                  right: mdSpacingx2,
                  top: getProportionalHeightFromValue(
                    context,
                    xxlargeSpacing,
                  ),
                ),
                child: Opacity(
                  opacity: animations.pinFieldAnimationOpacity.value,
                  child: Observer(
                    builder: (context) {
                      return GradientTextFieldWidget(
                        value: authController.currentPinCode,
                        onChanged: (_) {},
                        isFieldValid: authController.pinFieldState !=
                            GradientTextFieldState.invalid,
                        errorText: authController.pinFieldState !=
                                GradientTextFieldState.wrong
                            ? null
                            : TranslationService.translate(
                                context,
                                'login.pinTextInputError',
                              ),
                        hintText: '',
                        fieldReadOnly: true,
                        isObscureText: authController.isPinObscure,
                        onObscureButtonPressed:
                            authController.onPinObscureTextFieldTap,
                        obscureButtonColor:
                            obscureButtonColor(authController.pinFieldState),
                        showObscureButton: true,
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getProportionalHeightFromValue(
                    context,
                    largeSpacingx2,
                  ),
                ),
                child: Opacity(
                  opacity: animations.keyboardAnimationOpacity.value,
                  child: InAppKeyboardWidget(
                    onTap: (digit) {
                      final currentText = authController.currentPinCode;
                      authController.onKeyboardTap(digit, currentText);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getProportionalHeightFromValue(
                    context,
                    huge3Spacing,
                  ),
                ),
                child: Opacity(
                  opacity: animations.confirmButtonAnimationOpacity.value,
                  child: Observer(
                    builder: (context) {
                      return AnimatedArrowRight(
                        onTap: () => authController.onLoginWithPin(
                          authController.currentPinCode,
                          onLoginSuccess,
                        ),
                        isActive: authController.isPinValid,
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Color obscureButtonColor(GradientTextFieldState state) {
    late Color color;
    if (state == GradientTextFieldState.wrong) {
      color = StandardColors.error;
    } else if (authController.pinFieldState == GradientTextFieldState.valid) {
      color = StandardColors.secondary;
    } else {
      color = StandardColors.white;
    }
    return color;
  }

  void onLoginSuccess() async {
    animatedController
        .animateBack(
          0,
          duration: const Duration(milliseconds: animationDurationInMili ~/ 3),
        )
        .orCancel
        .then((value) => authController.nextPage());
  }

  void onBiometricsError(Exception error) {}
}
