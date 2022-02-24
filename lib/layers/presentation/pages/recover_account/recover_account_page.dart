import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/recover_account_first_view.dart';
import 'package:freeflow/layers/presentation/widgets/animated_dot_indicator_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:get_it/get_it.dart';

class RecoverAccountPage extends StatefulWidget with TextThemes {
  const RecoverAccountPage({Key? key}) : super(key: key);

  @override
  State<RecoverAccountPage> createState() => _RecoverAccountPageState();
}

class _RecoverAccountPageState extends State<RecoverAccountPage> {
  final recoverAccountController = GetIt.I.get<RecoverAccountController>();

  @override
  void initState() {
    super.initState();
    recoverAccountController.updateWidgetAnimations();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: StandardColors.backgroundDark,
          body: Column(
            children: [
              RecoverAccountFirstView(
                recoverAccountController: recoverAccountController,
                showfirstViewFirstTextOpacity:
                    recoverAccountController.showfirstViewFirstTextOpacity,
                showfirstViewSecondTextOpacity:
                    recoverAccountController.showfirstViewSecondTextOpacity,
                showfirstViewTextFieldOpacity:
                    recoverAccountController.showfirstViewTextFieldOpacity,
              ),
              const SizedBox(height: xxlargeSpacing),
              AnimatedDotIndicatorWidget(
                currentIndex: 0,
                isFirstDotVisible:
                    recoverAccountController.showFirstDotIndicator,
                isSecondDotVisible:
                    recoverAccountController.showSecondDotIndicator,
                isThirdDotVisible:
                    recoverAccountController.showThirdDotIndicator,
                showIndexAnimation:
                    recoverAccountController.showCurrentIndexAnimation,
              ),
              const Spacer(),
              AnimatedFloatButtonWidget(
                isActive: recoverAccountController.isContinueButtonActive,
                isLargeAnimation:
                    recoverAccountController.isContinueButtonAnimating,
                showButton: recoverAccountController.showContinueButton,
                onTap: () =>
                    recoverAccountController.tapContinueButton(context, '', ''),
                icon: IconsAsset.arrowIcon,
              ),
              const SizedBox(height: bigSpacing),
            ],
          ),
        );
      },
    );
  }
}
