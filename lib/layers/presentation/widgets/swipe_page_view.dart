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
  double left = 0;
  bool canMove = true;
  bool shoudlAnimated = true;
  late int currentIndex = widget.initialIndex;

  @override
  void didUpdateWidget(covariant SwipePageView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialIndex != oldWidget.initialIndex &&
        widget.initialIndex != currentIndex) {
      setState(() {
        shoudlAnimated = false;
        currentIndex = widget.initialIndex;
        left = 0;
        canMove = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contraints) {
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
              widget.children[getPreviusIndex],
              if (currentIndex > 0)
                AnimatedPositioned(
                  duration: Duration(
                    milliseconds: shoudlAnimated
                        ? canMove
                            ? 100
                            : 500
                        : 0,
                  ),
                  left: left * width,
                  child: SizedBox(
                    width: width,
                    height: height,
                    child: widget.children[currentIndex],
                  ),
                  onEnd: onAnimationEnd,
                )
            ],
          ),
        );
      },
    );
  }

  int get getPreviusIndex {
    final previusIndex = currentIndex - 1;
    return previusIndex < 0 ? 0 : previusIndex;
  }

  double getScreenWidthFactor(double dx, double screenWidth) {
    return dx / screenWidth;
  }

  void onHorizontalUpdate(DragUpdateDetails details, double screenWidth) {
    final deltaX = details.delta.dx;
    if (canMove && (currentIndex > 0 || left >= 0 || deltaX > 0)) {
      final increment = getScreenWidthFactor(deltaX, screenWidth);
      setState(
        () {
          shoudlAnimated = true;
          left = left + increment < 0 ? 0 : left + increment;
        },
      );
    }
    checkLeft();
  }

  void checkLeft([void Function()? onNotCompleted]) {
    if (left >= widget.minimalFactorToSwipe && canMove) {
      canMove = false;
      setState(() {
        left = 1;
      });
    } else {
      onNotCompleted?.call();
    }
  }

  void onAnimationEnd() {
    if (!canMove && left == 1) {
      canMove = true;
      reduceCurrentPageIndex();
      widget.onPageSwiped?.call(currentIndex);
    }
  }

  void onHorizontalEnd(DragEndDetails details) {
    if (canMove) {
      checkLeft(
        () => setState(() {
          left = 0;
        }),
      );
    }
  }

  void reduceCurrentPageIndex() {
    setState(() {
      currentIndex = currentIndex == 0 ? 0 : currentIndex - 1;
      left = 0;
      shoudlAnimated = false;
    });
  }
}
