import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/helpers/show_fullscreen_dialog.dart';
import 'package:freeflow/layers/presentation/pages/auth/widgets/black_page_widget.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/email_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/email/create_wallet_email_animations.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/email/create_wallet_email_controller.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/widgets/create_wallet_page_indicator_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_text.dart';
import 'package:freeflow/layers/presentation/widgets/flexible_vertical_spacer.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field/gradient_text_field_widget.dart';
import 'package:get_it/get_it.dart';

class CreateWalletEmailView extends StatefulWidget {
  final bool currentPage;

  final bool animatedOnStart;
  final String name;
  final void Function(EmailFormEntity email) onValid;
  const CreateWalletEmailView({
    Key? key,
    required this.currentPage,
    required this.name,
    required this.animatedOnStart,
    required this.onValid,
  }) : super(key: key);

  @override
  State<CreateWalletEmailView> createState() => _CreateWalletEmailViewState();
}

class _CreateWalletEmailViewState extends State<CreateWalletEmailView>
    with TickerProviderStateMixin, TextThemes {
  static const _totalDuration = Duration(milliseconds: 3600);

  late final animationController =
      AnimationController(vsync: this, duration: _totalDuration);

  late final animations = CreateWalletEmailAnimations(animationController);

  final pageController = GetIt.I.get<CreateWalletEmailController>();

  late FocusNode emailFieldFocusNode;

  @override
  void initState() {
    super.initState();
    emailFieldFocusNode = FocusNode();
    if (!widget.animatedOnStart) {
      animationController.animateTo(1, duration: Duration.zero);
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    emailFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlackScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: mdSpacingx2,
            right: mdSpacingx2,
            top: huge4Spacing,
          ),
          child: AnimatedBuilder(
            animation: animationController,
            builder: (context, _) {
              return Column(
                children: [
                  AnimatedText(
                    text: widget.name +
                        "\n" +
                        TranslationService.translate(
                          context,
                          "createWallet.emailTitle1",
                        ),
                    animationController: animationController,
                    style:
                        textH4TextStyle.copyWith(color: StandardColors.white),
                    animation: animations.title1Opacity,
                  ),
                  const FlexibleVerticalSpacer(
                    height: mdSpacingx2,
                  ),
                  Opacity(
                    opacity: animations.field1Opacity.value,
                    child: Observer(
                      builder: (context) {
                        return GradientTextFieldWidget(
                          errorText: pageController.privateKeyFieldState !=
                                  GradientTextFieldState.invalid
                              ? null
                              : TranslationService.translate(
                                  context,
                                  'createWallet.emailTextFieldError',
                                ),
                          hintText: TranslationService.translate(
                            context,
                            'createWallet.emailTextFieldHint',
                          ),
                          onChanged: pageController.onEmailChanged,
                          isFieldValid: pageController.isEmailValid,
                          inputNode: emailFieldFocusNode,
                        );
                      },
                    ),
                  ),
                  const FlexibleVerticalSpacer(
                    height: xxlargeSpacing,
                  ),
                  CreateWalletPageIndicator(
                    currentIndex: 1,
                    onAnimationEnd: () {
                      animationController.forward().orCancel.then(
                            (value) => requestFocus(),
                          );
                    },
                    animatedOnStart: widget.animatedOnStart,
                  ),
                  Flexible(
                    flex: 299,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Opacity(
                        opacity: animations.buttonOpacity.value,
                        child: Observer(
                          builder: (context) {
                            return AnimatedFloatButtonWidget(
                              isActive: pageController.buttonNextActivated,
                              onTap: (activate) {
                                pageController.onNextButtonPressed(
                                  onValid,
                                  onInvalid,
                                );
                              },
                              icon: IconsAsset.arrowIcon,
                              isLargeButton: pageController.buttonNextActivated,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const FlexibleVerticalSpacer(height: bigSpacing)
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void onValid(EmailFormEntity email) async {
    try {
      await animationController
          .animateTo(
            0,
            duration:
                Duration(milliseconds: _totalDuration.inMilliseconds ~/ 2),
          )
          .orCancel;
    } catch (_) {}
    widget.onValid(email);
    animationController.animateTo(
      1,
      duration: Duration.zero,
    );
  }

  void onInvalid() {
    showCustomDialog(context, textKey: 'createWallet.emailWarning');
  }

  void requestFocus() {
    if (!mounted || !widget.currentPage) {
      return;
    }
    emailFieldFocusNode.requestFocus();
  }

  void removeFocus() {
    if (!mounted || !widget.currentPage) {
      return;
    }
    emailFieldFocusNode.unfocus();
  }
}
