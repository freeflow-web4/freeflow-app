import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/adaptative_size.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/login/controller/login_controller.dart';
import 'package:freeflow/layers/presentation/widgets/adaptative_spacer_widget.dart';
import 'package:freeflow/layers/presentation/widgets/secondary_button.dart';
import 'package:freeflow/layers/presentation/widgets/swipe_button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin, TextThemes {
  static const int _animationDurationInMili = 2000;

  final loginController = findLoginController();

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: _animationDurationInMili),
    vsync: this,
  );
  late Animation<double> opacityLogo;
  late Animation<double> opacityText1;
  late Animation<double> opacitySwipeButton;
  late Animation<double> opacityRecoverButton;

  @override
  void initState() {
    super.initState();

    opacityLogo = getTweenAnimation(0, 0.25);
    opacityText1 = getTweenAnimation(0.25, 0.5);
    opacitySwipeButton = getTweenAnimation(0.5, 0.75);
    opacityRecoverButton = getTweenAnimation(0.75, 1);
    _controller.forward().orCancel;
  }

  @override
  void dispose() {
    _controller.dispose();
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
            opacityAnimation(
              opacityText1,
              textH5(
                context,
                text: 'Grab your\nFreeFlow Pouch',
                color: Colors.white,
                textAlign: TextAlign.center,
              ),
            ),
            const AdaptativeSpacer(
              heightValue: 8,
            ),
            opacityAnimation(
              opacitySwipeButton,
              SwipeButton(
                onSwipe: () {
                  print("Heeeey!");
                },
                text: "LET'S GO!",
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
            TextButton(
              onPressed: foward,
              child: const Text(
                'Forward',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void foward() {
    if (_controller.status == AnimationStatus.dismissed) {
      _controller.forward();
    } else if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    }
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
      builder: (context, _child)=> _builder(context, animaton, child),
    );
  }

  Widget _builder(BuildContext context, Animation<double> animation, Widget? child) {
    return Opacity(
      opacity: animation.value,
      child: child,
    );
  }
}
