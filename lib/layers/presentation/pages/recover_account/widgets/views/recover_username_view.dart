import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/recover_account_view_animation.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/stagger_opacity.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/stagger_position.dart';

class RecoverUsernameView extends StatefulWidget {
  final RecoverAccountController recoverAccountController;
  final TextEditingController textEditingController;
  final void Function(String)? onInputChanged;

  const RecoverUsernameView({
    Key? key,
    required this.recoverAccountController,
    required this.textEditingController,
    required this.onInputChanged,
  }) : super(key: key);

  @override
  _RecoverUsernameViewState createState() => _RecoverUsernameViewState();
}

class _RecoverUsernameViewState extends State<RecoverUsernameView>
    with TextThemes, TickerProviderStateMixin {
  late RecoverAccountViewAnimation recoverAccountViewAnimation;
  late AnimationController animationController;
  final FocusNode inputNode = FocusNode();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(
        seconds: widget.recoverAccountController.animationDuration,
      ),
      reverseDuration: const Duration(
        seconds: 5,
      ),
      vsync: this,
    );
    recoverAccountViewAnimation =
        RecoverAccountViewAnimation(animationController);
    animationController.forward();
    widget.recoverAccountController.openKeyboard(context, inputNode: inputNode);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (widget.recoverAccountController.isAnimatingExitFirstView) {
          animationController.reverse();
        }
        if (widget.recoverAccountController.isAnimatingExistFirstViewEnd) {
          animationController.forward();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 104),
              StaggerOpacity(
                opacity: recoverAccountViewAnimation.firstTextOpacity,
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
                opacity: recoverAccountViewAnimation.secondTextOpacity,
                controller: animationController,
                child: textH4(
                  context,
                  textKey: "recoverAccount.enterFlowerName",
                  color: StandardColors.white,
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: mdSpacingx2),
              StaggerPosition(
                opacity: recoverAccountViewAnimation.textFieldOpacity,
                horizontalOffset:
                    recoverAccountViewAnimation.textFieldHorizontalPosition,
                controller: animationController,
                child: GradientTextFieldWidget(
                  inputNode: inputNode,
                  isFieldValid: widget.recoverAccountController.isNameValid,
                  showSecondText: true,
                  onChanged: widget.onInputChanged,
                  hintText: FlutterI18n.translate(
                      context, "recoverAccount.flowerName"),
                  errorText: widget.recoverAccountController.usernameError,
                  textController: widget.textEditingController,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
