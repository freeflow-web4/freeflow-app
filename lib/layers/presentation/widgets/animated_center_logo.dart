import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:freeflow/core/utils/assets_constants.dart';

class AnimatedCenterLogo extends StatelessWidget {
  final double logoOpacity;
  final bool showFirstFrame;

  const AnimatedCenterLogo({
    Key? key,
    required this.logoOpacity,
    required this.showFirstFrame,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: logoOpacity,
        duration: const Duration(milliseconds: 300),
        child: AnimatedSwitcher(
          child: showFirstFrame
              ? SvgPicture.asset(
                  IconsAsset.freeflowLogoAnimation1,
                  key: const Key('image1'),
                )
              : SvgPicture.asset(
                  IconsAsset.freeflowLogoAnimation3,
                  key: const Key('image3'),
                ),
          duration: const Duration(milliseconds: 500),
        ),
      ),
    );
  }
}
