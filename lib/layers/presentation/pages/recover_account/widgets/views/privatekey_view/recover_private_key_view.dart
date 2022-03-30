import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/helpers/get_cross_max_lines.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/privatekey_view/recover_private_key_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/privatekey_view/recover_privatekey_animation.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/username_view/recover_username_controller.dart';
import 'package:freeflow/layers/presentation/widgets/animated_dot_indicator/animated_dot_indicator_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_text.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/loading_widget.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/staggered_widgets.dart';
import 'package:freeflow/layers/presentation/helpers/show_fullscreen_dialog.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../core/utils/assets_constants.dart';

class RecoverPrivateKeyView extends StatefulWidget {
  final RecoverAccountController recoverAccountController;
  final TextEditingController textEditingController;
  final bool isBackingPage;

  const RecoverPrivateKeyView({
    Key? key,
    required this.recoverAccountController,
    required this.textEditingController,
    required this.isBackingPage,
  }) : super(key: key);

  @override
  _RecoverPrivateKeyViewState createState() => _RecoverPrivateKeyViewState();
}

class _RecoverPrivateKeyViewState extends State<RecoverPrivateKeyView>
    with TextThemes, TickerProviderStateMixin {
  late RecoverPrivateKeyAnimation animation;
  late final AnimationController animationController;
  late AnimationController animationButtonController;
  Timer? _debounce;
  final FocusNode inputNode = FocusNode();
  final viewController = GetIt.I.get<RecoverPrivateKeyController>();
  final usernameController = GetIt.I.get<RecoverUsernameController>();
  bool isLargeButton = true;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: widget.isBackingPage ? 0 : 7),
      vsync: this,
    );
    animationButtonController = AnimationController(
      duration: Duration(seconds: widget.isBackingPage ? 0 : 7),
      vsync: this,
    );

    animation = RecoverPrivateKeyAnimation(
      animationController,
      animationButtonController,
    );
    animationController.forward().orCancel;
    animationButtonController.forward().orCancel;

    widget.recoverAccountController.openKeyboard(
      context,
      inputNode: inputNode,
      duration: 5,
    );

    Future.delayed(const Duration(seconds: 1), () {
      currentIndex = 1;
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _onInputChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      viewController.onPrivateKeyChanged(
        value,
        usernameController.currentUsername,
        () => FocusScope.of(context).requestFocus(FocusNode()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Observer(
        builder: (context) {
          return Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: mdSpacingx2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: huge4Spacing),
                  AnimatedText(
                    text: TranslationService.translate(
                      context,
                      "recoverAccount.enterPrivateKey",
                    ),
                    animationController: animationController,
                    style: textH4TextStyle.copyWith(
                      color: StandardColors.white,
                    ),
                    animation: animation.firstTextOpacity,
                  ),
                  const SizedBox(height: mdSpacingx2),
                  StaggerPosition(
                    controller: animationController,
                    horizontalOffset: animation.textFieldHorizontalPosition,
                    child: GradientTextFieldWidget(
                      inputNode: inputNode,
                      onChanged: _onInputChanged,
                      isFieldValid: viewController.isPrivateKeyValid,
                      hintText: FlutterI18n.translate(
                        context,
                        "recoverAccount.privateKey",
                      ),
                      errorText: viewController.privateKeyFieldState ==
                              PrivateKeyFieldState.invalid
                          ? FlutterI18n.translate(
                              context,
                              "recoverAccount.pleaseEnterPrivateKey",
                            )
                          : null,
                      textController: widget.textEditingController,
                      maxLines: 2,
                      crossTheMaxLines: getIfTextCrossMaxLines(
                        context,
                        text: widget.textEditingController.text,
                        maxLines: 1,
                        maxWidth: MediaQuery.of(context).size.width - 120,
                      ),
                    ),
                  ),
                  const SizedBox(height: huge4Spacing + 7),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedDotIndicatorWidget(
                            currentIndex: currentIndex,
                            length: 3,
                            totalAnimationStartUpDuration: Duration(seconds: 4),
                            animatedOnStart: false,
                          ),
                          Observer(
                            builder: (context) => LoadingWidget(
                              isLoading: viewController.isValidating,
                            ),
                          ),
                          StaggerScale(
                            controller: animationController,
                            height: animation.buttonHeight,
                            width: animation.buttonWidth,
                            child: StaggerOpacity(
                              opacity: animation.buttonOpacity,
                              controller: animationController,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(bottom: bigSpacing),
                                child: AnimatedFloatButtonWidget(
                                  isActive: viewController.isPrivateKeyValid,
                                  isLargeButton:
                                      viewController.isPrivateKeyValid &&
                                          isLargeButton,
                                  onTapInative: () => showCustomDialog(
                                    context,
                                    textKey:
                                        'recoverAccount.pleaseEnterYourPrivateKey',
                                  ),
                                  onTap: () => goToNextPage(),
                                  icon: IconsAsset.arrowIcon,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void goToNextPage() async {
    isLargeButton = false;
    setState(() {});
    Future.delayed(const Duration(seconds: 1)).then((value) {
      animationController.animateBack(0, duration: const Duration(seconds: 5));
      Future.delayed(const Duration(seconds: 5), () {
        currentIndex = 2;
        setState(() {});
      });
      Future.delayed(const Duration(milliseconds: 6300)).then(
        (_) {
          widget.recoverAccountController.setCurrentPage(2);
          animationController.forward();
        },
      );
    });
  }
}
