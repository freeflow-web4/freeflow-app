import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/welcome/welcome_page_animation.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/staggered_widgets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TextThemes, TickerProviderStateMixin {
  late WelcomePageAnimation animation;
  late AnimationController animationController = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    animation = WelcomePageAnimation(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StandardColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StaggerOpacity(
              opacity: animation.firstTextOpacity,
              controller: animationController,
              child: textH4(
                context,
                textKey: 'welcome.welcomeBack',
                textAlign: TextAlign.center,
              ),
            ),
            StaggerOpacity(
              opacity: animation.secondTextOpacity,
              controller: animationController,
              child: textH4(
                context,
                textKey: 'welcome.toFreeflow',
                textAlign: TextAlign.center,
                color: StandardColors.blueLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
