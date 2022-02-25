import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/stagger_opacity.dart';

class AnimatedCenterLogo extends StatefulWidget {
  final bool showFirstFrame;
  final void Function()? onAnimationEnd;

  const AnimatedCenterLogo({
    Key? key,
    required this.showFirstFrame,
    this.onAnimationEnd,
  }) : super(key: key);

  @override
  State<AnimatedCenterLogo> createState() => _AnimatedCenterLogoState();
}

class _AnimatedCenterLogoState extends State<AnimatedCenterLogo>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );

  late Animation<double> _logoOpacity;

  @override
  void initState() {
    super.initState();
    _logoOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1, curve: Curves.linear),
      ),
    );
    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      _controller.forward().orCancel;
      timer.cancel();
    });
    Timer.periodic(const Duration(milliseconds: 5600), (timer) {
      _controller.reverse();
      widget.onAnimationEnd?.call();
      timer.cancel();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StaggerOpacity(
        opacity: _logoOpacity,
        controller: _controller,
        child: AnimatedSwitcher(
          child: widget.showFirstFrame
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
