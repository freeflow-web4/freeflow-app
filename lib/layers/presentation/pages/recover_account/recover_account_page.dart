import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/recover_account_first_view.dart';
import 'package:freeflow/layers/presentation/widgets/continue_button_widget.dart';
import 'package:get_it/get_it.dart';

class RecoverAccountPage extends StatefulWidget with TextThemes {
  const RecoverAccountPage({Key? key}) : super(key: key);

  @override
  State<RecoverAccountPage> createState() => _RecoverAccountPageState();
}

class _RecoverAccountPageState extends State<RecoverAccountPage> {
  final recoverAccountController = GetIt.I.get<RecoverAccountController>();

  @override
  Widget build(BuildContext context) {
    recoverAccountController.updateWidgetAnimations();
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: StandardColors.backgroundDark,
          body: Column(
            children: [
              RecoverAccountFirstView(
                showfirstViewFirstTextOpacity:
                    recoverAccountController.showfirstViewFirstTextOpacity,
                showfirstViewSecondTextOpacity:
                    recoverAccountController.showfirstViewSecondTextOpacity,
                showfirstViewTextFieldOpacity:
                    recoverAccountController.showfirstViewTextFieldOpacity,
              ),
              const SizedBox(height: xxlargeSpacing),
              // const AnimatedDotIndicatorWidget(),
              const Spacer(),
              ContinueButtonWidget(
                isActive: recoverAccountController.isContinueButtonActive,
                isLargeAnimation:
                    recoverAccountController.isContinueButtonAnimating,
                showButton: recoverAccountController.showContinueButton,
              ),
              const SizedBox(height: bigSpacing),
            ],
          ),
        );
      },
    );
  }
}
