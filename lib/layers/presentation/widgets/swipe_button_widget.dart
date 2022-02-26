import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

class SwipeButton extends StatefulWidget {
  final void Function() onSwipe;
  final AnimationController? animationController;
  final String? text;
  const SwipeButton({
    Key? key,
    this.text,
    required this.onSwipe,
    this.animationController,
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

  double? horizontalAlign;

  double _buttonProgressFactor = 0;

  bool swiped = false;

  Animation<double>? _buttonAnimation;

  bool? animationDone;

  @override
  void initState() {
    super.initState();
    if (widget.animationController != null) {
      _buttonAnimation = TweenSequence([
        TweenSequenceItem(
          tween: Tween<double>(begin: -1, end: -0.6),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween<double>(begin: -0.6, end: -1),
          weight: 1,
        ),
        TweenSequenceItem(tween: ConstantTween<double>(-1), weight: 1),
        TweenSequenceItem(
          tween: Tween<double>(begin: -1, end: -0.6),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween<double>(begin: -0.6, end: -1),
          weight: 1,
        ),
      ]).animate(
        CurvedAnimation(
          parent: widget.animationController!,
          curve: const Interval(
            0.5,
            1,
            curve: Curves.linear,
          ),
        ),
      )..addStatusListener(onAnimationChanged);
      animationDone = false;
    }
  }

  @override
  void dispose() {
    _buttonAnimation?.removeStatusListener(onAnimationChanged);
    super.dispose();
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
              final ppoint = point(constraints.maxWidth, constraints.maxHeight);
              final child = draggable(constraints.maxWidth, ppoint);
              return horizontalAlign == null &&
                      widget.animationController != null &&
                      (animationDone ?? true) == false
                  ? AnimatedBuilder(
                      child: ppoint,
                      animation: widget.animationController!,
                      builder: (context, child) =>
                          _builder(context, child, _buttonAnimation!),
                    )
                  : child;
            },
          ),
        )
      ],
    );
  }

  Widget point(double maxWidth, double maxHeight) {
    return SizedBox(
      height: maxHeight,
      width: maxHeight,
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
  }

  Widget draggable(
    double maxWidth,
    Widget child,
  ) {
    return Draggable(
      feedback: const SizedBox.shrink(),
      child: Align(
        alignment: Alignment(
          //TODO: remove the -0.3 ou switch
          horizontalAlign ?? -1,
          0,
        ),
        child: child,
      ),
      axis: Axis.horizontal,
      onDragUpdate: (details) => update(
        maxWidth,
        details.globalPosition.dx,
        details.delta.dx,
      ),
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

  Widget _builder(
    BuildContext context,
    Widget? child,
    Animation<double> animation,
  ) {
    return Align(
      alignment: Alignment(
        animation.value,
        0,
      ),
      child: child ?? const SizedBox.shrink(),
    );
  }

  void onAnimationChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      setState(() {
        animationDone = true;
      });
    }
  }
}
