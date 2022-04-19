import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/auth/widgets/black_page_widget.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/email/create_wallet_email_animations.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/email/create_wallet_email_controller.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/widgets/create_wallet_page_indicator_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_text.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';

class CreateWalletFlowerNameView extends StatefulWidget {
  final bool animatedOnStart;
  final void Function() onValid;
  const CreateWalletFlowerNameView({
    Key? key,
    required this.animatedOnStart,
    required this.onValid,
  }) : super(key: key);

  @override
  State<CreateWalletFlowerNameView> createState() =>
      _CreateWalletFlowerNameViewState();
}

class _CreateWalletFlowerNameViewState extends State<CreateWalletFlowerNameView>
    with TickerProviderStateMixin, TextThemes {
  static const _totalDuration = Duration(milliseconds: 3600);

  late final animationController =
      AnimationController(vsync: this, duration: _totalDuration);

  final pageController = CreateWalletEmailController();

  late final animations = CreateWalletEmailAnimations(animationController);

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
                    text: TranslationService.translate(
                      context,
                      "createWallet.flowerNameTitle1",
                    ),
                    animationController: animationController,
                    style:
                        textH4TextStyle.copyWith(color: StandardColors.white),
                    animation: animations.title1Opacity,
                  ),
                  const SizedBox(
                    height: mdSpacingx2,
                  ),
                  Opacity(
                    //TODO: add opacity from animations class
                    opacity: animationController.value,
                    child: Observer(
                      builder: (context) {
                        return GradientTextFieldWidget(
                          errorText: pageController.privateKeyFieldState !=
                                  GradientTextFieldState.invalid
                              ? null
                              : TranslationService.translate(
                                  context,
                                  'createWallet.flowerNameTextFieldError',
                                ),
                          hintText: TranslationService.translate(
                            context,
                            'createWallet.flowerNameTextFieldHint',
                          ),
                          onChanged: pageController.onNameChanged,
                          isFieldValid: pageController.isEmailValid,
                          sufixWidget: (color) => textSubtitle3(
                            context,
                            textKey: '.flw',
                            color: color,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: xxlargeSpacing,
                  ),
                  CreateWalletPageIndicator(
                    currentIndex: 2,
                    onAnimationEnd: () {
                      animationController.forward();
                    },
                    animatedOnStart: widget.animatedOnStart,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.only(
                        bottom: bigSpacing,
                      ),
                      child: Opacity(
                        opacity: animations.confirmButtonAnimationOpacity.value,
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
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void onValid() async {
    await animationController.animateTo(
      0,
      duration: Duration(milliseconds: _totalDuration.inMilliseconds ~/ 2),
    );
    widget.onValid();
    animationController.reset();
  }

  void onInvalid() {
    //TODO: show blured dialog with error message
  }
}
