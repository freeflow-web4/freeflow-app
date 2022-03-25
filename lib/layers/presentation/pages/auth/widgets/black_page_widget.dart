import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

class BlackScaffold extends StatelessWidget {
  final Widget child;
  final Widget? floatingActionButton;
  const BlackScaffold({
    Key? key,
    required this.child,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StandardColors.backgroundDark,
      body: child,
      floatingActionButton: floatingActionButton,
    );
  }
}
