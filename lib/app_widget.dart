import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'layers/presentation/pages/recover_account_loading/recover_account_loading_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FreeFlow',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetIt.instance.get<RecoverAccountLoadingPage>(),
    );
  }
}
