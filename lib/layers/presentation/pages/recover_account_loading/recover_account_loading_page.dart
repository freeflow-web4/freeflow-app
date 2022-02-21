import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:freeflow/core/utils/colors_constants.dart';
import 'controller/recover_account_loading_controller.dart';
import '../../widgets/animated_center_logo.dart';

class RecoverAccountLoadingPage extends StatefulWidget {
  final RecoverAccountLoadingController recoverAccountLoadingController;
  const RecoverAccountLoadingPage(
      {Key? key, required this.recoverAccountLoadingController})
      : super(key: key);
  @override
  _RecoverAccountLoadingPageState createState() =>
      _RecoverAccountLoadingPageState();
}

class _RecoverAccountLoadingPageState extends State<RecoverAccountLoadingPage> {
  @override
  void initState() {
    super.initState();
    widget.recoverAccountLoadingController.updateLoadingLogoOpacity();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        widget.recoverAccountLoadingController.goToRecoverAccountPage(context);
        return Scaffold(
          backgroundColor: StandardColors.backgroundDark,
          body: AnimatedCenterLogo(
            logoOpacity:
                widget.recoverAccountLoadingController.loadingLogoOpacity,
            showFirstFrame:
                widget.recoverAccountLoadingController.showLogoLoading1,
          ),
        );
      },
    );
  }
}
