import 'package:flutter/material.dart';

class StaggerPosition extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> horizontalOffset;
  final Animation<double> opacity;
  final Widget child;

  const StaggerPosition({
    Key? key,
    required this.controller,
    required this.horizontalOffset,
    required this.opacity,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildAnimation(context, child);
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return AnimatedBuilder(
      animation: controller,
      child: child,
      builder: (context, child) {
        return Opacity(
          opacity: opacity.value,
          child: Transform.translate(
              offset: Offset(
                horizontalOffset.value,
                0,
              ),
              child: child),
        );
      },
    );
  }
}
