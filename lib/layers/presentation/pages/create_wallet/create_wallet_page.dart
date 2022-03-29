import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/auth/widgets/black_page_widget.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/create_wallet_controller.dart';
import 'package:freeflow/layers/presentation/widgets/animated_dot_indicator/animated_dot_indicator_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_text.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
part 'create_wallet_animations.dart';

class CreateWalletPage extends StatefulWidget {
  const CreateWalletPage({Key? key}) : super(key: key);

  @override
  State<CreateWalletPage> createState() => _CreateWalletPageState();
}

class _CreateWalletPageState extends State<CreateWalletPage>
    with TickerProviderStateMixin, TextThemes {
  static const _totalDuration = Duration(milliseconds: 3600);

  late final animationController =
      AnimationController(vsync: this, duration: _totalDuration);

  int currentIndex = 0;

  late final animations = CreateWalletPageAnimations(animationController);

  final pageController = CreateWalletController();

  @override
  void initState() {
    super.initState();
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BlackScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            bottom: 8.0,
          ),
          child: AnimatedBuilder(
            animation: animationController,
            builder: (context, _) {
              return Column(
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
                    height: 20,
                  ),
                  Opacity(
                    //TODO: add opacity from class
                    opacity: animationController.value,
                    child: GradientTextFieldWidget(
                      errorText: null,
                      hintText: "hintText",
                      onChanged: (text) {
                        //TODO: add onChanged
                      },
                      //TODO: call controller here
                      isFieldValid: pageController.isGradientTextFieldValid,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AnimatedDotIndicatorWidget(
                    currentIndex: currentIndex,
                    length: 4,
                    totalAnimationStartUpDuration: const Duration(
                      seconds: 4,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Observer(
                        builder: (context) {
                          return AnimatedFloatButtonWidget(
                            isActive: pageController.buttonNextActivated,
                            onTap: (activate) {
                              //TODO: add onTap from controller
                            },
                            icon: IconsAsset.arrowIcon,
                          );
                        },
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
}
