import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

class GradientTextFieldWidget extends StatefulWidget {
  final bool showTextField;
  final String? errorText;
  final String hintText;
  final TextEditingController textController;
  final bool showSecondText;
  const GradientTextFieldWidget({
    Key? key,
    required this.showTextField,
    required this.errorText,
    required this.hintText,
    required this.textController,
    this.showSecondText = false,
  }) : super(key: key);

  @override
  State<GradientTextFieldWidget> createState() =>
      _GradientTextFieldWidgetState();
}

class _GradientTextFieldWidgetState extends State<GradientTextFieldWidget>
    with TextThemes, SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;
  FocusNode inputNode = FocusNode();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    offset = Tween<Offset>(
      begin: const Offset(-10.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(controller);

    Timer.periodic(const Duration(seconds: 8), (timer) {
      FocusScope.of(context).requestFocus(inputNode);
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (widget.showTextField) {
        controller.forward();
      }
      return SizedBox(
        height: 70,
        child: Stack(
          children: <Widget>[
            TextFormField(
              controller: widget.textController,
              focusNode: inputNode,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: widget.errorText == null
                      ? Colors.white
                      : StandardColors.feedbackError,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Akrobat',
                ),
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
            Positioned(
              top: 40,
              child: Container(
                height: 2,
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                  gradient: widget.errorText == null
                      ? StandardColors.greenGradient()
                      : StandardColors.redGradient(),
                ),
              ),
            ),
            Visibility(
              visible: widget.errorText != null,
              child: Positioned(
                bottom: 10,
                child: textCaption(
                  context,
                  text: widget.errorText ?? '',
                  color: widget.errorText == null
                      ? Colors.white
                      : StandardColors.feedbackError,
                ),
              ),
            ),
            Visibility(
              visible: widget.showSecondText,
              child: Positioned(
                top: 13,
                right: 0,
                child: textBoldSubtitle(
                  context,
                  text: '.flw ',
                  color: widget.errorText == null
                      ? Colors.white
                      : StandardColors.feedbackError,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
