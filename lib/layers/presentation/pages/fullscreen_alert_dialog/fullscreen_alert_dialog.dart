import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/fullscreen_alert_dialog/controller/fullscreen_alert_dialog_controller.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/stagger_opacity.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/stagger_scale.dart';

import 'fullscreen_alert_dialog_animation.dart';

class FullScreenAlertDialog extends StatefulWidget {
  final String textKey;

  const FullScreenAlertDialog({Key? key, required this.textKey})
      : super(key: key);

  @override
  State<FullScreenAlertDialog> createState() => _FullScreenAlertDialogState();
}

class _FullScreenAlertDialogState extends State<FullScreenAlertDialog>
    with TextThemes, TickerProviderStateMixin {
  final fullscreenAlertDialogController = FullscreenAlertDialogController();
  late FullscreenAlertDialogAnimation animation;
  late AnimationController animationController = AnimationController(
    duration: const Duration(seconds: 6),
    vsync: this,
  );
  @override
  void initState() {
    super.initState();
    animation = FullscreenAlertDialogAnimation(animationController);
    animationController.forward().orCancel;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => fullscreenAlertDialogController.closeDialog(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: StandardColors.blackGradient(),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 16,
              sigmaY: 16,
              tileMode: TileMode.clamp,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textH4(
                  context,
                  textKey: widget.textKey,
                  color: Colors.white,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: StaggerOpacity(
          controller: animationController,
          opacity: animation.buttonOpacity,
          child: StaggerScale(
            controller: animationController,
            height: animation.buttonHeight,
            width: animation.buttonWidth,
            child: Padding(
              padding: const EdgeInsets.only(bottom: bigSpacing),
              child: AnimatedFloatButtonWidget(
                onTap: () =>
                    fullscreenAlertDialogController.closeDialog(),
                icon: IconsAsset.closeBackIcon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
