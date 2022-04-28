import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

class AnimatedFloatButtonWidget extends StatefulWidget {
  final bool isActive;
  final bool isLargeButton;
  final void Function(bool activate) onTap;
  final String icon;

  const AnimatedFloatButtonWidget({
    Key? key,
    this.isActive = true,
    this.isLargeButton = false,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  _AnimatedFloatButtonWidgetState createState() =>
      _AnimatedFloatButtonWidgetState();
}

class _AnimatedFloatButtonWidgetState extends State<AnimatedFloatButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(widget.isActive),
      child: AnimatedContainer(
        width: widget.isLargeButton ? 64 : 48,
        height: widget.isLargeButton ? 64 : 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: widget.isActive
              ? StandardColors.greenGradient()
              : StandardColors.greyGradient(),
        ),
        duration: const Duration(seconds: 1),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: widget.isLargeButton ? 32 : 24,
            height: widget.isLargeButton ? 32 : 24,
            child: Center(
              child: SvgPicture.asset(widget.icon),
            ),
          ),
        ),
      ),
    );
  }
}
