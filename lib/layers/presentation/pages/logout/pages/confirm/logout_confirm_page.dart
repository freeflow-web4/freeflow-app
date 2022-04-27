import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/infra/route/route_response.dart';
import 'package:freeflow/layers/presentation/widgets/elevated_text_button.dart';
import 'package:freeflow/layers/presentation/widgets/flexible_vertical_spacer.dart';
import 'package:freeflow/layers/presentation/widgets/onoff_switcher_widget.dart';
import 'package:freeflow/layers/presentation/widgets/outline_button.dart';
import 'package:freeflow/routes/routes.dart';

class LogoutConfirmPage extends StatefulWidget {
  const LogoutConfirmPage({Key? key}) : super(key: key);

  @override
  State<LogoutConfirmPage> createState() => _LogoutConfirmPageState();
}

class _LogoutConfirmPageState extends State<LogoutConfirmPage> with TextThemes {
  bool confirm = true;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        confirm = !confirm;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const FlexibleVerticalSpacer(height: largeSpacing),
          OnOffSwitcher(
            value: confirm,
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
                onPressed: onConfirm,
              ),
              ElevatedTextButton.withTextKey(
                textKey: 'logout.cancelButton',
                onPressed: onCancel,
              ),
            ],
          ),
          const FlexibleVerticalSpacer(height: mdSpacingx2),
        ],
      ),
    );
  }

  void onCancel() {
    Routes.instance.pop();
  }

  void onConfirm() {
    Routes.instance.pop(data: const RouteResponse(body: true));
  }
}
