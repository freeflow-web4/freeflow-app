part of './animated_dot_indicator_widget.dart';

class _StartingDotIndicatorAnimation {
  _StartingDotIndicatorAnimation(
    AnimationController dotSizeController,
  ) : dotOpacityAndSize = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: dotSizeController,
            curve: const Interval(
              0,
              1,
              curve: Curves.ease,
            ),
          ),
        );

  late Animation<double> dotOpacityAndSize;
}
