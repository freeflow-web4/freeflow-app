import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/adaptative_size.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/login/controller/login_controller.dart';
import 'package:freeflow/layers/presentation/widgets/adaptative_spacer_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_multi_text.dart';
import 'package:freeflow/layers/presentation/widgets/secondary_button.dart';
import 'package:freeflow/layers/presentation/widgets/swipe_button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with TickerProviderStateMixin, TextThemes {
  static const int _animationDurationInMili = 6000;
  static const stepItensLength = 4;
  static const stepStartOffSetTimeFactor = 0.1;
  static const stepEndOffSetTimeFactor = 0.1;
  static const step =
      (1 - (stepStartOffSetTimeFactor + stepEndOffSetTimeFactor)) /
          stepItensLength;

  final loginController = findLoginController();

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: _animationDurationInMili),
    vsync: this,
  );
  late Animation<double> opacityLogo;
  late Animation<double> blurText1;
  late Animation<double> opacitySwipeButton;
  late Animation<double> opacityRecoverButton;

  bool animationDone = false;

  bool _swipeEnabled = false;

  @override
  void initState() {
    super.initState();

    opacityLogo = getTweenAnimationWithFactor(0);
    blurText1 = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          stepStartOffSetTimeFactor+step,
          1-stepEndOffSetTimeFactor,
          curve: Curves.ease,
        ),
      ),
    );
    opacitySwipeButton = getTweenAnimationWithFactor(2);
    opacityRecoverButton = getTweenAnimationWithFactor(3);
    _controller.forward().orCancel;
    _controller.addStatusListener(onAnimationChanged);
  }

  void onSwipe() {
    setState(() {
      _swipeEnabled = true;
    });
    _controller
        .animateBack(
          0,
          duration: const Duration(milliseconds: _animationDurationInMili ~/ 3),
        )
        .orCancel
        .then((value) => loginController.onSwipe());
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.removeStatusListener(onAnimationChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StandardColors.backgroundDark,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionalHeightFromValue(context, 88),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AdaptativeSpacer(
              heightValue: 129,
            ),
            opacityAnimation(
              opacityLogo,
              Image.asset('assets/images/logo.png'),
            ),
            const AdaptativeSpacer(
              heightValue: 171,
            ),
            AnimatedMultiText(
              text: 'Grab your\nFreeFlow Pouch',
              animationController: _controller,
              animation: blurText1,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w400,
                fontFamily: 'Akrobat',
              ),
            ),
            const AdaptativeSpacer(
              heightValue: 8,
            ),
            opacityAnimation(
              opacitySwipeButton,
              SwipeButton(
                onSwipe: onSwipe,
                text: "LET'S GO!",
                startAnimation: animationDone,
                movementEnable: _swipeEnabled,
              ),
            ),
            const AdaptativeSpacer(
              heightValue: 171,
            ),
            opacityAnimation(
              // const ValueKey('recoverButton'),
              opacityRecoverButton,
              SecondaryButton(
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Recover Account',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {},
                padding: const EdgeInsets.symmetric(
                  vertical: smSpacing,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onAnimationChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      setState(() {
        animationDone = true;
      });
    }
  }

  Animation<double> getTweenAnimationWithFactor(int index) {
    final start = getStartTimeForIndex(index);
    final end = getEndTimeForIndex(index);
    return getTweenAnimation(start, end);
  }

  double getStartTimeForIndex(int index) {
    return stepStartOffSetTimeFactor + step * index;
  }

  double getEndTimeForIndex(int index) {
    final start = stepStartOffSetTimeFactor + step * index;
    final end = start + step;
    return end;
  }

  Animation<double> getTweenAnimation(double start, double end) {
    return Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          start,
          end,
          curve: Curves.ease,
        ),
      ),
    );
  }

  Widget opacityAnimation(
    Animation<double> animaton,
    Widget child,
  ) {
    return AnimatedBuilder(
      animation: _controller,
      child: child,
      builder: (context, _child) => _builder(context, animaton, child),
    );
  }

  Widget _builder(
    BuildContext context,
    Animation<double> animation,
    Widget? child,
  ) {
    return Opacity(
      opacity: animation.value,
      child: child,
    );
  }
}
