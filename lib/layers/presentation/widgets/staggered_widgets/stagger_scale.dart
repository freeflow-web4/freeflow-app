import 'package:flutter/material.dart';

class StaggerScale extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> height;
  final Animation<double> width;
  final Widget child;

  const StaggerScale({
    Key? key,
    required this.controller,
    required this.height,
    required this.width,
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
        return Transform.scale(
          scaleX: width.value,
          scaleY: height.value,
          child: child,
        );
      },
    );
  }
}
