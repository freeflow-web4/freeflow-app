import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';

class AnimatedArrowRight extends StatelessWidget {
  final bool isActive;
  final void Function() onTap;
  const AnimatedArrowRight({
    Key? key,
    required this.onTap,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedFloatButtonWidget(
      isActive: isActive,
      onTap: onTap,
      icon: IconsAsset.arrowIcon,
    );
  }
}
