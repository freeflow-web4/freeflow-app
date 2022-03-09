import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/layers/presentation/pages/auth/auth_controller.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/translation_text_widget.dart';
import 'package:get_it/get_it.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: mdSpacingx2),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TranslationText(textKey: 'login.authTitle'),
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
                  errorText: TranslationService.translate(
                    context,
                    'login.pinTextInputError',
                  ),
                  hintText: '',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
