import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

class GradientTextFieldWidget extends StatefulWidget {
  final bool showTextField;

  const GradientTextFieldWidget({
    Key? key,
    required this.showTextField,
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
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    offset = Tween<Offset>(
            begin: const Offset(-10.0, 0.0), end: const Offset(0.0, 0.0))
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (widget.showTextField) {
        controller.forward();
      }
      return SlideTransition(
        textDirection: TextDirection.rtl,
        position: offset,
        child: Center(
          child: SizedBox(
            height: 50,
            child: Stack(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Private Key',
                    hintStyle: TextStyle(
                      color: Colors.white,
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
                  bottom: 10,
                  child: Container(
                    height: 2,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                      gradient: StandardColors.greenGradient(),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 13,
                  right: 0,
                  child: textBoldSubtitle(
                    context,
                    text: '.FF',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
