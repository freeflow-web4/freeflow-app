import 'dart:async';
import 'package:chewie/chewie.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:get_it/get_it.dart';

SplashController findSplashController() => GetIt.I.get<SplashController>();

class SplashController {
  late Timer periodic;

  void nextPage() {
    Routes.instance.goToLoginPageRoute();
  }

  void startPeriodicVideoEndCheck(ChewieController? chewieController) async {
    await Future.delayed(const Duration(seconds: 2));
    periodic = Timer.periodic(const Duration(milliseconds: 300), (_) {
      final isPlaying = chewieController?.isPlaying ?? true;
      if (isPlaying == false) {
        periodic.cancel();
        nextPage();
      }
    });
  }
}
