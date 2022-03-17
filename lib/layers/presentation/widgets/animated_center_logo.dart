import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/layers/presentation/widgets/staggered_widgets/stagger_opacity.dart';

class AnimatedCenterLogo extends StatefulWidget {
  final void Function()? onAnimationEnd;

  const AnimatedCenterLogo({
    Key? key,
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

  bool showFirstFrame = true;
  bool showSecondFrame = false;

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
    updateAnimation();
  }

  void updateAnimation() {
    Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      _controller.forward().orCancel;
      timer.cancel();
    });
    Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      showFirstFrame = true;
      showSecondFrame = false;
      setState(() {});
      timer.cancel();
    });
    Timer.periodic(const Duration(milliseconds: 3000), (timer) {
      showFirstFrame = false;
      showSecondFrame = true;
      setState(() {});
      timer.cancel();
    });
    Timer.periodic(const Duration(milliseconds: 4500), (timer) {
      showFirstFrame = true;
      showSecondFrame = false;
      setState(() {});
      timer.cancel();
    });
    Timer.periodic(const Duration(milliseconds: 6000), (timer) {
      showFirstFrame = false;
      showSecondFrame = true;
      setState(() {});
      timer.cancel();
    });
    Timer.periodic(const Duration(milliseconds: 7500), (timer) {
      showFirstFrame = true;
      showSecondFrame = false;
      setState(() {});
      timer.cancel();
    });
    Timer.periodic(const Duration(milliseconds: 9000), (timer) {
      showFirstFrame = false;
      showSecondFrame = true;
      setState(() {});
      timer.cancel();
    });
    Timer.periodic(const Duration(milliseconds: 9500), (timer) {
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
          child: showFirstFrame
              ? SvgPicture.asset(
                  IconsAsset.freeflowLogoAnimation2,
                  key: const Key('image1'),
                )
              : SvgPicture.asset(
                  IconsAsset.freeflowLogoAnimation3,
                  key: const Key('image3'),
                ),
          duration: const Duration(milliseconds: 1200),
        ),
      ),
    );
  }
}
