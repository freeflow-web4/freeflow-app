import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

class OnOffButtonSwipe extends StatefulWidget {
  final bool value;
  final void Function(bool value) onChanged;
  final Color ballColor;


  const OnOffButtonSwipe({
    required this.value,
    required this.ballColor,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<OnOffButtonSwipe> createState() => _OnOffButtonSwipeState();
}

class _OnOffButtonSwipeState extends State<OnOffButtonSwipe> with TextThemes {
  static const _circleSize = 19.0;
  static const _animationDuration = 200;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onChanged(!widget.value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: _animationDuration),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: widget.value ? StandardColors.greenGradient() :
          const LinearGradient(colors:[StandardColors.grey79, StandardColors.grey79] ),
        ),
        padding: const EdgeInsets.all(3),
        child: SizedBox(
          width: 51,
          height: 22,
          child: Stack(
            children: [
              AnimatedAlign(
                duration: const Duration(milliseconds: _animationDuration),
                alignment:
                widget.value ? Alignment.centerRight : Alignment.centerLeft,
                curve: Curves.ease,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.ballColor,
                  ),
                  width: _circleSize,
                  height: _circleSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
