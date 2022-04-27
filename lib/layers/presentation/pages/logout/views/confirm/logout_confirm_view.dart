import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/flexible_vertical_spacer.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/in_app_keyboard/in_app_keyboard_widget.dart';
import 'package:freeflow/layers/presentation/widgets/loading_widget.dart';
import 'package:freeflow/layers/presentation/widgets/outline_button.dart';
import 'package:freeflow/layers/presentation/widgets/secondary_button.dart';

class LogoutConfirmView extends StatefulWidget {
  const LogoutConfirmView({Key? key}) : super(key: key);

  @override
  State<LogoutConfirmView> createState() => _LogoutConfirmViewState();
}

class _LogoutConfirmViewState extends State<LogoutConfirmView> with TextThemes {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //const FlexibleVerticalSpacer(height: mdSpacing),
        //TODO: create switcher
        const Text(
          "Switcher here",
          style: TextStyle(color: Colors.black),
        ),
        //const FlexibleVerticalSpacer(height: mdSpacing),
        textSubtitle1(
          context,
          textKey: "logout.warning",
        ),
        //const FlexibleVerticalSpacer(height: mdSpacing),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlineTextButton.withTextKey(
              textKey: 'logout.confirmButton',
            ),
            OutlineTextButton.withTextKey(
              textKey: 'logout.confirmButton',
            ),
          ],
        ),
        //const FlexibleVerticalSpacer(height: bigSpacing),
      ],
    );
  }
}
