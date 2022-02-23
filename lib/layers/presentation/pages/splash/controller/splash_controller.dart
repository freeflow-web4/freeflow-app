import 'package:flutter/material.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:get_it/get_it.dart';

SplashController findSplashController() => GetIt.I.get<SplashController>();

class SplashController {
  void startCounter() {
    Future.delayed(const Duration(seconds: 3), () {
      Routes.instance.goToLoginPageRoute();
    });
  }

  void goToNextPage() {}

  void onAnimationStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      goToNextPage();
    }
  }
}
