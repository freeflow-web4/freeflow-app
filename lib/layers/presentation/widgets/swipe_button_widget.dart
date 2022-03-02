import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

class SwipeButton extends StatefulWidget {
  final void Function() onSwipe;
  final bool startAnimation;
  final String? text;
  const SwipeButton({
    Key? key,
    this.text,
    required this.onSwipe,
    required this.startAnimation,
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

  late final AnimationController animationController = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );

  double? _buttonProgressFactor;

  bool swiped = false;

  Animation<double>? _buttonAnimation;

  bool? animationDone;

  @override
  void initState() {
    super.initState();
    _buttonAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0, end: 0.4),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.4, end: 0),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ConstantTween(0.0),
        weight: 0.8,
      ),
    ]).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0,
          1,
          curve: Curves.ease,
        ),
      ),
    )..addStatusListener(onAnimationChanged);
    animationDone = false;
  }

  @override
  void didUpdateWidget(covariant SwipeButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.startAnimation != widget.startAnimation) {
      if (widget.startAnimation) {
        animationController.repeat();
      }
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
          child: LayoutBuilder(
            builder: (context, constraints) {
              final widgetWidth = constraints.maxWidth;
              final widgetHeight = constraints.maxHeight;
              final offsetFactor = widgetHeight / widgetWidth;

              return Align(
                alignment: Alignment.centerLeft,
                child: (animationDone ?? true) == false &&
                        _buttonProgressFactor == null
                    ? AnimatedBuilder(
                        animation: animationController,
                        child: _progressBar(),
                        builder: (context, child) {
                          final widthFactor = _buttonAnimation!.value;
                          return _builderProgressBar(
                            context,
                            child,
                            widthFactorWithOffset(
                              widthFactor,
                              offsetFactor,
                            ),
                          );
                        },
                      )
                    : _progressBarWithFactor(
                        widthFactorWithOffset(
                          _buttonProgressFactor ?? 0,
                          offsetFactor,
                        ),
                      ),
              );
            },
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
              return (animationDone ?? true) == false &&
                      _buttonProgressFactor == null
                  ? AnimatedBuilder(
                      child: child,
                      animation: animationController,
                      builder: (context, child) =>
                          _builder(context, child, _buttonAnimation!),
                    )
                  : Align(
                      alignment: Alignment(
                        _calcHorizontalInRange(_buttonProgressFactor ?? 0),
                        0,
                      ),
                      child: child,
                    );
            },
          ),
        )
      ],
    );
  }

  double widthFactorWithOffset(double widthFactor, double offSetFactor) =>
      widthFactor + offSetFactor * (1 - widthFactor);

  Widget _progressBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        gradient: _gradient,
      ),
    );
  }

  Widget _progressBarWithFactor(double factor) {
    return FractionallySizedBox(
      widthFactor: factor,
      child: _progressBar(),
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
      child: child,
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
    final shouldUpdate =
        _shouldUpdateProgress(movement, _buttonProgressFactor ?? 0);
    if (!shouldUpdate) {
      return;
    }
    final increment = _calcMovementFactor(movement, widgetWidth);
    final newProgress =
        _calcButtonProgress(increment, _buttonProgressFactor ?? 0);
    final newAlign = _calcHorizontalInRange(newProgress);
    updateProgress(newProgress, newAlign);
  }

  void updateProgress(double percent, double align) {
    setState(() {
      _buttonProgressFactor = percent;
    });
    final progressWithPrecision = ((_buttonProgressFactor ?? 0) * 5).round();
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
        _calcHorizontalInRange(animation.value),
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

  Widget _builderProgressBar(
    BuildContext context,
    Widget? child,
    double factor,
  ) {
    return _progressBarWithFactor(factor);
  }
}
