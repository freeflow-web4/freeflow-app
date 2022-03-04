import 'dart:ui';

import 'package:flutter/material.dart';

const _velocityFactorList = <double>[1, 1.5, 1, 2, 2.7, 3];

class AnimatedText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final AnimationController animationController;
  final Animation<double> animation;
  const AnimatedText({
    Key? key,
    required this.text,
    required this.animationController,
    required this.style,
    required this.animation,
  }) : super(key: key);

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  static const _maxBlur = 25.0;

  List<double> velocities = _velocityFactorList;

  @override
  void initState() {
    super.initState();
    updateVelocities();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (context, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _getTextWidgets(
            widget.style,
            widget.animation.value,
          ),
        );
      },
    );
  }

  List<Widget> _getTextWidgets(TextStyle textStyle, double animationValue) {
    final text = widget.text;
    final textWidgets = <Widget>[];
    for (var i = 0; i < text.length; i++) {
      final char = text[i];
      final blurValue = getOpacityForIndex(widget.text, animationValue, i);
      // print('blurValue: $blurValue');
      textWidgets.add(
        Padding(
          padding: EdgeInsets.only(
            right: i < text.length - 1 ? (textStyle.letterSpacing ?? 0.0) : 0.0,
          ),
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: _maxBlur * blurValue,
              sigmaY: _maxBlur * blurValue,
            ),
            child: Text(
              char,
              style: textStyle,
            ),
          ),
        ),
      );
    }
    return textWidgets;
  }

  bool shouldShowLetter(double animationvalue, int index) {
    final increment = 1.0 / widget.text.length;
    return animationvalue >= index * increment &&
        animationvalue < (index + 1) * increment;
  }

  void updateVelocities() {
    if (velocities.length < widget.text.length) {
      final velocityIncrease = (widget.text.length / velocities.length).round();
      for (var i = 0; i < velocityIncrease; i++) {
        velocities.addAll(_velocityFactorList);
      }
      velocities = _velocityFactorList;
    }
  }

  double getOpacityForIndex(String text, double animationvalue, int index) {
    final velocityWithIncrease = animationvalue * velocities[index];
    if (velocityWithIncrease > 1.0) {
      return 1.0;
    } else if (velocityWithIncrease == 0) {
      return 0.001;
    }
    return velocityWithIncrease;
  }

  double getOpacityForIndex2(String text, double animationvalue, int index) {
    const minimalValue = 0.001;
    double blur = minimalValue;
    final increment = 1 / text.length;
    final minLimit = index * increment;
    final animationLetterStarted = animationvalue >= minLimit;

    if (animationLetterStarted) {
      double length = animationvalue - minLimit;
      blur = length / increment;
      if (blur > 1) blur = 1;
      if (blur <= 0) blur = 0;
    }
    final reversedBlur = 1 - blur;
    final blurWithPrecaution = reversedBlur > 0 ? reversedBlur : minimalValue;
    return blurWithPrecaution;
  }
}
