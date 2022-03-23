import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/helpers/show_fullscreen_dialog.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/username_view/recover_username_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/username_view/recover_username_view_animation.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/stagger_opacity.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../core/utils/assets_constants.dart';
import '../../../../../widgets/animated_dot_indicator_widget.dart';
import '../../../../../widgets/animated_float_button_widget.dart';
import '../../../../../widgets/loading_widget.dart';

class RecoverUsernameView extends StatefulWidget {
  final RecoverAccountController recoverAccountController;
  final TextEditingController textEditingController;

  const RecoverUsernameView({
    Key? key,
    required this.recoverAccountController,
    required this.textEditingController,
  }) : super(key: key);

  @override
  _RecoverUsernameViewState createState() => _RecoverUsernameViewState();
}

class _RecoverUsernameViewState extends State<RecoverUsernameView>
    with TextThemes, TickerProviderStateMixin {
  Timer? _debounce;
  late RecoverUsernameAnimation animation;
  late AnimationController animationController;
  late AnimationController animationDotsController;
  final FocusNode inputNode = FocusNode();
  final viewController = GetIt.I.get<RecoverUsernameController>();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    animationDotsController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    animation = RecoverUsernameAnimation(
      animationController,
      animationDotsController,
    );
    animationDotsController.forward();
    animationController.forward();
    widget.recoverAccountController.openKeyboard(context, inputNode: inputNode);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _onInputChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      viewController.onUsernameChanged(
        value,
        () => showConnectionErrorDialog(context),
        () => FocusScope.of(context).requestFocus(FocusNode()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
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
                StaggerOpacity(
                  opacity: animation.firstTextOpacity,
                  controller: animationController,
                  child: textH4(
                    context,
                    textKey: "recoverAccount.hello",
                    color: StandardColors.white,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(height: mdSpacingx2),
                StaggerOpacity(
                  opacity: animation.secondTextOpacity,
                  controller: animationController,
                  child: textH4(
                    context,
                    textKey: "recoverAccount.enterFlowerName",
                    color: StandardColors.white,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(height: mdSpacingx2),
                // StaggerPosition(
                //   horizontalOffset: animation.textFieldHorizontalPosition,
                //   controller: animationController,
                //   child: GradientTextFieldWidget(
                //     inputNode: inputNode,
                //     isFieldValid: viewController.usernameFieldState !=
                //         UsernameFieldState.invalid,
                //     showSecondText: true,
                //     onChanged: _onInputChanged,
                //     hintText: FlutterI18n.translate(
                //       context,
                //       "recoverAccount.flowerName",
                //     ),
                //     errorText: viewController.usernameFieldState ==
                //             UsernameFieldState.empty
                //         ? FlutterI18n.translate(
                //             context,
                //             "recoverAccount.pleaseEnterUsername",
                //           )
                //         : viewController.usernameFieldState ==
                //                 UsernameFieldState.invalid
                //             ? FlutterI18n.translate(
                //                 context,
                //                 "recoverAccount.usernameIsNotValid",
                //               )
                //             : null,
                //     textController: widget.textEditingController,
                //   ),
                // ),
                const SizedBox(height: mdSpacing),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StaggerOpacity(
                        opacity: animation.dotsOpacity,
                        controller: animationDotsController,
                        child: const AnimatedDotIndicatorWidget(
                          currentIndex: 0,
                        ),
                      ),
                      Observer(
                        builder: (context) => LoadingWidget(
                          isLoading: viewController.isValidating,
                        ),
                      ),
                      StaggerOpacity(
                        opacity: animation.buttonOpacity,
                        controller: animationController,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: bigSpacing),
                          child: AnimatedFloatButtonWidget(
                            // isActive: viewController.isNameValid,
                            isActive: true,
                            icon: IconsAsset.arrowIcon,
                            onTap: () => goToNextPage(),
                            onTapInative: () => showCustomDialog(
                              context,
                              textKey:
                                  'recoverAccount.pleaseEnterYourRegisteredName',
                            ),
                          ),
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
    );
  }

  void goToNextPage() async {
    animationController.animateBack(0, duration: const Duration(seconds: 5));
    Future.delayed(const Duration(seconds: 5)).then(
      (_) {
        widget.recoverAccountController.setCurrentPage(2);
        animationController.forward();
        animationDotsController.forward();
      },
    );
  }
}
