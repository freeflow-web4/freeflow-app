import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

class CustomFilterBarItem extends StatefulWidget {
  final EdgeInsets? tabMargin;
  final String tabName;
  final Function onTap;
  final bool isSelected;
  final double? height;
  const CustomFilterBarItem({
    Key? key,
    required this.tabName,
    required this.isSelected,
    required this.onTap,
    this.tabMargin,
    this.height,
  }) : super(key: key);

  @override
  State<CustomFilterBarItem> createState() => _CustomFilterBarItemState();
}

class _CustomFilterBarItemState extends State<CustomFilterBarItem>
    with TextThemes, SingleTickerProviderStateMixin {
  late Animation<Offset> animation;
  late AnimationController animationController;

  @override
  void initState() {
    initializeAnimationController();
    animateIndicator();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void initializeAnimationController() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = Tween<Offset>(
      begin: const Offset(-0.2, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );
  }

  void animateIndicator({bool reset = false}) {
    if (reset) {
      animationController.reset();
    }

    Future.delayed(const Duration(milliseconds: 100), () {
      animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        animateIndicator(reset: true);
      },
      child: Container(
        height: widget.height ?? 26,
        padding: widget.tabMargin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            textButton2(
              context,
              text: widget.tabName,
              color: widget.isSelected
                  ? StandardColors.textMediumGrey
                  : StandardColors.textMediumGrey.withOpacity(
                      0.6,
                    ),
            ),
            customIndicator(isActive: widget.isSelected)
          ],
        ),
      ),
    );
  }

  Widget customIndicator({
    required bool isActive,
  }) {
    return SlideTransition(
      position: animation,
      child: Container(
        height: widget.isSelected ? 3 : 0,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: StandardColors.purpleBlueGradient(),
        ),
      ),
    );
  }
}
