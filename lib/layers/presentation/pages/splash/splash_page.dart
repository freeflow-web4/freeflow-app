import 'package:flutter/material.dart';
import 'package:freeflow/layers/presentation/pages/splash/controller/splash_controller.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  final splashController = findSplashController();

  late final AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    splashController.startCounter();
    _animationController = AnimationController(vsync: this);
    // _animationController.addStatusListener(splashController.onAnimationStatusChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.red,
        child: Center(child: Text('Splash Animation here'),), 
        // Lottie.asset('assets/animations/seed-app-video.json',
        //     controller: _animationController),
      ),
    );
  }
}
