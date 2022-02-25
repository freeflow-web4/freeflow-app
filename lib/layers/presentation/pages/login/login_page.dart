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

class _LoginPageState extends State<LoginPage> with TextThemes {
  final loginController = findLoginController();

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
            Image.asset('assets/images/logo.png'),
            const AdaptativeSpacer(
              heightValue: 171,
            ),
            textH5(
              context,
              text: 'Grab your\nFreeFlow Pouch',
              color: Colors.white,
              textAlign: TextAlign.center,
            ),
            const AdaptativeSpacer(
              heightValue: 8,
            ),
            SwipeButton(
              onSwipe: () {},
              text: "LET'S GO!",
            ),
            const AdaptativeSpacer(
              heightValue: 171,
            ),
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
          ],
        ),
      ),
    );
  }
}
