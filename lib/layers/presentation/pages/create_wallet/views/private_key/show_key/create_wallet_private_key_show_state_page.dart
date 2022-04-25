import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/auth/widgets/black_page_widget.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/private_key_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/private_key/show_key/create_wallet_private_key_show_state_controller.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/private_key/show_key/create_wallet_private_key_show_state_animations.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/widgets/create_wallet_page_indicator_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_text.dart';

class CreateWalletPrivateKeyShowView extends StatefulWidget {
  final void Function(PrivateKeyFormModel) onValid;
  final bool animateOnStart;
  final String privateKey;

  const CreateWalletPrivateKeyShowView({
    Key? key,
    required this.onValid,
    required this.animateOnStart,
    required this.privateKey,
  }) : super(key: key);

  @override
  State<CreateWalletPrivateKeyShowView> createState() =>
      _CreateWalletPrivateKeyShowViewState();
}

class _CreateWalletPrivateKeyShowViewState
    extends State<CreateWalletPrivateKeyShowView>
    with TickerProviderStateMixin, TextThemes {
  static const _totalDuration = Duration(milliseconds: 3600);

  late final animationController =
      AnimationController(vsync: this, duration: _totalDuration);

  final pageController = CreateWalletPrivateKeyShowStateController();

  late final animations =
      CreateWalletPrivateKeyShowStateAnimations(animationController);

  @override
  void initState() {
    super.initState();
    if (widget.animateOnStart) {
      animationController.forward();
    } else {
      animationController.value = 1.0;
    }
    //TODO: get private key
    Future.delayed(const Duration(milliseconds: 1000)).then(
      (value) => pageController.setButtonEnabled(),
    );
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
                  right: 3 * mdSpacingx2,
                  top: huge4Spacing,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedText(
                      text: TranslationService.translate(
                        context,
                        "createWallet.privateKeyTitle1",
                      ),
                      animationController: animationController,
                      style: textH4TextStyle.copyWith(
                        color: StandardColors.white,
                      ),
                      animation: animations.title1Opacity,
                    ),
                    const SizedBox(
                      height: mdSpacingx2,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(bottom: mdSpacingx2),
                      child: Opacity(
                        opacity: animations.title2Opacity.value,
                        child: RichText(
                          text: TextSpan(
                            style: subtitleTextStyle,
                            children: [
                              TextSpan(
                                text: TranslationService.translate(
                                  context,
                                  'createWallet.privateKeyTitle2',
                                ),
                                style: subtitleTextStyle.copyWith(
                                  color: StandardColors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: TranslationService.translate(
                                  context,
                                  'createWallet.privateKeyTitle3',
                                ),
                                style: subtitleTextStyle.copyWith(
                                  color: StandardColors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(bottom: mdSpacingx2),
                      child: Opacity(
                        //TODO: add opacity from animations class
                        opacity: animations.title3Opacity.value,
                        child: Text(
                          widget.privateKey,
                          style: subtitleTextStyle.copyWith(
                            color: StandardColors.secondary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: mdSpacingx2,
              ),
              CreateWalletPageIndicator(
                currentIndex: 3,
                onAnimationEnd: () {
                  animationController.forward();
                },
                animatedOnStart: widget.animateOnStart,
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
                            if (activate) {
                              onValid();
                            }
                          },
                          icon: IconsAsset.arrowIcon,
                          isLargeButton: pageController.buttonNextActivated,
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

  void onValid() async {
    await animationController.animateTo(
      0,
      duration: Duration(milliseconds: _totalDuration.inMilliseconds ~/ 2),
    );
    widget.onValid(
      PrivateKeyFormModel(
        privateKey: widget.privateKey,
      ),
    );
    animationController.animateTo(
      1,
      duration: Duration.zero,
    );
  }
}
