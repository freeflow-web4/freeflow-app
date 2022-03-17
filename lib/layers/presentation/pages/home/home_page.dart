import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/auth/widgets/black_page_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, TextThemes {
  late final animatedController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  );

  late final textOpacity = Tween<double>(begin: 0, end: 1).animate(
    CurvedAnimation(
      parent: animatedController,
      curve: Curves.linear,
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animatedController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BlackScaffold(
      child: Center(
        child: AnimatedText(
          text: 'Home Page',
          style: textH4TextStyle,
          animation: textOpacity,
          animationController: animatedController,
        ),
      ),
    );
  }
}
