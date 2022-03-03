import 'package:flutter/material.dart';
import 'package:freeflow/layers/presentation/widgets/animated_dot_widget.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/staggered_widgets.dart';
import 'package:freeflow/layers/presentation/widgets/widget_animations/dot_indicator_widget_animation.dart';

class AnimatedDotIndicatorWidget extends StatefulWidget {
  final int currentIndex;
  final bool showIndexAnimation;
  final void Function() onTapFirstDot;
  final void Function() onTapSecondDot;
  final void Function() onTapThirdDot;

  const AnimatedDotIndicatorWidget({
    Key? key,
    required this.currentIndex,
    required this.showIndexAnimation,
    required this.onTapFirstDot,
    required this.onTapSecondDot,
    required this.onTapThirdDot,
  }) : super(key: key);

  @override
  State<AnimatedDotIndicatorWidget> createState() =>
      _AnimatedDotIndicatorWidgetState();
}

class _AnimatedDotIndicatorWidgetState extends State<AnimatedDotIndicatorWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late DotIndicatorAnimation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    animation = DotIndicatorAnimation(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StaggerOpacity(
          opacity: animation.firstDotOpacity,
          controller: animationController,
          child: AnimatedDotWidget(
            isIndex: widget.currentIndex == 0,
            showIndexAnimation:
                widget.currentIndex == 0 && widget.showIndexAnimation,
            onTap: widget.onTapFirstDot,
          ),
        ),
        StaggerOpacity(
          opacity: animation.secondDotOpacity,
          controller: animationController,
          child: AnimatedDotWidget(
            isIndex: widget.currentIndex == 1,
            showIndexAnimation:
                widget.currentIndex == 1 && widget.showIndexAnimation,
            onTap: widget.onTapSecondDot,
          ),
        ),
        StaggerOpacity(
          opacity: animation.thirdDotOpacity,
          controller: animationController,
          child: AnimatedDotWidget(
            isIndex: widget.currentIndex == 2,
            showIndexAnimation:
                widget.currentIndex == 2 && widget.showIndexAnimation,
            onTap: widget.onTapThirdDot,
          ),
        ),
      ],
    );
  }
}
