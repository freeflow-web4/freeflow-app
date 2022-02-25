import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

class SwipeButton extends StatefulWidget {
  final void Function() onSwipe;
  final String? text;
  const SwipeButton({
    Key? key,
    this.text,
    required this.onSwipe,
  }) : super(key: key);

  @override
  State<SwipeButton> createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton> with TextThemes {
  //blue
  static const beginingColor = Color(0xFF29B6B8);
  //green
  static const endingColor = Color(0xFF6AAD6B);
  static const _borderRadius = 40.0;

  static const _gradientAngle = 0.79;
  static const _gradient = LinearGradient(
    colors: [
      beginingColor,
      endingColor,
    ],
    transform: GradientRotation(_gradientAngle),
    stops: [0.0, 0.6],
  );
  static const borderPadding = 2.0;
  static const childPadding = 4.0;
  static const totalPadding = borderPadding + childPadding;

  double horizontalAlign = -1;
  double? lastX;

  double _factor = 0;

  @override
  Widget build(BuildContext context) {
    final textNonNull = widget.text ?? '';

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_borderRadius),
            gradient: _gradient,
          ),
          padding: const EdgeInsets.all(borderPadding),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_borderRadius),
              color: StandardColors.primary,
            ),
            padding: const EdgeInsets.all(childPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textWidget(context, ''),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: totalPadding,
            ),
            child: textWidget(
              context,
              textNonNull,
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_borderRadius),
                gradient: _gradient,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final point = SizedBox(
                height: constraints.maxHeight,
                width: constraints.maxHeight,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: _gradient,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Image.asset('assets/images/icons/arrow_right.png'),
                ),
              );
              return Draggable(
                feedback: const SizedBox.shrink(),
                child: Align(
                  alignment: Alignment(horizontalAlign, 0),
                  child: point,
                ),
                axis: Axis.horizontal,
                onDragEnd: (_) => clean(),
                onDragUpdate: (details) => update(
                  constraints.maxWidth,
                  details.globalPosition.dx,
                  details.delta.dx,
                ),
              );
            },
          ),
        )
      ],
    );
  }

  void update(double widgetWidth, double x, double dx) {
    // return;
    final newValue = calculateNewPosition(widgetWidth, x, dx);
    if (newValue != null) {
      setState(() {
        horizontalAlign = newValue;
      });
    }
  }

  double? calculateNewPosition(double widgetWidth, double x, double dx) {
    final movement = lastX == null ? dx : x - lastX!;
    lastX = x;
    if ((movement > 0 && horizontalAlign < 1) ||
        (movement < 0 && horizontalAlign > -1) ||
        movement != 0) {
      setState(() {
        _factor = calcMovementFactor(movement, widgetWidth) * 3;
      });
      final finalHorizontalAlignValue =
          calcHorizontalInRange(horizontalAlign, _factor);
      return finalHorizontalAlignValue;
    }
    return null;
  }

  double calcHorizontalInRange(double currentValue, double increment) {
    final incrementedHorizontalAlign = currentValue + increment;
    double finalHorizontalAlignValue = -1;
    if (incrementedHorizontalAlign > -1 && incrementedHorizontalAlign < 1) {
      finalHorizontalAlignValue = incrementedHorizontalAlign;
    } else if (incrementedHorizontalAlign > 1) {
      finalHorizontalAlignValue = 1;
    }
    return finalHorizontalAlignValue;
  }

  double calcMovementFactor(double movement, double widgetWidth) {
    final factor = movement / widgetWidth;
    return factor;
  }

  void clean() {
    lastX = null;
  }

  Widget textWidget(BuildContext context, String text) {
    return textBold18(context, text: text, color: Colors.white);
  }
}
