import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/fullscreen_alert_dialog/controller/fullscreen_alert_dialog_controller.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_text.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/stagger_opacity.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/stagger_scale.dart';

import 'fullscreen_alert_dialog_animation.dart';

enum SecondaryTextPosition { top, bottom }

class FullScreenAlertDialog extends StatefulWidget {
  final String? textKey;
  final String? text;
  final String? icon;
  final String? secondaryTextKey;
  final String? secondaryText;
  final Widget? body;
  final SecondaryTextPosition secondaryTextPosition;

  const FullScreenAlertDialog({
    Key? key,
    this.textKey,
    this.text,
    this.icon,
    this.secondaryTextKey,
    this.secondaryText,
    this.body,
    this.secondaryTextPosition = SecondaryTextPosition.bottom,
  }) : super(key: key);

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
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: closeDialog,
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
            child: StaggerOpacity(
              opacity: animation.textOpacity,
              controller: animationController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: widget.secondaryTextKey != null &&
                        widget.secondaryTextPosition ==
                            SecondaryTextPosition.top,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: huge4Spacing,
                        left: mdSpacingx2,
                        right: mdSpacingx2,
                      ),
                      child: AnimatedText(
                        text: TranslationService.translate(
                          context,
                          widget.secondaryTextKey ?? '',
                        ),
                        animation: animation.textOpacity,
                        animationController: animationController,
                        style: textH6TextStyle.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: widget.secondaryTextPosition ==
                              SecondaryTextPosition.bottom
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: widget.secondaryTextPosition ==
                              SecondaryTextPosition.top,
                          child: const SizedBox(
                            height: 160,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: widget.icon != null ? 100 : 32,
                          ),
                          child: widget.body ??
                              AnimatedText(
                                text: widget.text ??
                                    TranslationService.translate(
                                      context,
                                      widget.textKey ?? '',
                                    ),
                                textMainAxisAlignment: MainAxisAlignment.center,
                                animationController: animationController,
                                style: textH4TextStyle.copyWith(
                                  color: StandardColors.white,
                                ),
                                animation: animation.textOpacity,
                              ),
                        ),
                        Visibility(
                          visible: widget.icon != null,
                          child: const SizedBox(height: 89),
                        ),
                        Visibility(
                          visible: widget.icon != null,
                          child: SvgPicture.asset(
                            widget.icon ?? '',
                            height: 122,
                            width: 167,
                          ),
                        ),
                        Visibility(
                          visible: (widget.secondaryTextKey != null ||
                                  widget.secondaryText != null) &&
                              widget.secondaryTextPosition ==
                                  SecondaryTextPosition.bottom,
                          child: const SizedBox(height: 89),
                        ),
                        Visibility(
                          visible: (widget.secondaryTextKey != null ||
                                  widget.secondaryText != null) &&
                              widget.secondaryTextPosition ==
                                  SecondaryTextPosition.bottom,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: normalSpacing,
                            ),
                            child: AnimatedText(
                              text: widget.secondaryText ??
                                  TranslationService.translate(
                                    context,
                                    widget.secondaryTextKey ?? '',
                                  ),
                              textMainAxisAlignment: MainAxisAlignment.center,
                              animationController: animationController,
                              style: textH6TextStyle.copyWith(
                                color: StandardColors.white,
                              ),
                              animation: animation.textOpacity,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: StaggerOpacity(
          controller: animationController,
          opacity: animation.buttonOpacity,
          child: StaggerScale(
            controller: animationController,
            height: animation.buttonHeight,
            width: animation.buttonWidth,
            child: Padding(
              padding: const EdgeInsets.only(bottom: normalSpacing),
              child: AnimatedFloatButtonWidget(
                onTap: (activated) {
                  if (activated) {
                    fullscreenAlertDialogController.closeDialog();
                  }
                },
                icon: IconsAsset.closeBackIcon,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void closeDialog() {
    if (animationController.isAnimating) return;
    fullscreenAlertDialogController.closeDialog();
  }
}
