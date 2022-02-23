import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  const SecondaryButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.padding,
  }) : super(key: key);

  static const borderColor = Color(0xFF828282);
  static const backgroundColor = Color(0xFF4F4F4F);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(200), //_borderRadius,
      child: TextButton(
        onPressed: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: backgroundColor,
            border: Border.all(
              width: 2,
              color: borderColor,
            ),
          ),
          padding: padding,
          child: child,
        ),
      ),
    );
  }

  BorderRadius get _borderRadius => BorderRadius.circular(
        20,
      );
}
