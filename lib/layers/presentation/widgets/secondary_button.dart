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

  static const borderColor = Color(0xFF797D83);
  static const backgroundColor = Color(0xFF4F4F4F);
  static const borderRadius = 20.0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: child,
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        padding: MaterialStateProperty.all(padding),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              25,
            ),
            side: const BorderSide(
              color: borderColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
