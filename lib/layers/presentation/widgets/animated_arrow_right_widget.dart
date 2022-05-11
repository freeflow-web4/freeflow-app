import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';

class AnimatedArrowRight extends StatelessWidget {
  final bool isActive;
  final void Function() onTap;
  final EdgeInsets? padding;
  const AnimatedArrowRight({
    Key? key,
    required this.onTap,
    this.isActive = false,
    this.padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: AnimatedFloatButtonWidget(
        isActive: isActive,
        onTap: (activate) {
          if (activate) {
            onTap();
          }
        },
        icon: IconsAsset.arrowIcon,
      ),
    );
  }
}
