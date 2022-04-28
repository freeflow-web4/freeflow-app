import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/layers/presentation/pages/fullscreen_alert_dialog/fullscreen_alert_dialog.dart';

Future showCustomDialog(
  BuildContext context, {
  String? textKey,
  String? text,
  String? icon = '',
  String? secondaryTextKey,
  String? secondaryText,
  Widget? body,
  SecondaryTextPosition secondaryTextPosition = SecondaryTextPosition.bottom,
}) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext context, animation1, animation2) {
      return FullScreenAlertDialog(
        body: body,
        textKey: textKey,
        text: text,
        icon: icon == '' ? null : icon,
        secondaryTextKey: secondaryTextKey == '' ? null : secondaryTextKey,
        secondaryText: secondaryText,
        secondaryTextPosition: secondaryTextPosition,
      );
    },
  );
}

Future<void> showConnectionErrorDialog(BuildContext context) =>
    showCustomDialog(
      context,
      textKey: 'recoverAccount.pleaseEnterYourRegisteredName',
      secondaryTextKey: 'domainError.pleaseCheckConnection',
      icon: IconsAsset.noConnectionFound,
    );
