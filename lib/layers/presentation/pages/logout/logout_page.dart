import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/adaptative_size.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/layers/presentation/pages/logout/views/auth/logout_auth_view.dart';
import 'package:freeflow/layers/presentation/pages/logout/views/confirm/logout_confirm_view.dart';
import 'package:freeflow/layers/presentation/widgets/animated_arrow_right_widget.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/flexible_vertical_spacer.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/in_app_keyboard/in_app_keyboard_widget.dart';
import 'package:freeflow/layers/presentation/widgets/loading_widget.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  //TODO: create controller

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.8,
      //TODO: add logic here
      child: false ? const LogoutAuthView() : const LogoutConfirmView(),
    );
  }
}
