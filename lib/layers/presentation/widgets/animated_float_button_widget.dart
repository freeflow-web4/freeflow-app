import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

class AnimatedFloatButtonWidget extends StatefulWidget {
  final bool isActive;
  final void Function() onTap;
  final String icon;

  const AnimatedFloatButtonWidget({
    Key? key,
    this.isActive = true,
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
      onTap: widget.onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: widget.isActive
              ? StandardColors.greenGradient()
              : StandardColors.greyGradient(),
        ),
        child: Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: Center(
              child: SvgPicture.asset(widget.icon),
            ),
          ),
        ),
      ),
    );
  }
}
