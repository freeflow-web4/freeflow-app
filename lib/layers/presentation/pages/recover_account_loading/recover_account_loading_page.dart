import 'package:flutter/material.dart';

import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:get_it/get_it.dart';
import 'controller/recover_account_loading_controller.dart';
import '../../widgets/animated_center_logo.dart';

class RecoverAccountLoadingPage extends StatefulWidget {
  const RecoverAccountLoadingPage({Key? key}) : super(key: key);
  @override
  _RecoverAccountLoadingPageState createState() =>
      _RecoverAccountLoadingPageState();
}

class _RecoverAccountLoadingPageState extends State<RecoverAccountLoadingPage> {
  final RecoverAccountLoadingController recoverAccountLoadingController =
      GetIt.I<RecoverAccountLoadingController>();

  @override
  void initState() {
    super.initState();
    recoverAccountLoadingController.updateLoadingLogoOpacity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StandardColors.backgroundDark,
      body: AnimatedCenterLogo(
        onAnimationEnd: () =>
            recoverAccountLoadingController.goToRecoverAccountPage(context),
      ),
    );
  }
}
