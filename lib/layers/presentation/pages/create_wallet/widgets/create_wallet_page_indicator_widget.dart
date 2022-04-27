import 'package:flutter/material.dart';
import 'package:freeflow/layers/presentation/widgets/animated_dot_indicator/animated_dot_indicator_widget.dart';

class CreateWalletPageIndicator extends StatefulWidget {
  final int currentIndex;
  final void Function()? onAnimationEnd;
  final bool animatedOnStart;

  const CreateWalletPageIndicator({
    Key? key,
    required this.currentIndex,
    required this.animatedOnStart,
    this.onAnimationEnd,
  }) : super(key: key);

  @override
  State<CreateWalletPageIndicator> createState() =>
      _CreateWalletPageIndicatorState();
}

class _CreateWalletPageIndicatorState extends State<CreateWalletPageIndicator> {
  late int _currentIndex = widget.currentIndex > 0 && widget.animatedOnStart
      ? widget.currentIndex - 1
      : widget.currentIndex;
  @override
  void initState() {
    super.initState();
    if (widget.currentIndex > 0 && widget.animatedOnStart) {
      Future.delayed(Duration.zero, () {
        setState(() {
          _currentIndex = widget.currentIndex;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedDotIndicatorWidget(
      currentIndex: _currentIndex,
      length: 5,
      totalAnimationStartUpDuration: const Duration(
        seconds: 4,
      ),
      onAnimationEnd: widget.onAnimationEnd,
      animatedOnStart: widget.currentIndex == 0,
    );
  }
}
