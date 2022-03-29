import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_pin_code.dart';

enum GradientTextFieldState { empty, valid, invalid, wrong }

class GradientTextFieldWidget extends StatefulWidget {
  final String? errorText;
  final String hintText;
  final TextEditingController? textController;
  final bool showSecondText;
  final void Function(String)? onChanged;
  final FocusNode? inputNode;
  final int maxLines;
  final bool crossTheMaxLines;
  final bool showObscureButton;
  final bool? isObscureText;
  final void Function()? onObscureButtonPressed;
  final bool fieldReadOnly;
  final bool isPinInput;
  final bool isFieldValid;
  final String? pinCode;
  final Color? obscureButtonColor;
  final Widget Function(Color)? sufixWidget;
  const GradientTextFieldWidget({
    Key? key,
    required this.errorText,
    required this.hintText,
    this.textController,
    this.inputNode,
    required this.onChanged,
    required this.isFieldValid,
    this.showSecondText = false,
    this.maxLines = 1,
    this.crossTheMaxLines = false,
    this.showObscureButton = false,
    this.isObscureText,
    this.onObscureButtonPressed,
    this.fieldReadOnly = false,
    this.isPinInput = false,
    this.pinCode,
    this.obscureButtonColor,
    this.sufixWidget,
  }) : super(key: key);

  @override
  State<GradientTextFieldWidget> createState() =>
      _GradientTextFieldWidgetState();
}

class _GradientTextFieldWidgetState extends State<GradientTextFieldWidget>
    with TextThemes, SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: <Widget>[
            widget.isObscureText == true
                ? SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 18,
                        //TODO: analyze these padding
                        bottom: 18,
                      ),
                      child: Container(
                        height: 12,
                        alignment: Alignment.centerLeft,
                        child: GradientTextFieldPinCode(
                          pinCode: widget.pinCode ?? '',
                          color: widget.errorText?.isNotEmpty == true
                              ? StandardColors.error
                              : null,
                        ),
                      ),
                    ),
                  )
                : TextFormField(
                    key: ValueKey(
                      'key_for_text_field${widget.pinCode}',
                    ),
                    initialValue: widget.pinCode,
                    onChanged: widget.onChanged,
                    controller: widget.textController,
                    readOnly: widget.fieldReadOnly,
                    focusNode: widget.inputNode,
                    style: TextStyle(
                      color: widget.errorText == null
                          ? widget.isFieldValid
                              ? StandardColors.blueLight
                              : Colors.white
                          : StandardColors.feedbackError,
                    ),
                    decoration: InputDecoration(
                      hintText: widget.isPinInput ? null : widget.hintText,
                      hintStyle: TextStyle(
                        color: widget.errorText == null
                            ? StandardColors.white
                            : StandardColors.feedbackError,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Akrobat',
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    maxLines: widget.maxLines,
                  ),
            Positioned(
              right: 0,
              top: 14,
              child: Visibility(
                visible: widget.showObscureButton,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: widget.onObscureButtonPressed,
                  child: Container(
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      widget.isObscureText == true
                          ? IconsAsset.closedEye
                          : IconsAsset.openEye,
                      width: 20,
                      color: widget.obscureButtonColor,
                    ),
                  ),
                ),
              ),
            ),
            if (widget.sufixWidget != null)
              Positioned(
                right: 0,
                top: 13,
                child: Visibility(
                  visible: widget.showSecondText,
                  child: widget.sufixWidget!(
                    widget.errorText == null
                        ? widget.isFieldValid
                            ? StandardColors.blueLight
                            : Colors.white
                        : StandardColors.feedbackError,
                  ),
                ),
              )
          ],
        ),
        Container(
          height: 2,
          padding: EdgeInsets.only(top: widget.crossTheMaxLines ? 20 : 0),
          width: MediaQuery.of(context).size.width - 20,
          decoration: BoxDecoration(
            gradient: widget.errorText == null
                ? StandardColors.greenGradient()
                : StandardColors.redGradient(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: miniSpacing,
            bottom: widget.maxLines == 2 ? 2 : 10,
          ),
          child: textCaption(
            context,
            text: widget.errorText ?? '',
            color: widget.errorText == null
                ? Colors.white
                : StandardColors.feedbackError,
          ),
        )
      ],
    );
  }
}
