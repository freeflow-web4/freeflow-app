import 'package:flutter/material.dart';

class SwipePageView extends StatefulWidget {
  final List<Widget> children;
  final double minimalFactorToSwipe;
  final int initialIndex;
  final void Function(int)? onPageSwiped;
  const SwipePageView({
    Key? key,
    required this.children,
    required this.initialIndex,
    this.minimalFactorToSwipe = 0.6,
    this.onPageSwiped,
  }) : super(key: key);

  @override
  State<SwipePageView> createState() => _SwipePageViewState();
}

class _SwipePageViewState extends State<SwipePageView> {
  double right = 0;
  bool canMove = true;
  bool shoudlAnimated = true;
  late int currentIndex = widget.initialIndex;
  bool isAnimatingToPageBefore = false;

  @override
  void didUpdateWidget(covariant SwipePageView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialIndex != oldWidget.initialIndex &&
        widget.initialIndex != currentIndex) {
      setState(() {
        shoudlAnimated = false;
        currentIndex = widget.initialIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contraints) {
      final width = contraints.maxWidth;
      final height = contraints.maxHeight;
      return GestureDetector(
        onHorizontalDragUpdate: (details) => onHorizontalUpdate(
          details,
          width,
        ),
        onHorizontalDragEnd: onHorizontalEnd,
        onTap: () {},
        child: Stack(
          children: [
            if (currentIndex == 0 || currentIndex == 1) widget.children[0],
            if (currentIndex == 1 || currentIndex == 2)
              AnimatedPositioned(
                duration: Duration(
                  milliseconds: shoudlAnimated
                      ? canMove
                          ? 100
                          : 500
                      : 0,
                ),
                right: right * width,
                child: SizedBox(
                  width: width,
                  height: height,
                  child: widget.children[1],
                ),
                onEnd: onAnimationEnd,
              )
          ],
        ),
      );
    });
  }

  double getScreenWidthFactor(double dx, double screenWidth) {
    return dx / screenWidth;
  }

  void onHorizontalUpdate(DragUpdateDetails details, double screenWidth) {
    if (canMove || currentIndex > 0) {
      setState(
        () => right -= getScreenWidthFactor(details.delta.dx, screenWidth),
      );
    }
    checkRight();
  }

  void checkRight([void Function()? onNotCompleted]) {
    if (right >= widget.minimalFactorToSwipe) {
      canMove = false;
      setState(() {
        right = 1;
      });
    } else {
      onNotCompleted?.call();
    }
  }

  void onAnimationEnd() {
    canMove = true;
    shoudlAnimated = true;
    if (isAnimatingToPageBefore) {
      isAnimatingToPageBefore = false;
      reduceCurrentPageIndex();
      widget.onPageSwiped?.call(currentIndex);
    }
  }

  void onHorizontalEnd(DragEndDetails details) {
    if (canMove) {
      checkRight(
        () => setState(() {
          right = 0;
        }),
      );
    }
  }

  void reduceCurrentPageIndex() {
    currentIndex = currentIndex == 0 ? 0 : currentIndex - 1;
  }
}
