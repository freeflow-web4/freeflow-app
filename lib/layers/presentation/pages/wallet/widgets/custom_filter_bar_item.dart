import 'package:flutter/material.dart';

class CustomFilterBarItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: height ?? 20,
        padding: tabMargin ?? const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              tabName,
              style: const TextStyle(
                  fontFamily: 'Akrobat',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            customIndicator(isActive: isSelected)
          ],
        ),
      ),
    );
  }

  Widget customIndicator({
    required bool isActive,
    List<Color>? colors,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      height: isSelected ? 3 : 0,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: colors ??
              [
                const Color(0xffDE83E0).withOpacity(0.6),
                const Color(0xff32B4FF).withOpacity(0.6),
              ],
        ),
      ),
    );
  }
}
