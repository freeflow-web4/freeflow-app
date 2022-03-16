import 'package:flutter/material.dart';

import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/routes/routes.dart';
import '../../widgets/animated_center_logo.dart';

class RecoverAccountLoadingPage extends StatelessWidget {
  const RecoverAccountLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StandardColors.backgroundDark,
      body: AnimatedCenterLogo(
        onAnimationEnd: () =>
            Routes.instance.goToRecoverAccountPageRoute(context),
      ),
    );
  }
}
