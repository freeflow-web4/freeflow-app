import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
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
  //TODO: remove if possible and make not necessary for GradientTextFieldWidget
  final TextEditingController pinTextController = TextEditingController();
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
          (value) =>
              authController.biometricsLoginFlow(context, onLoginSuccess),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlackScaffold(
      child: Center(
        child: AnimatedBuilder(
          animation: animatedController,
          builder: (context, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: mdSpacingx2,
                    top: largeSpacingx2 * 2,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AnimatedText(
                      text: TranslationService.translate(
                          context, 'login.authTitle',),
                      animation: animatedController,
                      style:
                          textH4TextStyle.copyWith(color: StandardColors.white),
                      animationController: animatedController,
                    ),
                  ),
                ),
                Padding(
                  //TODO: add top padding
                  padding: const EdgeInsets.symmetric(
                    horizontal: mdSpacingx2,
                  ),
                  child: Opacity(
                    opacity: animations.pinFieldAnimationOpacity.value,
                    child: Observer(
                      builder: (context) {
                        return GradientTextFieldWidget(
                          onChanged: (_) {},
                          isFieldValid: authController.pinFieldState !=
                              PinFieldState.invalid,
                          textController: pinTextController,
                          errorText: authController.pinFieldState !=
                                  PinFieldState.invalid
                              ? null
                              : TranslationService.translate(
                                  context,
                                  'login.pinTextInputError',
                                ),
                          hintText: '',
                          fieldReadOnly: true,
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: xxlargeSpacing),
                  child: Opacity(
                    opacity: animations.keyboardAnimationOpacity.value,
                    child: InAppKeyboardWidget(
                      onTap: (digit) {
                        final currentText = pinTextController.text;
                        final nextCurrentText =
                            authController.onKeyboardTap(digit, currentText);
                        setState(() {
                          pinTextController.text = nextCurrentText;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: largeSpacingx2 * 2),
                  child: Opacity(
                    opacity: animations.confirmButtonAnimationOpacity.value,
                    child: AnimatedArrowRight(
                      onTap: () => authController.loginWithArrowButton(
                        pinTextController.text,
                        onLoginSuccess,
                      ),
                      isActive: false,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  void onLoginSuccess() async {
    animatedController
        .animateBack(
          0,
          duration: const Duration(milliseconds: animationDurationInMili ~/ 3),
        )
        .orCancel;
  }
}
