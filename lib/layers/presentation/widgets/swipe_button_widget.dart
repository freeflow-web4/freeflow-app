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

class _SwipeButtonState extends State<SwipeButton>
    with TickerProviderStateMixin, TextThemes {
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
  static const double _offset = 0.15;

  double horizontalAlign = -1;

  double _buttonProgressFactor = 0;

  bool swiped = false;

  late final AnimationController animationController = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );
  Animation<double>? _buttonAnimation;

  @override
  void initState() {
    super.initState();
    if (animationController != null) {
      _buttonAnimation = Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          parent: animationController,
          curve: const Interval(
            0.75,
            1,
            curve: Curves.bounceIn,
          ),
        ),
      );
    }
  }

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
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: _buttonProgressFactor < _offset / 2
                  ? _offset
                  : _buttonProgressFactor > 0.5
                      ? _buttonProgressFactor
                      : _buttonProgressFactor + _offset / 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_borderRadius),
                  gradient: _gradient,
                ),
              ),
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
          child: LayoutBuilder(
            builder: (context, constraints) {
              final point = SizedBox(
                height: constraints.maxHeight,
                width: constraints.maxHeight,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: _gradient,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 10,
                        spreadRadius: 4,
                      ),
                    ],
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
    final movement = _calcMovement(x, dx);
    final shouldUpdate = _shouldUpdateProgress(movement, _buttonProgressFactor);
    if (!shouldUpdate) {
      return;
    }
    final increment = _calcMovementFactor(movement, widgetWidth);
    final newProgress = _calcButtonProgress(increment, _buttonProgressFactor);
    final newAlign = _calcHorizontalInRange(newProgress);
    updateProgress(newProgress, newAlign);
  }

  void updateProgress(double percent, double align) {
    setState(() {
      _buttonProgressFactor = percent;
      horizontalAlign = align;
    });
    final progressWithPrecision = (_buttonProgressFactor * 5).round();
    final inTheEnd = progressWithPrecision == 5;
    if (inTheEnd && !swiped) {
      widget.onSwipe();
      swiped = true;
    } else if (!inTheEnd) {
      swiped = false;
    }
  }

  bool _shouldUpdateProgress(double movement, double currentProgressFactor) {
    final result = (movement > 0 && currentProgressFactor < 1) ||
        (movement < 0 && currentProgressFactor > 0);
    return result;
  }

  double _calcMovement(double x, double dx) {
    final movement = dx;
    return movement;
  }

  double _calcButtonProgress(double increment, double currentProgress) {
    final progress = increment + currentProgress;
    double finalProgress = 0;
    if (progress > 0 && progress < 1) {
      finalProgress = progress;
    } else if (progress >= 1) {
      finalProgress = 1;
    }
    return finalProgress;
  }

  double _calcHorizontalInRange(double progress) {
    final progressInRange = progress * 2 - 1;
    return progressInRange;
  }

  double _calcMovementFactor(
    double movement,
    double widgetWidth,
  ) {
    final factor = (movement / widgetWidth);
    return factor;
  }

  Widget textWidget(BuildContext context, String text) {
    return textBold18(context, text: text, color: Colors.white);
  }
}

// class ComeAnGoCurve<T extends Curve> extends Curve {
//   final int repeat;

//   ComeAnGoCurve({this.repeat = 1});
//   @override
//   double transformInternal(double t) {
//     return calc(t);
//   }

//   double calc(double t) {
//     double time = t;
//     if (shoudlUseReverse(t)) time = 1 - t;
//     final timeInCycle = getTimeInCycle(t, repeat);
//   }

//   bool shoudlUseReverse(double t) {}
//   getTimeInCycle(double t, int repeat) {
//     for (var i = 0; i < repeat; i++) {
      
//     }
//   }
// }
