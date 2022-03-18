import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/assets_constants.dart';

import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/routes/routes.dart';

class FreeflowLogoLoadingPage extends StatefulWidget {
  const FreeflowLogoLoadingPage({Key? key}) : super(key: key);

  @override
  State<FreeflowLogoLoadingPage> createState() =>
      _FreeflowLogoLoadingPageState();
}

class _FreeflowLogoLoadingPageState extends State<FreeflowLogoLoadingPage> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 10), (timer) {
      Routes.instance.goToRecoverAccountPageRoute();
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StandardColors.backgroundDark,
      body: Center(
        child: Image.asset(
          IconsAsset.logoLoading,
          height: 120,
        ),
      ),
    );
  }
}
