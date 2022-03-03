import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/widgets/views/recover_account_view_animation.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/stagger_opacity.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/stagger_position.dart';

class RecoverAccountFirstView extends StatefulWidget {
  final RecoverAccountController recoverAccountController;
  final TextEditingController textEditingController;

  const RecoverAccountFirstView({
    Key? key,
    required this.recoverAccountController,
    required this.textEditingController,
  }) : super(key: key);

  @override
  _RecoverAccountFirstViewState createState() =>
      _RecoverAccountFirstViewState();
}

class _RecoverAccountFirstViewState extends State<RecoverAccountFirstView>
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
      vsync: this,
    );
    recoverAccountViewAnimation =
        RecoverAccountViewAnimation(animationController);
    animationController.forward().orCancel;
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
                  color: Colors.white,
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
                  color: Colors.white,
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
                  showSecondText: true,
                  onChanged: (value) => widget.recoverAccountController
                      .onChangedField(username: value),
                  hintText: FlutterI18n.translate(
                      context, "recoverAccount.flowerName"),
                  errorText: widget.recoverAccountController.privateKeyError,
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
