import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/email/create_wallet_email_page.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/flowerName/create_wallet_flower_name_page.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/name/create_wallet_name_page.dart';
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

  int currentIndex = 0;

  bool isIndicatorAnimationDone = false;

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
              privateKey: 'love spirit earth play share abundance life geometry sacred ancient egypt rio',
            ),
          ],
          initialIndex: currentIndex,
          onPageSwiped: onSwiped,
        ),
        Positioned.fill(
          child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top:450),
            child: AnimatedDotIndicatorWidget(
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
