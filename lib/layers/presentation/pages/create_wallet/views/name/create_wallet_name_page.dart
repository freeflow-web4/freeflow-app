import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/helpers/show_fullscreen_dialog.dart';
import 'package:freeflow/layers/presentation/pages/auth/widgets/black_page_widget.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/name_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/name/create_wallet_name_controller.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/widgets/create_wallet_page_indicator_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_text.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
part './create_wallet_animations.dart';

class CreateWalletNameView extends StatefulWidget {
  final bool animatedOnStart;
  final void Function(NameFormEntity nameFormModel) onValid;

  const CreateWalletNameView({
    Key? key,
    required this.animatedOnStart,
    required this.onValid,
  }) : super(key: key);

  @override
  State<CreateWalletNameView> createState() => _CreateWalletNameViewState();
}

class _CreateWalletNameViewState extends State<CreateWalletNameView>
    with TickerProviderStateMixin, TextThemes {
  static const _totalDuration = Duration(milliseconds: 3600);

  late final animationController =
      AnimationController(vsync: this, duration: _totalDuration);

  late final animations = CreateWalletPageAnimations(animationController);

  final pageController = CreateWalletNameController();

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
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: mdSpacingx2,
                  right: mdSpacingx2,
                  top: huge4Spacing,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedText(
                      text: TranslationService.translate(
                        context,
                        "createWallet.nameTitle1",
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
                      opacity: animations.field1Opacity.value,
                      child: Observer(
                        builder: (context) {
                          return GradientTextFieldWidget(
                            errorText: pageController.nameFieldState !=
                                    GradientTextFieldState.invalid
                                ? null
                                : TranslationService.translate(
                                    context,
                                    'createWallet.nameTextFieldError',
                                  ),
                            hintText: TranslationService.translate(
                              context,
                              'createWallet.nameTextFieldHint',
                            ),
                            onChanged: pageController.onNameChanged,
                            isFieldValid:
                                pageController.isGradientTextFieldValid,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: xxlargeSpacing,
                    ),
                    CreateWalletPageIndicator(
                      currentIndex: 0,
                      onAnimationEnd: () {
                        animationController.forward();
                      },
                      animatedOnStart: widget.animatedOnStart,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(
                    bottom: bigSpacing,
                  ),
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
    );
  }

  void onValid(NameFormEntity nameFormModel) async {
    await animationController.animateTo(
      0,
      duration: Duration(milliseconds: _totalDuration.inMilliseconds ~/ 2),
    );
    widget.onValid(nameFormModel);
    animationController.animateTo(
      1,
      duration: Duration.zero,
    );
  }

  void onInvalid() {
    showCustomDialog(context, textKey: 'createWallet.nameWarning');
  }
}
