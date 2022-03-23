import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/recover_account_page_animation.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/recover_confirm_pin_code_view.dart';
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
  Timer? _debounce;
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

  _onInputChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      recoverAccountController.onChangedField(context, value);
    });
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        recoverAccountController.backPage();
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
                if (recoverAccountController.isValidating) {
                  FocusScope.of(context).requestFocus(FocusNode());
                }
                return SwipePageView(
                  children: [
                    RecoverUsernameView(
                      textEditingController: flowerNameController,
                      recoverAccountController: recoverAccountController,
                    ),
                    RecoverPrivateKeyView(
                      onInputChanged: _onInputChanged,
                      textEditingController: privateKeyController,
                      recoverAccountController: recoverAccountController,
                    ),
                    RecoverPinCodeView(
                      onInputChanged: _onInputChanged,
                      textEditingController: pinController,
                      recoverAccountController: recoverAccountController,
                    ),
                    RecoverConfirmPinCodeView(
                      onInputChanged: _onInputChanged,
                      textEditingController: confirmPinController,
                      recoverAccountController: recoverAccountController,
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

 // Column(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     Visibility(
                    //       visible: recoverAccountController.currentIndex < 2,
                    //       child: StaggerOpacity(
                    //         opacity: animation.dotOpacity,
                    //         controller: animationController,
                    //         child: AnimatedDotIndicatorWidget(
                    //           currentIndex:
                    //               recoverAccountController.currentIndex,
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(height: 120),
                    //     Observer(
                    //       builder: (context) => LoadingWidget(
                    //         isLoading: true,
                    //       ),
                    //     ),
                    //     SizedBox(height: 117),
                    //     Padding(
                    //       padding: const EdgeInsets.only(bottom: bigSpacing),
                    //       child: AnimatedOpacity(
                    //         duration: const Duration(milliseconds: 1200),
                    //         opacity: isContinueButtonVisible ? 1 : 0,
                    //         child: StaggerOpacity(
                    //           opacity: animation.buttonOpacity,
                    //           controller: animationController,
                    //           child: StaggerScale(
                    //             height: animation.buttonHeight,
                    //             width: animation.buttonWidth,
                    //             controller: animationController,
                    //             child: AnimatedFloatButtonWidget(
                    //               isActive: recoverAccountController
                    //                   .isContinueButtonActive(),
                    //               onTapInative: () {},
                    //               onTap: () {
                    //                 currentPage = 1;

                    //                 setState(() {});
                    //                 if (recoverAccountController
                    //                     .isContinueButtonActive()) {
                    //                   isContinueButtonVisible = false;
                    //                   Timer.periodic(const Duration(seconds: 8),
                    //                       (timer) {
                    //                     isContinueButtonVisible = true;
                    //                     setState(() {});
                    //                     timer.cancel();
                    //                   });
                    //                 }

                    //                 recoverAccountController.tapContinueButton(
                    //                   context,
                    //                   privateKey: privateKeyController.text,
                    //                   username: flowerNameController.text,
                    //                   pincode: pinController.text,
                    //                   confirmPincode: confirmPinController.text,
                    //                 );
                    //               },
                    //               icon: IconsAsset.arrowIcon,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
