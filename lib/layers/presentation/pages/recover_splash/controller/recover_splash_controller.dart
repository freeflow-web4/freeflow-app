import 'dart:async';
import 'package:chewie/chewie.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:get_it/get_it.dart';

RecoverSplashController findSplashController() =>
    GetIt.I.get<RecoverSplashController>();

class RecoverSplashController {
  late Timer periodic;

  void nextPage() {
    //TODO REMOVER
    Routes.instance.goToLoginPageRoute();
    //Routes.instance.goToEditProfilePageRoute();

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
