import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

class OnOffSwitcher extends StatefulWidget {
  final bool value;
  final void Function(bool value)? onChanged;
  const OnOffSwitcher({
    required this.value,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<OnOffSwitcher> createState() => _OnOffSwitcherState();
}

class _OnOffSwitcherState extends State<OnOffSwitcher> with TextThemes {
  static const _borderRadius = 20.0;
  static const _circleSize = 30.0;
  static const _animationDuration = 200;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onChanged != null
          ? () => widget.onChanged?.call(!widget.value)
          : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: _animationDuration),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            _borderRadius,
          ),
          color: widget.value ? StandardColors.success : StandardColors.error,
        ),
        padding: const EdgeInsets.all(5),
        child: SizedBox(
          width: 110,
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: widget.value,
                          child: Text(
                            "ON",
                            style: textSubtitle3Style(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: !widget.value,
                          child: Text(
                            "OFF",
                            style: textSubtitle3Style(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AnimatedAlign(
                duration: const Duration(milliseconds: _animationDuration),
                alignment:
                    widget.value ? Alignment.centerRight : Alignment.centerLeft,
                curve: Curves.ease,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
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
