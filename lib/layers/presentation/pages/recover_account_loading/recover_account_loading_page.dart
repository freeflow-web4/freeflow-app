import 'package:flutter/material.dart';

import 'controller/recover_account_loading_controller.dart';
import 'widgets/recover_account_loading_widget.dart';

class RecoverAccountLoadingPage extends StatefulWidget {
  final RecoverAccountLoadingController recoverAccountLoadingController;
  const RecoverAccountLoadingPage(
      {Key? key, required this.recoverAccountLoadingController})
      : super(key: key);
  @override
  _RecoverAccountLoadingPageState createState() =>
      _RecoverAccountLoadingPageState();
}

class _RecoverAccountLoadingPageState extends State<RecoverAccountLoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: RecoverAccountLoadingWidget(
        recoverAccountController: widget.recoverAccountLoadingController,
      ),
    );
  }
}
