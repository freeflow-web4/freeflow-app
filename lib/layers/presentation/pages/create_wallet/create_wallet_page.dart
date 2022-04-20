import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/controller/create_wallet_controller.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/email_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/flower_name_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/name_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/pin_code_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/email/create_wallet_email_page.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/flowerName/create_wallet_flower_name_page.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/name/create_wallet_name_page.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/pinCode/choose/create_wallet_pin_code_page.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/pinCode/confirm/create_wallet_confirm_pin_code_page.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/private_key/confirm_key/create_wallet_private_key_confirm_state.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/private_key/show_key/create_wallet_private_key_show_state_page.dart';
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

  int currentIndex = 0;

  int lastIndex = 0;

  bool get shouldAnimateStart => currentIndex >= lastIndex;

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
              animatedOnStart: currentIndex == 0 && shouldAnimateStart,
              onValid: onNamePageValid,
              key: const ValueKey('CreateWalletControllerNameKey'),
            ),
            CreateWalletEmailView(
              animatedOnStart: currentIndex == 1 && shouldAnimateStart,
              onValid: onEmailPageValid,
              key: const ValueKey('CreateWalletControllerEmailKey'),
            ),
            CreateWalletFlowerNameView(
              animatedOnStart: currentIndex == 2 && shouldAnimateStart,
              onValid: onFlowerNamePageValid,
              key: const ValueKey('CreateWalletControllerFlowerNameKey'),
            ),
            CreateWalletPrivateKeyShowView(
              onValid: onShowPrivateKeyPageValid,
              animateOnStart: currentIndex == 3 && shouldAnimateStart,
              key: const ValueKey('CreateWalletControllerViewPrivateKeyKey'),
            ),
            CreateWalletPrivateKeyConfirmView(
              correctPrivateKey:
                  'love spirit earth play share abundance life geometry sacred ancient egypt rio',
              onValid: onConfirmPrivateKeyPageValid,
              animateOnStart: currentIndex == 4 && shouldAnimateStart,
              key: const ValueKey('CreateWalletControllerConfirmPrivateKeyKey'),
            ),
            CreateWalletPinCodeView(
              animatedOnStart: currentIndex == 5 && shouldAnimateStart,
              onValid: onPincodePageValid,
              key: const ValueKey('CreateWalletControllerPinCodeKey'),
            ),
            CreateWalletConfirmPinCodeView(
              animatedOnStart: currentIndex == 6 && shouldAnimateStart,
              onValid: onConfirmPincodePageValid,
              key: const ValueKey('CreateWalletControllerConfirmPinCodeKey'),
            ),
          ],
          initialIndex: currentIndex,
          onPageSwiped: onSwiped,
        ),
      ],
    );
  }

  void onNamePageValid(NameFormEntity nameFormModel) {
    pageController.setName(nameFormModel);
    setState(() {
      currentIndex = 1;
      lastIndex = 0;
    });
  }

  void onEmailPageValid(EmailFormEntity emailFormModel) {
    pageController.setEmail(emailFormModel);
    setState(() {
      currentIndex = 2;
      lastIndex = 1;
    });
  }

  void onFlowerNamePageValid(FlowerNameFormEntity flowerNameFormModel) {
    pageController.setFlowerName(flowerNameFormModel);
    setState(() {
      currentIndex = 3;
      lastIndex = 2;
    });
  }

  void onShowPrivateKeyPageValid(String privateKey) {
    pageController.setPrivateKey(privateKey);
    setState(() {
      currentIndex = 4;
      lastIndex = 3;
    });
  }

  void onConfirmPrivateKeyPageValid() {
    setState(() {
      currentIndex = 5;
      lastIndex = 4;
    });
  }

  void onPincodePageValid(PinCodeFormModel pinCodeFormModel) {
    pageController.setPinCode(pinCodeFormModel);
    setState(() {
      currentIndex = 6;
      lastIndex = 5;
    });
  }

  void onConfirmPincodePageValid() {
    //TODO: navigate to home
  }

  void onSwiped(int index) {
    setState(() {
      lastIndex = index + 1;
      currentIndex = index;
    });
  }
}
