import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/auth/widgets/black_page_widget.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/flower_name_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/flowerName/create_wallet_flower_name_animations.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/flowerName/create_wallet_flower_name_controller.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/widgets/create_wallet_page_indicator_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_text.dart';
import 'package:freeflow/layers/presentation/widgets/flexible_vertical_spacer.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';

class CreateWalletFlowerNameView extends StatefulWidget {
  final bool animatedOnStart;
  final void Function(FlowerNameFormEntity) onValid;
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

  final pageController = CreateWalletFlowerNameController();

  late final animations = CreateWalletFlowerNameAnimations(animationController);

  @override
  void initState() {
    super.initState();
    if (!widget.animatedOnStart) {
      animationController.animateTo(1, duration: Duration.zero);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlackScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: mdSpacingx2,
            right: mdSpacingx2,
          ),
          child: AnimatedBuilder(
            animation: animationController,
            builder: (context, _) {
              return Column(
                children: [
                  const FlexibleVerticalSpacer(height: huge4Spacing,),
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
                  const FlexibleVerticalSpacer(
                    height: mdSpacingx2,
                  ),
                  Opacity(
                    opacity: animations.field1Opacity.value,
                    child: Observer(
                      builder: (context) {
                        return GradientTextFieldWidget(
                          errorText: pageController.gradientTextFieldState !=
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
                          onChanged: pageController.onFlowerNameChanged,
                          isFieldValid: pageController.isGradientTextFieldValid,
                          sufixWidget: (color) => textSubtitle3(
                            context,
                            textKey: '.flw',
                            color: color,
                          ),
                        );
                      },
                    ),
                  ),
                  const FlexibleVerticalSpacer(
                    height: xxlargeSpacing,
                  ),
                  CreateWalletPageIndicator(
                    currentIndex: 2,
                    onAnimationEnd: () {
                      animationController.forward();
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

  void onValid(FlowerNameFormEntity flowerNameFormModel) async {
    await animationController.animateTo(
      0,
      duration: Duration(milliseconds: _totalDuration.inMilliseconds ~/ 2),
    );
    widget.onValid(flowerNameFormModel);
    animationController.animateTo(
      1,
      duration: Duration.zero,
    );
  }

  void onInvalid() {
    //TODO: show blured dialog with error message
  }
}
