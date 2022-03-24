part of './animated_dot_indicator_widget.dart';

const _flightWeight = 1.0;

class _SwipingDotIndicatorAnimation {
  _SwipingDotIndicatorAnimation(
    AnimationController dotSizeController, {
    Curve curve = Curves.ease,
    double maxDotSize = 1.5,
    double choosenDotSize = 1,
  }) : currentDotSize = TweenSequence<double>([
          TweenSequenceItem(
            tween: TweenWithCurve(
              begin: 1,
              end: maxDotSize,
              curve: curve,
            ),
            weight: _flightWeight,
          ),
          TweenSequenceItem(
            tween: ConstantTween(maxDotSize),
            weight: _flightWeight / 3,
          ),
          TweenSequenceItem(
            tween: TweenWithCurve(
              begin: maxDotSize,
              end: choosenDotSize,
              curve: curve,
            ),
            weight: _flightWeight,
          )
        ]).animate(
          dotSizeController,
        );

  late Animation<double> currentDotSize;
}
