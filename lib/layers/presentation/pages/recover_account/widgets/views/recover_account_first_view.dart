import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/recover_account/controller/recover_account_controller.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';

class RecoverAccountFirstView extends StatefulWidget {
  final bool showfirstViewFirstTextOpacity;
  final bool showfirstViewSecondTextOpacity;
  final bool showfirstViewTextFieldOpacity;
  final RecoverAccountController recoverAccountController;

  const RecoverAccountFirstView({
    Key? key,
    required this.showfirstViewFirstTextOpacity,
    required this.showfirstViewSecondTextOpacity,
    required this.showfirstViewTextFieldOpacity,
    required this.recoverAccountController,
  }) : super(key: key);

  @override
  _RecoverAccountFirstViewState createState() =>
      _RecoverAccountFirstViewState();
}

class _RecoverAccountFirstViewState extends State<RecoverAccountFirstView>
    with TextThemes {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 104),
              AnimatedOpacity(
                opacity: widget.showfirstViewFirstTextOpacity ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: textH4(
                  context,
                  textKey: "recoverAccount.hello",
                  color: Colors.white,
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: mdSpacingx2),
              AnimatedOpacity(
                opacity: widget.showfirstViewSecondTextOpacity ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: textH4(
                  context,
                  textKey: "recoverAccount.enterFlowerName",
                  color: Colors.white,
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: mdSpacingx2),
              GradientTextFieldWidget(
                hintText:
                    FlutterI18n.translate(context, "recoverAccount.flowerName"),
                showTextField: widget.showfirstViewTextFieldOpacity,
                errorText: null,
              ),
            ],
          ),
        );
      },
    );
  }
}
