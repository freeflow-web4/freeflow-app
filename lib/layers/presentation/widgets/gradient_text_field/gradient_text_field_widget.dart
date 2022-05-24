import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field/gradient_text_field_pin_code.dart';
import 'package:intl/intl.dart';

enum GradientTextFieldState { empty, valid, invalid, wrong }

class GradientTextFieldWidget extends StatefulWidget {
  final String? errorText;
  final String? hintText;
  final Color normalTextColor;
  final TextStyle? hintTextStyle;
  final TextEditingController? textController;
  final bool showSecondText;
  final void Function(String)? onChanged;
  final FocusNode? inputNode;
  final int maxLines;
  final bool showObscureButton;
  final bool? isObscureText;
  final void Function()? onObscureButtonPressed;
  final bool fieldReadOnly;
  final bool isPinInput;
  final bool isFieldValid;
  final Color? obscureButtonColor;
  final Widget Function(Color)? sufixWidget;
  final void Function(String text)? onEditingComplete;
  final int onEditingCompleteDurationInMili;
  final bool? isLightTheme;
  String? value;
  GradientTextFieldWidget({
    Key? key,
    this.errorText,
    this.normalTextColor = StandardColors.white,
    this.hintText,
    this.hintTextStyle,
    this.textController,
    this.inputNode,
    this.onChanged,
    required this.isFieldValid,
    this.isLightTheme,
    this.showSecondText = false,
    this.maxLines = 1,
    this.showObscureButton = false,
    this.isObscureText,
    this.onObscureButtonPressed,
    this.fieldReadOnly = false,
    this.isPinInput = false,
    this.value,
    this.obscureButtonColor,
    this.sufixWidget,
    this.onEditingComplete,
    this.onEditingCompleteDurationInMili = 1000,
  }) : super(key: key);

  @override
  State<GradientTextFieldWidget> createState() =>
      _GradientTextFieldWidgetState();
}

class _GradientTextFieldWidgetState extends State<GradientTextFieldWidget>
    with TextThemes {
  late Animation<Offset> offset;

  bool isTyping = false;
  Timer? _debounce;

  @override
  void didUpdateWidget(covariant GradientTextFieldWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      if (widget.value != null) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              widget.isObscureText == true
                  ? SizedBox(
                      width: double.infinity,
                      child: (widget.hintText?.trim().isNotEmpty ?? false) &&
                              (widget.value ?? '').isEmpty
                          ? Container(
                              height: 100,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.hintText!,
                                style: widget.hintTextStyle ??
                                    subtitleTextStyle(
                                      color: widget.normalTextColor,
                                    ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.centerLeft,
                              child: GradientTextFieldPinCode(
                                pinCode: widget.value ?? '',
                                color: widget.errorText?.isNotEmpty == true
                                    ? StandardColors.error
                                    : widget.value != null &&
                                            !widget.isFieldValid
                                        ? (widget.isLightTheme ?? true)
                                            ? StandardColors.white
                                            : StandardColors.black
                                        : widget.isFieldValid
                                            ? StandardColors.blueLight
                                            : null,
                              ),
                            ),
                    )
                  : TextFormField(
                      key: ValueKey(
                        'key_for_text_field${widget.value}',
                      ),
                      controller: widget.textController,
                      initialValue: widget.value,
                      onChanged: (text) {
                        _onInputChanged(text);
                        widget.onChanged?.call(text);
                      },
                      readOnly: widget.fieldReadOnly,
                      focusNode: widget.inputNode,
                      style: subtitleTextStyle(
                        letterSpacing: 1,
                        color: widget.errorText == null
                            ? widget.isFieldValid
                                ? StandardColors.blueLight
                                : widget.value != null
                                    ? StandardColors.black
                                    : widget.normalTextColor
                            : StandardColors.feedbackError,
                      ),
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        hintStyle: TextStyle(
                          color: widget.errorText == null
                              ? widget.normalTextColor
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
                bottom: widget.maxLines == 1 ? 6 : 0,
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
                right: 0,
                top: 16,
                child: Visibility(
                  visible: widget.showObscureButton && widget.value != '',
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
                        color: widget.obscureButtonColor ??
                            (widget.errorText == null
                                ? widget.isFieldValid
                                    ? StandardColors.blueLight
                                    : Colors.white
                                : StandardColors.feedbackError),
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
                              : widget.normalTextColor
                          : StandardColors.feedbackError,
                    ),
                  ),
                ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: textCaption(
            context,
            text: widget.errorText ?? '',
            color: widget.errorText == null
                ? widget.normalTextColor
                : StandardColors.feedbackError,
          ),
        )
      ],
    );
  }

  void _onInputChanged(String value) {
    if (widget.onEditingComplete == null) return;
    isTyping = true;
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(
        Duration(milliseconds: widget.onEditingCompleteDurationInMili), () {
      widget.onEditingComplete?.call(value);
    });
  }
}
