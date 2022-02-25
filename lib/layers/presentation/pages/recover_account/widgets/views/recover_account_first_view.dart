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
  final bool showfirstViewTextFieldOpacity;
  final RecoverAccountController recoverAccountController;
  final TextEditingController textEditingController;

  const RecoverAccountFirstView({
    Key? key,
    required this.showfirstViewTextFieldOpacity,
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
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    recoverAccountViewAnimation = RecoverAccountViewAnimation(_controller);
    _controller.forward().orCancel;
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
                controller: _controller,
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
                controller: _controller,
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
                controller: _controller,
                child: GradientTextFieldWidget(
                  hintText: FlutterI18n.translate(
                      context, "recoverAccount.flowerName"),
                  showTextField: widget.showfirstViewTextFieldOpacity,
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
