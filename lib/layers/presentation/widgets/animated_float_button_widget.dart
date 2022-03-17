import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

class AnimatedFloatButtonWidget extends StatefulWidget {
  final bool isActive;
  final void Function() onTap;
  final void Function() onTapInative;
  final String icon;

  const AnimatedFloatButtonWidget({
    Key? key,
    this.isActive = true,
    required this.onTap,
    required this.onTapInative,
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
      onTap: widget.isActive ? widget.onTap : widget.onTapInative,
      child: AnimatedContainer(
        width: widget.isActive ? 64 : 48,
        height: widget.isActive ? 64 : 48,
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
            width: widget.isActive ? 32 : 24,
            height: widget.isActive ? 32 : 24,
            child: Center(
              child: SvgPicture.asset(widget.icon),
            ),
          ),
        ),
      ),
    );
  }
}
