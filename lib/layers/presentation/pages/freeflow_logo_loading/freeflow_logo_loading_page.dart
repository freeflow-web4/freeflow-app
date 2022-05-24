import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

class FreeflowLogoLoadingPage extends StatefulWidget {
  final void Function() onLoadingCompleted;
  const FreeflowLogoLoadingPage({
    @PathParam('onLoadingCompleted') required this.onLoadingCompleted,
    Key? key,
  }) : super(key: key);

  @override
  State<FreeflowLogoLoadingPage> createState() =>
      _FreeflowLogoLoadingPageState();
}

class _FreeflowLogoLoadingPageState extends State<FreeflowLogoLoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        widget.onLoadingCompleted();
      }
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
