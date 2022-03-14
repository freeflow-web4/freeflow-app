import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/recover_account_page_animation.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/recover_confirm_pin_code_view.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/recover_username_view.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/recover_private_key_view.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/recover_pin_code_view.dart';
import 'package:freeflow/layers/presentation/widgets/animated_dot_indicator_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/staggered_widgets.dart';
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => recoverAccountController.onWillPop(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: StandardColors.backgroundDark,
          body: LayoutBuilder(builder: (context, constraints) {
            return Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Observer(
                  builder: (context) {
                    return Column(
                      children: [
                        recoverAccountController.currentIndex == 0
                            ? RecoverUsernameView(
                                key: const Key('1'),
                                onInputChanged: _onInputChanged,
                                textEditingController: flowerNameController,
                                recoverAccountController:
                                    recoverAccountController,
                              )
                            : recoverAccountController.currentIndex == 1
                                ? RecoverPrivateKeyView(
                                    key: const Key('2'),
                                    onInputChanged: _onInputChanged,
                                    textEditingController: privateKeyController,
                                    recoverAccountController:
                                        recoverAccountController,
                                  )
                                : recoverAccountController.currentIndex == 2
                                    ? RecoverPinCodeView(
                                        key: const Key('3'),
                                        onInputChanged: _onInputChanged,
                                        textEditingController: pinController,
                                        recoverAccountController:
                                            recoverAccountController,
                                      )
                                    : RecoverConfirmPinCodeView(
                                        key: const Key('4'),
                                        onInputChanged: _onInputChanged,
                                        textEditingController:
                                            confirmPinController,
                                        recoverAccountController:
                                            recoverAccountController,
                                      ),
                        const SizedBox(height: xxlargeSpacing),
                        Visibility(
                          visible: recoverAccountController.currentIndex < 2,
                          child: StaggerOpacity(
                            opacity: animation.dotOpacity,
                            controller: animationController,
                            child: AnimatedDotIndicatorWidget(
                              currentIndex:
                                  recoverAccountController.currentIndex,
                            ),
                          ),
                        ),
                        const Spacer(),
                        StaggerOpacity(
                          opacity: animation.buttonOpacity,
                          controller: animationController,
                          child: StaggerScale(
                            height: animation.buttonHeight,
                            width: animation.buttonWidth,
                            controller: animationController,
                            child: AnimatedFloatButtonWidget(
                              isActive: recoverAccountController
                                  .isContinueButtonActive(),
                              onTap: () =>
                                  recoverAccountController.tapContinueButton(
                                context,
                                privateKey: privateKeyController.text,
                                username: flowerNameController.text,
                                pincode: pinController.text,
                                confirmPincode: confirmPinController.text,
                              ),
                              icon: IconsAsset.arrowIcon,
                            ),
                          ),
                        ),
                        const SizedBox(height: bigSpacing),
                      ],
                    );
                  },
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
