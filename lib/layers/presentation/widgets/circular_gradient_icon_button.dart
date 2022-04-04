import 'package:flutter/material.dart';

class CircularGradientIconButton extends StatelessWidget {
  final List<Color>? colorList;
  final Widget child;
  final double? size;
  final Function onTap;
  final bool isSelected;
  final EdgeInsets? margin;
  const CircularGradientIconButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.colorList,
    this.size,
    this.isSelected = false,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: () => onTap(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: getRecalculatedSize,
              width: getRecalculatedSize,
              decoration: isSelected
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: colorList ??
                            [
                              const Color(0xffDE83E0).withOpacity(0.6),
                              const Color(0xff32B4FF).withOpacity(0.6),
                            ],
                      ),
                    )
                  : const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
            ),
            Container(
              height: size,
              width: size,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: child,
            )
          ],
        ),
      ),
    );
  }

  double get getRecalculatedSize => (size ?? 22) + (size ?? 22) * 0.25;
}
