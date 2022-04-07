import 'package:flutter/material.dart';
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

class _CustomFilterBarItemState extends State<CustomFilterBarItem> with TextThemes {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Container(
        height: widget.height ?? 26,
        padding: widget.tabMargin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            button2(context, text: widget.tabName, color: Colors.grey),
            customIndicator(isActive: widget.isSelected)
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
      height: widget.isSelected ? 3 : 0,
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
