import 'package:flutter/material.dart';
import 'package:freeflow/layers/presentation/pages/auth/widgets/keyboard_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          KeyBoard(),
        ],
      ),
    );
  }
}
