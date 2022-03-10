import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/auth/auth_controller.dart';
import 'package:freeflow/layers/presentation/widgets/animated_arrow_right_widget.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/in_app_keyboard/in_app_keyboard_widget.dart';
import 'package:get_it/get_it.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with TextThemes {
  final authController = GetIt.I.get<AuthController>();
  //TODO: remove if possible and make not necessary for GradientTextFieldWidget
  final FocusNode pinInputNode = FocusNode();
  final TextEditingController pinTextController = TextEditingController();

  @override
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StandardColors.backgroundDark,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: mdSpacingx2,
              top: 104,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: textH4(
                context,
                textKey: 'login.authTitle',
                color: StandardColors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: mdSpacingx2,
            ),
            child: Observer(
              builder: (context) {
                return GradientTextFieldWidget(
                  onChanged: (_) {},
                  isFieldValid:
                      authController.pinFieldState != PinFieldState.invalid,
                  textController: pinTextController,
                  inputNode: pinInputNode,
                  errorText:
                      authController.pinFieldState != PinFieldState.invalid
                          ? null
                          : TranslationService.translate(
                              context,
                              'login.pinTextInputError',
                            ),
                  hintText: '',
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: xxlargeSpacing),
            child: InAppKeyboardWidget(
              onTap: (digit) {
                final currentText = pinTextController.text;
                String nextCurrentText = '';
                if (digit == 'X') {
                  final end =
                      currentText.length - 1 < 0 ? 0 : currentText.length - 1;
                  nextCurrentText = currentText.substring(0, end);
                } else if (digit == 'del') {
                  nextCurrentText = '';
                } else {
                  nextCurrentText = currentText + digit;
                }
                setState(() {
                  pinTextController.text = nextCurrentText;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: xxlargeSpacing * 2),
            child: AnimatedArrowRight(
              onTap: () {
              },
              isActive: false,
            ),
          )
        ],
      ),
    );
  }
}
