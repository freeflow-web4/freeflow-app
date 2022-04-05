import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/recover_account_page_animation.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/confirm_pin_code_view/recover_confirm_pin_code_view.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/username_view/recover_username_view.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/privatekey_view/recover_private_key_view.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/pin_code_view/recover_pin_code_view.dart';
import 'package:freeflow/layers/presentation/widgets/swipe_page_view.dart';
import 'package:get_it/get_it.dart';

class RecoverAccountPage extends StatefulWidget {
  const RecoverAccountPage({Key? key}) : super(key: key);

  @override
  State<RecoverAccountPage> createState() => _RecoverAccountPageState();
}

class _RecoverAccountPageState extends State<RecoverAccountPage>
    with TickerProviderStateMixin {
  final recoverAccountController = GetIt.I.get<RecoverAccountController>();
  final privateKeyController = TextEditingController();
  final flowerNameController = TextEditingController();
  final pinController = TextEditingController();
  final confirmPinController = TextEditingController();
  late RecoverAccountPageAnimation animation;
  bool isContinueButtonVisible = true;
  late AnimationController animationController = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    animation = RecoverAccountPageAnimation(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await recoverAccountController.backPage();
        return false;
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: StandardColors.backgroundDark,
          body: Container(
            constraints: const BoxConstraints(maxWidth: 720),
            alignment: Alignment.center,
            child: Observer(
              builder: (context) {
                return SwipePageView(
                  children: [
                    RecoverUsernameView(
                      textEditingController: flowerNameController,
                      recoverAccountController: recoverAccountController,
                    ),
                    RecoverPrivateKeyView(
                      textEditingController: privateKeyController,
                      recoverAccountController: recoverAccountController,
                      isBackingPage: recoverAccountController.isBacking,
                    ),
                    RecoverPinCodeView(
                      textEditingController: pinController,
                      recoverAccountController: recoverAccountController,
                      isBackingPage: recoverAccountController.isBacking,
                    ),
                    RecoverConfirmPinCodeView(
                      textEditingController: confirmPinController,
                    ),
                  ],
                  initialIndex: recoverAccountController.currentPage,
                  onPageSwiped: recoverAccountController.setCurrentPage,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
