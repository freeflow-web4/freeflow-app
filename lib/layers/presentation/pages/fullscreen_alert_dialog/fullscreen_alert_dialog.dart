import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/fullscreen_alert_dialog/controller/fullscreen_alert_dialog_controller.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';

class FullScreenAlertDialog extends StatefulWidget {
  final String textKey;

  const FullScreenAlertDialog({Key? key, required this.textKey})
      : super(key: key);

  @override
  State<FullScreenAlertDialog> createState() => _FullScreenAlertDialogState();
}

class _FullScreenAlertDialogState extends State<FullScreenAlertDialog>
    with TextThemes {
  final fullscreenAlertDialogController = FullscreenAlertDialogController();
  @override
  void initState() {
    super.initState();
    fullscreenAlertDialogController.updateWidgetAnimations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButton: Observer(
        builder: (context) {
          return AnimatedFloatButtonWidget(
            isActive: true,
            isLargeAnimation:
                fullscreenAlertDialogController.isCloseButtonAnimating,
            showButton: fullscreenAlertDialogController.showCloseButton,
            onTap: () => fullscreenAlertDialogController.closeDialog(context),
            icon: IconsAsset.closeBackIcon,
          );
        },
      ),
    );
  }
}
