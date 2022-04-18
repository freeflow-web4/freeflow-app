import 'package:flutter/animation.dart';

class GeneralPageAnimation {
  final Animation<double> loadingAnimation;

  GeneralPageAnimation(AnimationController controller)
      : loadingAnimation = Tween(begin: 0.0, end: 1.0).animate(controller);
}
