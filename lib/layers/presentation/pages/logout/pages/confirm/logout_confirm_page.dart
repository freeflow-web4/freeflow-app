import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/widgets/animated_float_button_widget.dart';
import 'package:freeflow/layers/presentation/widgets/elevated_text_button.dart';
import 'package:freeflow/layers/presentation/widgets/flexible_vertical_spacer.dart';
import 'package:freeflow/layers/presentation/widgets/gradient_text_field_widget.dart';
import 'package:freeflow/layers/presentation/widgets/in_app_keyboard/in_app_keyboard_widget.dart';
import 'package:freeflow/layers/presentation/widgets/loading_widget.dart';
import 'package:freeflow/layers/presentation/widgets/onoff_switcher_widget.dart';
import 'package:freeflow/layers/presentation/widgets/outline_button.dart';
import 'package:freeflow/layers/presentation/widgets/secondary_button.dart';
import 'package:freeflow/routes/routes.dart';

class LogoutConfirmPage extends StatefulWidget {
  const LogoutConfirmPage({Key? key}) : super(key: key);

  @override
  State<LogoutConfirmPage> createState() => _LogoutConfirmPageState();
}

class _LogoutConfirmPageState extends State<LogoutConfirmPage> with TextThemes {
  bool confirm = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const FlexibleVerticalSpacer(height: largeSpacing),
          //TODO: create switcher
          OnOffSwitcher(
            value: confirm,
            onChanged: (value) {
              setState(() {
                confirm = value;
              });
            },
          ),
          const FlexibleVerticalSpacer(height: largeSpacing),
          textSubtitle1(
            context,
            textKey: "logout.warning",
          ),
          const FlexibleVerticalSpacer(height: huge5Spacing * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlineTextButton.withTextKey(
                textKey: 'logout.confirmButton',
              ),
              ElevatedTextButton.withTextKey(
                textKey: 'logout.cancelButton',
                onPressed: cancel,
              ),
            ],
          ),
          const FlexibleVerticalSpacer(height: mdSpacingx2),
        ],
      ),
    );
  }

  void cancel() {
    Routes.instance.pop();
  }
}
