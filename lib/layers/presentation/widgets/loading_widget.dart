import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/layers/presentation/widgets/general_page_animations.dart';

class LoadingWidget extends StatefulWidget {
  final bool isLoading;
  final Color? color;
  final double? size;
  final EdgeInsets? padding;
  const LoadingWidget({
    Key? key,
    required this.isLoading,
    this.color,
    this.size,
    this.padding,
  }) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
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
  void didUpdateWidget(covariant LoadingWidget oldWidget) {
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
