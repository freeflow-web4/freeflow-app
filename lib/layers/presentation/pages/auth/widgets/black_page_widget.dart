import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';

class BlackScaffold extends StatelessWidget {
  final Widget child;
  final Widget? floatingActionButton;
  final bool? resizeToAvoidBottomInset;
  const BlackScaffold({
    Key? key,
    required this.child,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: StandardColors.backgroundDark,
      body: child,
      floatingActionButton: floatingActionButton,
    );
  }
}
