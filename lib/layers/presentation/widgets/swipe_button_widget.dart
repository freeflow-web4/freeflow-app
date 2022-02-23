import 'package:flutter/material.dart';

class SwipeButton extends StatefulWidget {
  final void Function() onSwipe;
  const SwipeButton({
    Key? key,
    required this.onSwipe,
  }) : super(key: key);

  @override
  State<SwipeButton> createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
