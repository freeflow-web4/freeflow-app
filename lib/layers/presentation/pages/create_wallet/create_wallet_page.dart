import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/controller/create_wallet_controller.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/email/create_wallet_email_page.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/flowerName/create_wallet_flower_name_page.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/name/create_wallet_name_page.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/pinCode/create_wallet_pin_code_page.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/private_key/create_wallet_private_key_view.dart';
import 'package:freeflow/layers/presentation/widgets/animated_dot_indicator/animated_dot_indicator_widget.dart';
import 'package:freeflow/layers/presentation/widgets/swipe_page_view.dart';

class CreateWalletPage extends StatefulWidget {
  const CreateWalletPage({Key? key}) : super(key: key);

  @override
  State<CreateWalletPage> createState() => _CreateWalletPageState();
}

class _CreateWalletPageState extends State<CreateWalletPage>
    with TickerProviderStateMixin, TextThemes {
  @override
  void initState() {
    super.initState();
  }

  final pageController = CreateWalletController();

  int currentIndex = 4;

  bool isIndicatorAnimationDone = false;

  //TODO: analyze if it has been used
  double get indicatorPadding {
    final height = MediaQuery.of(context).size.height;
    final halfHeight = (height / 2);
    return pageController.pageIndicatorHeight > halfHeight
        ? pageController.pageIndicatorHeight
        : halfHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SwipePageView(
          children: [
            CreateWalletNameView(
              isCurrent: currentIndex == 0 && isIndicatorAnimationDone,
              onValid: onNamePageValid,
            ),
            CreateWalletEmailView(
              isCurrent: currentIndex == 1 && isIndicatorAnimationDone,
              onValid: onEmailPageValid,
            ),
            CreateWalletFlowerNameView(
              isCurrent: currentIndex == 2 && isIndicatorAnimationDone,
              onValid: onFlowerNamePageValid,
            ),
            CreateWalletPrivateKeyView(
              isCurrent: currentIndex == 3 && isIndicatorAnimationDone,
              onValid: onPrivateKeyPageValid,
              //TODO: pass from controller
              privateKey:
                  'love spirit earth play share abundance life geometry sacred ancient egypt rio',
            ),
            CreateWalletPinCodeView(
              isCurrent: currentIndex == 4 && isIndicatorAnimationDone,
              onValid: onPrivateKeyPageValid,
            ),
          ],
          initialIndex: currentIndex,
          onPageSwiped: onSwiped,
        ),
        Positioned.fill(
          child: Observer(
            builder: (context) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: indicatorPadding),
                child:
                    // Text((pageController.pageIndicatorHeight ~/1).toString())
                    AnimatedDotIndicatorWidget(
                  key: const ValueKey('createWalletIndicatorKey'),
                  currentIndex: currentIndex,
                  length: 5,
                  totalAnimationStartUpDuration: const Duration(
                    seconds: 4,
                  ),
                  onAnimationEnd: () {
                    setState(() {
                      isIndicatorAnimationDone = true;
                    });
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }

  void onNamePageValid() {
    setState(() {
      currentIndex = 1;
      isIndicatorAnimationDone = false;
    });
  }

  void onEmailPageValid() {
    setState(() {
      currentIndex = 2;
      isIndicatorAnimationDone = false;
    });
  }

  void onFlowerNamePageValid() {
    setState(() {
      currentIndex = 3;
      isIndicatorAnimationDone = false;
    });
  }

  void onPrivateKeyPageValid() {
    setState(() {
      currentIndex = 4;
      isIndicatorAnimationDone = false;
    });
  }

  void onSwiped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
