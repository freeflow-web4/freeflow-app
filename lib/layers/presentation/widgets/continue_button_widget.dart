import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

class ContinueButtonWidget extends StatefulWidget {
  final bool isActive;
  final bool isLargeAnimation;
  final bool showButton;
  const ContinueButtonWidget({
    Key? key,
    required this.isActive,
    required this.isLargeAnimation,
    required this.showButton,
  }) : super(key: key);

  @override
  _ContinueButtonWidgetState createState() => _ContinueButtonWidgetState();
}

class _ContinueButtonWidgetState extends State<ContinueButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
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
            child: AnimatedCrossFade(
              firstChild: SizedBox(
                height: 32,
                width: 32,
                child: Center(
                  child: SvgPicture.asset(IconsAsset.arrowIcon),
                ),
              ),
              secondChild: SizedBox(
                height: 32,
                width: 32,
                child: Center(
                  child: SvgPicture.asset(IconsAsset.arrowIcon),
                ),
              ),
              crossFadeState: widget.isLargeAnimation
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(seconds: 1),
            ),
          )),
    );
  }
}
