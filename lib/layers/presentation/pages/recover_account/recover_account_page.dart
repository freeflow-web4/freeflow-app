import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/recover_account_first_view.dart';
import 'package:freeflow/layers/presentation/widgets/animated_dot_indicator_widget.dart';

class RecoverAccountPage extends StatefulWidget with TextThemes {
  final RecoverAccountController recoverAccountController;

  const RecoverAccountPage({
    Key? key,
    required this.recoverAccountController,
  }) : super(key: key);

  @override
  State<RecoverAccountPage> createState() => _RecoverAccountPageState();
}

class _RecoverAccountPageState extends State<RecoverAccountPage> {
  @override
  Widget build(BuildContext context) {
    widget.recoverAccountController.updateLoadingLogoOpacity();
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: StandardColors.backgroundDark,
          body: Column(
            children: [
              RecoverAccountFirstView(
                showfirstViewFirstTextOpacity: widget
                    .recoverAccountController.showfirstViewFirstTextOpacity,
                showfirstViewSecondTextOpacity: widget
                    .recoverAccountController.showfirstViewSecondTextOpacity,
                showfirstViewTextFieldOpacity: widget
                    .recoverAccountController.showfirstViewTextFieldOpacity,
              ),
              const SizedBox(height: xxlargeSpacing),
              const AnimatedDotIndicatorWidget(),
            ],
          ),
        );
      },
    );
  }
}
