import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/recover_account_page_animation.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/recover_account_first_view.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/recover_account_second_view.dart';
import 'package:freeflow/layers/presentation/widgets/animated_dot_indicator_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/staggered_widgets.dart';
import 'package:get_it/get_it.dart';

class RecoverAccountPage extends StatefulWidget with TextThemes {
  const RecoverAccountPage({Key? key}) : super(key: key);

  @override
  State<RecoverAccountPage> createState() => _RecoverAccountPageState();
}

class _RecoverAccountPageState extends State<RecoverAccountPage>
    with TickerProviderStateMixin {
  final recoverAccountController = GetIt.I.get<RecoverAccountController>();
  final privateKeyController = TextEditingController();
  final flowerNameController = TextEditingController();
  late RecoverAccountPageAnimation animation;
  late AnimationController animationController = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    animation = RecoverAccountPageAnimation(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => recoverAccountController.onWillPop(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: StandardColors.backgroundDark,
          body: LayoutBuilder(builder: (context, constraints) {
            return Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Observer(
                  builder: (context) {
                    return Column(
                      children: [
                        recoverAccountController.currentIndex == 0
                            ? RecoverAccountFirstView(
                                key: const Key('1'),
                                textEditingController: flowerNameController,
                                recoverAccountController:
                                    recoverAccountController,
                              )
                            : recoverAccountController.currentIndex == 1
                                ? RecoverAccountSecondView(
                                    key: const Key('2'),
                                    textEditingController: privateKeyController,
                                    recoverAccountController:
                                        recoverAccountController,
                                  )
                                : RecoverAccountFirstView(
                                    key: const Key('3'),
                                    textEditingController: privateKeyController,
                                    recoverAccountController:
                                        recoverAccountController,
                                  ),
                        const SizedBox(height: xxlargeSpacing),
                        StaggerOpacity(
                          opacity: animation.dotOpacity,
                          controller: animationController,
                          child: AnimatedDotIndicatorWidget(
                            currentIndex: recoverAccountController.currentIndex,
                          ),
                        ),
                        const Spacer(),
                        StaggerOpacity(
                          opacity: animation.buttonOpacity,
                          controller: animationController,
                          child: StaggerScale(
                            height: animation.buttonHeight,
                            width: animation.buttonWidth,
                            controller: animationController,
                            child: AnimatedFloatButtonWidget(
                              isActive: recoverAccountController
                                  .isContinueButtonActive,
                              onTap: () =>
                                  recoverAccountController.tapContinueButton(
                                context,
                                privateKey: privateKeyController.text,
                                username: flowerNameController.text,
                              ),
                              icon: IconsAsset.arrowIcon,
                            ),
                          ),
                        ),
                        const SizedBox(height: bigSpacing),
                      ],
                    );
                  },
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
