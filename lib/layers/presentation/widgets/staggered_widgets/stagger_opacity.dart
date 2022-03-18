import 'package:flutter/material.dart';

class StaggerOpacity extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> opacity;
  final Widget child;

  const StaggerOpacity({
    Key? key,
    required this.controller,
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
          child: child,
        );
      },
    );
  }
}
