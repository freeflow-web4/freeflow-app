import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/layers/presentation/widgets/general_page_animations.dart';

class LoadingWidget extends StatelessWidget {
  final bool isLoading;
  final Color? color;
  final double? size;
  final EdgeInsets? padding;
  const LoadingWidget({
    required this.isLoading,
    this.color,
    this.size,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoading,
      child: _LoadingWidgetRotating(
        isLoading: isLoading,
        color: color,
        size: size,
        padding: padding,
      ),
    );
  }
}

class _LoadingWidgetRotating extends StatefulWidget {
  final bool isLoading;
  final Color? color;
  final double? size;
  final EdgeInsets? padding;
  const _LoadingWidgetRotating({
    Key? key,
    required this.isLoading,
    this.color,
    this.size,
    this.padding,
  }) : super(key: key);

  @override
  State<_LoadingWidgetRotating> createState() => _LoadingWidgetRotatingState();
}

class _LoadingWidgetRotatingState extends State<_LoadingWidgetRotating>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animationController.forward();
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _LoadingWidgetRotating oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isLoading,
      child: Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: RotationTransition(
          turns: GeneralPageAnimation(animationController).loadingAnimation,
          child: SvgPicture.asset(
            IconsAsset.loading,
            color: widget.color,
            height: widget.size ?? 48,
            width: widget.size ?? 48,
          ),
        ),
      ),
    );
  }
}
