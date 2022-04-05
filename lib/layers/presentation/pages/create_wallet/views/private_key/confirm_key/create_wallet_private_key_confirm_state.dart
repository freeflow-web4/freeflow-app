import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/auth/widgets/black_page_widget.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/private_key/confirm_key/create_wallet_private_key_confirm_animations.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/private_key/confirm_key/create_wallet_private_key_confirm_controller.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_text.dart';

class CreateWalletPrivateKeyConfirmView extends StatefulWidget {
  final void Function() onValid;
  final String privateKey;
  const CreateWalletPrivateKeyConfirmView({
    Key? key,
    required this.onValid,
    required this.privateKey,
  }) : super(key: key);

  @override
  State<CreateWalletPrivateKeyConfirmView> createState() =>
      _CreateWalletPrivateKeyConfirmViewState();
}

class _CreateWalletPrivateKeyConfirmViewState extends State<CreateWalletPrivateKeyConfirmView>
    with TickerProviderStateMixin, TextThemes {
  static const _totalDuration = Duration(milliseconds: 3600);

  late final animationController =
      AnimationController(vsync: this, duration: _totalDuration);

  final pageController = CreateWalletPrivateKeyConfirmController();

  late final animations = CreateWalletPrivateKeyConfirmAnimations(animationController);

  @override
  Widget build(BuildContext context) {
    return BlackScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: mdSpacingx2,
            right: 3*mdSpacingx2,
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
                      "createWallet.privateKeyTitle1",
                    ),
                    animationController: animationController,
                    style:
                        textH4TextStyle.copyWith(color: StandardColors.white),
                    animation: animations.title1Opacity,
                  ),
                  const SizedBox(
                    height: mdSpacingx2,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Opacity(
                      //TODO: add opacity from animations class
                      opacity: animationController.value,
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
                  const SizedBox(
                    height: mdSpacingx2,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Opacity(
                      //TODO: add opacity from animations class
                      opacity: animationController.value,
                      child: Text(
                        widget.privateKey,
                        style: subtitleTextStyle.copyWith(
                          color: StandardColors.secondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
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
