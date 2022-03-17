import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_pin_code.dart';

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
    return Builder(
      builder: (context) {
        return SizedBox(
          height: 80,
          child: Stack(
            children: <Widget>[
              widget.isObscureText == true
                  ? SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top:13.0),
                      child: GradientTextFieldPinCode(
                        pinCode: widget.pinCode ?? '',
                        color: widget.errorText?.isNotEmpty == true
                            ? StandardColors.error
                            : null,
                      ),
                    ),
                  )
                  : TextFormField(
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
                      maxLines: widget.maxLines,
                    ),
              Positioned(
                top: widget.crossTheMaxLines ? 60 : 40,
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
              Positioned(
                top: widget.crossTheMaxLines ? 60 : 40,
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
                  bottom: widget.maxLines == 2 ? -2 : 10,
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
                visible: widget.isPinInput,
                child: widget.isObscureText ?? false
                    ? widget.pinCode != null && widget.pinCode!.isNotEmpty
                        ? Positioned(
                            top: 20,
                            child: GradientTextFieldPinCode(
                              pinCode: widget.pinCode!,
                            ),
                          )
                        : Positioned(
                            top: 13,
                            child: textSubtitle(
                              context,
                              textKey: widget.hintText,
                              color: widget.errorText == null
                                  ? Colors.white
                                  : StandardColors.feedbackError,
                            ),
                          )
                    : Positioned(
                        top: 13,
                        child: textSubtitle(
                          context,
                          textKey: widget.pinCode ?? '',
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
                    textKey: '.flw ',
                    color: widget.errorText == null
                        ? widget.isFieldValid
                            ? StandardColors.blueLight
                            : Colors.white
                        : StandardColors.feedbackError,
                  ),
                ),
              ),
              Visibility(
                visible: widget.showObscureButton,
                child: Positioned(
                  right: 0,
                  top: 12,
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
            ],
          ),
        );
      },
    );
  }
}
