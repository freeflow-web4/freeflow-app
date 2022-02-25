import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

class AnimatedFloatButtonWidget extends StatefulWidget {
  final bool isActive;
  final bool isLargeAnimation;
  final bool showButton;
  final void Function() onTap;
  final String icon;
  const AnimatedFloatButtonWidget(
      {Key? key,
      required this.isActive,
      required this.isLargeAnimation,
      required this.showButton,
      required this.onTap,
      required this.icon})
      : super(key: key);

  @override
  _AnimatedFloatButtonWidgetState createState() =>
      _AnimatedFloatButtonWidgetState();
}

class _AnimatedFloatButtonWidgetState extends State<AnimatedFloatButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedOpacity(
        opacity: widget.showButton ? 1.0 : 0.0,
        duration: const Duration(seconds: 1),
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: widget.isLargeAnimation ? 64 : 48,
          height: widget.isLargeAnimation ? 64 : 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: widget.isActive
                ? StandardColors.greenGradient()
                : StandardColors.greyGradient(),
          ),
          child: Center(
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: widget.isLargeAnimation ? 32 : 24,
              height: widget.isLargeAnimation ? 32 : 24,
              child: Center(
                child: SvgPicture.asset(widget.icon),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
