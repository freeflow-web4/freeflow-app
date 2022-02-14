import 'package:flutter/material.dart';
import 'package:freeflow/layers/data/datasources/remote/user_login_datasource_imp.dart';
import 'package:freeflow/layers/data/repositories/user_recover_login_repository_imp.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_recover_login_usecase_imp.dart';
import 'package:freeflow/layers/presentation/controllers/user_controller.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserController userController = GetIt.I.get<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
