import 'package:flutter/material.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/private_key/confirm_key/create_wallet_private_key_confirm_state.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/views/private_key/show_key/create_wallet_private_key_show_state_page.dart';

class CreateWalletPrivateKeyView extends StatefulWidget {
  final bool isCurrent;
  final void Function() onValid;
  final String privateKey;
  const CreateWalletPrivateKeyView({
    Key? key,
    required this.isCurrent,
    required this.onValid,
    required this.privateKey,
  }) : super(key: key);

  @override
  State<CreateWalletPrivateKeyView> createState() =>
      _CreateWalletPrivateKeyViewState();
}

class _CreateWalletPrivateKeyViewState
    extends State<CreateWalletPrivateKeyView> {
  int currentState = 0;

  bool get isShowState => currentState == 0;

  bool animateOnStart = true;

  @override
  Widget build(BuildContext context) {
    return isShowState
        ? CreateWalletPrivateKeyShowView(
            privateKey: widget.privateKey,
            onConfirm: _goToConfirmState,
            animateOnStart: animateOnStart,
          )
        : CreateWalletPrivateKeyConfirmView(
            privateKey: widget.privateKey,
            onValid: () {
              //TODO: add logic
            },
          );
  }

  void _goToShowState() {
    setState(() {
      animateOnStart = false;
      currentState = 0;
    });
  }

  void _goToConfirmState() {
    setState(() {
      animateOnStart = false;
      currentState = 1;
    });
  }
}
