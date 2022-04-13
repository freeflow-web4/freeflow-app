import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/auth/widgets/black_page_widget.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/private_key/show_key/create_wallet_private_key_show_state_controller.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/private_key/show_key/create_wallet_private_key_show_state_animations.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_text.dart';
import 'package:freeflow/layers/presentation/widgets/widget_size.dart';

class CreateWalletPrivateKeyShowView extends StatefulWidget {
  final String privateKey;
  final void Function() onConfirm;
  final bool animateOnStart;
  const CreateWalletPrivateKeyShowView({
    Key? key,
    required this.privateKey,
    required this.onConfirm,
    required this.animateOnStart,
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
                    Visibility(
                      visible: animations.title2Opacity.value > 0,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(bottom: mdSpacingx2),
                        child: Opacity(
                          //TODO: add opacity from animations class
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
                    ),
                    Visibility(
                      visible: animations.title3Opacity.value > 0,
                      child: Container(
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
                    ),
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
                    opacity: animations.confirmButtonAnimationOpacity.value,
                    child: Observer(
                      builder: (context) {
                        return AnimatedFloatButtonWidget(
                          isActive: pageController.buttonNextActivated,
                          onTap: (activate) {
                            if (activate) {
                              widget.onConfirm();
                            }
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
}
