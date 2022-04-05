import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/helpers/show_fullscreen_dialog.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/username_view/recover_username_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/username_view/recover_username_animation.dart';
import 'package:freeflow/layers/presentation/widgets/animated_dot_indicator/animated_dot_indicator_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_text.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/staggered_widgets.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../core/utils/assets_constants.dart';
import '../../../../../widgets/animated_float_button_widget.dart';
import '../../../../../widgets/loading_widget.dart';

class RecoverUsernameView extends StatefulWidget {
  final RecoverAccountController recoverAccountController;
  final TextEditingController textEditingController;

  const RecoverUsernameView({
    Key? key,
    required this.recoverAccountController,
    required this.textEditingController,
  }) : super(key: key);

  @override
  _RecoverUsernameViewState createState() => _RecoverUsernameViewState();
}

class _RecoverUsernameViewState extends State<RecoverUsernameView>
    with TextThemes, TickerProviderStateMixin {
  Timer? _debounce;
  late RecoverUsernameAnimation animation;
  late AnimationController animationController;
  late AnimationController animationButtonController;
  late AnimationController animationDotsController;
  final FocusNode inputNode = FocusNode();
  final viewController = GetIt.I.get<RecoverUsernameController>();
  late final animatedTextController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  );
  bool isLargeButton = true;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    animationDotsController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    animationButtonController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );

    animation = RecoverUsernameAnimation(
      animationController,
      animationDotsController,
      animationButtonController,
    );
    animationDotsController.forward();
    animationButtonController.forward();
    animatedTextController.forward();
    animationController.forward();
    widget.recoverAccountController.openKeyboard(context, inputNode: inputNode);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _onInputChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      viewController.onUsernameChanged(
        value,
        () => showConnectionErrorDialog(context),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: huge4Spacing),
                  AnimatedText(
                    text: TranslationService.translate(
                      context,
                      "recoverAccount.hello",
                    ),
                    animationController: animationController,
                    style: textH4TextStyle.copyWith(
                      color: StandardColors.white,
                    ),
                    animation: animation.firstTextOpacity,
                  ),
                  const SizedBox(height: mdSpacingx2),
                  AnimatedText(
                    text: TranslationService.translate(
                      context,
                      "recoverAccount.enterFlowerName",
                    ),
                    animationController: animationController,
                    style: textH4TextStyle.copyWith(
                      color: StandardColors.white,
                    ),
                    animation: animation.secondTextOpacity,
                  ),
                  const SizedBox(height: mdSpacingx2),
                  StaggerPosition(
                    horizontalOffset: animation.textFieldHorizontalPosition,
                    controller: animationController,
                    child: GradientTextFieldWidget(
                      inputNode: inputNode,
                      isFieldValid: viewController.usernameFieldState !=
                          UsernameFieldState.invalid,
                      showSecondText: true,
                      sufixWidget: (color) => textSubtitle3(
                        context,
                        textKey: '.flw',
                        color: viewController.usernameFieldState ==
                                UsernameFieldState.valid
                            ? StandardColors.blueLight
                            : viewController.usernameFieldState ==
                                    UsernameFieldState.invalid
                                ? StandardColors.error
                                : StandardColors.white,
                      ),
                      onChanged: _onInputChanged,
                      hintText: FlutterI18n.translate(
                        context,
                        "recoverAccount.flowerName",
                      ),
                      errorText: viewController.usernameFieldState ==
                              UsernameFieldState.empty
                          ? FlutterI18n.translate(
                              context,
                              "recoverAccount.pleaseEnterPrivateKey",
                            )
                          : viewController.usernameFieldState ==
                                  UsernameFieldState.invalid
                              ? FlutterI18n.translate(
                                  context,
                                  "recoverAccount.usernameIsNotValid",
                                )
                              : null,
                      textController: widget.textEditingController,
                    ),
                  ),
                  const SizedBox(height: mdSpacing),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StaggerOpacity(
                          opacity: animation.dotsOpacity,
                          controller: animationDotsController,
                          child: const AnimatedDotIndicatorWidget(
                            currentIndex: 0,
                            length: 3,
                            totalAnimationStartUpDuration: Duration(seconds: 4),
                          ),
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
                                isActive: viewController.isNameValid,
                                isLargeButton:
                                    viewController.isNameValid && isLargeButton,
                                icon: IconsAsset.arrowIcon,
                                onTap: () => goToNextPage(),
                                onTapInative: () => showCustomDialog(
                                  context,
                                  textKey:
                                      'recoverAccount.pleaseEnterYourRegisteredName',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
      Future.delayed(const Duration(seconds: 4)).then(
        (_) {
          widget.recoverAccountController.setCurrentPage(1);
          animationController.forward();
          animationDotsController.forward();
        },
      );
    });
  }
}
