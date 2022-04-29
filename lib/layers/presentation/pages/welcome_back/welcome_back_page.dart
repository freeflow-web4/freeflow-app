import 'package:flutter/material.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/welcome_back/welcome_back_page_animation.dart';
import 'package:freeflow/layers/presentation/widgets/animated_text.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/staggered_widgets.dart';
import 'package:freeflow/routes/routes.dart';

class WelcomeBackPage extends StatefulWidget {
  const WelcomeBackPage({Key? key}) : super(key: key);

  @override
  State<WelcomeBackPage> createState() => _WelcomeBackPageState();
}

class _WelcomeBackPageState extends State<WelcomeBackPage>
    with TextThemes, TickerProviderStateMixin {
  late WelcomeBackPageAnimation animation;
  late AnimationController animationController = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    animation = WelcomeBackPageAnimation(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void goToInitialPage() {
    Future.delayed(const Duration(seconds: 6)).then((value) {
      animationController.reverse();
      Future.delayed(const Duration(seconds: 5)).then((value) {
        Routes.instance.goToSplashRecoverRoute(
          Routes.instance.goToHomePageRoute,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    goToInitialPage();
    return Scaffold(
      backgroundColor: StandardColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StaggerOpacity(
              opacity: animation.firstTextOpacity,
              controller: animationController,
              child: AnimatedText(
                text: TranslationService.translate(
                  context,
                  'welcome.welcomeBack',
                ),
                textMainAxisAlignment: MainAxisAlignment.center,
                animationController: animationController,
                style: textH4TextStyle.copyWith(
                  color: StandardColors.backgroundDark,
                ),
                animation: animation.firstTextOpacity,
              ),
            ),
            StaggerOpacity(
              opacity: animation.secondTextOpacity,
              controller: animationController,
              child: AnimatedText(
                text: TranslationService.translate(
                  context,
                  'welcome.toFreeflow',
                ),
                textMainAxisAlignment: MainAxisAlignment.center,
                animationController: animationController,
                style: textH4TextStyle.copyWith(
                  color: StandardColors.blueLight,
                ),
                animation: animation.secondTextOpacity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
