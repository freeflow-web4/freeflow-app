import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/helpers/get_cross_max_lines.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/privatekey_view/recover_privatekey_animation.dart';
import 'package:freeflow/layers/presentation/widgets/animated_dot_indicator/animated_dot_indicator_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_text.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/loading_widget.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/stagger_opacity.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/staggered_widgets.dart';

import '../../../../../../../core/utils/assets_constants.dart';

class RecoverPrivateKeyView extends StatefulWidget {
  final RecoverAccountController recoverAccountController;
  final TextEditingController textEditingController;

  const RecoverPrivateKeyView({
    Key? key,
    required this.recoverAccountController,
    required this.textEditingController,
  }) : super(key: key);

  @override
  _RecoverPrivateKeyViewState createState() => _RecoverPrivateKeyViewState();
}

class _RecoverPrivateKeyViewState extends State<RecoverPrivateKeyView>
    with TextThemes, TickerProviderStateMixin {
  late RecoverPrivateKeyAnimation animation;
  late final AnimationController animationController;
  final FocusNode inputNode = FocusNode();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    animation = RecoverPrivateKeyAnimation(animationController);
    animationController.forward().orCancel;

    widget.recoverAccountController.openKeyboard(
      context,
      inputNode: inputNode,
      duration: 5,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
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
                    animation: animation.secondTextOpacity,
                  ),
                  const SizedBox(height: mdSpacingx2),
                  GradientTextFieldWidget(
                    inputNode: inputNode,
                    onChanged: (value) {},
                    isFieldValid: true,
                    hintText: FlutterI18n.translate(
                      context,
                      "recoverAccount.privateKey",
                    ),
                    errorText: '',
                    textController: widget.textEditingController,
                    maxLines: 2,
                    crossTheMaxLines: getIfTextCrossMaxLines(
                      context,
                      text: widget.textEditingController.text,
                      maxLines: 1,
                      maxWidth: MediaQuery.of(context).size.width - 120,
                    ),
                  ),
                  const SizedBox(height: mdSpacing),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AnimatedDotIndicatorWidget(
                          currentIndex: 1,
                          length: 3,
                          totalAnimationStartUpDuration: Duration(seconds: 4),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: bigSpacing),
                          child: AnimatedFloatButtonWidget(
                            isActive: true,
                            onTapInative: () {},
                            onTap: () {
                              widget.recoverAccountController.setCurrentPage(2);
                              // currentPage = 1;

                              // setState(() {});
                              // if (recoverAccountController
                              //     .isContinueButtonActive()) {
                              //   isContinueButtonVisible = false;
                              //   Timer.periodic(const Duration(seconds: 8),
                              //       (timer) {
                              //     isContinueButtonVisible = true;
                              //     setState(() {});
                              //     timer.cancel();
                              //   });
                              // }

                              // recoverAccountController.tapContinueButton(
                              //   context,
                              //   privateKey: privateKeyController.text,
                              //   username: flowerNameController.text,
                              //   pincode: pinController.text,
                              //   confirmPincode: confirmPinController.text,
                              // );
                            },
                            icon: IconsAsset.arrowIcon,
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
}
