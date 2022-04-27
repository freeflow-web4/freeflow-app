import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/layers/presentation/pages/fullscreen_alert_dialog/fullscreen_alert_dialog.dart';

Future showCustomDialog(
  BuildContext context, {
  required String textKey,
  String? icon = '',
  String? secondaryTextKey = '',
}) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext context, animation1, animation2) {
      return FullScreenAlertDialog(
        textKey: FlutterI18n.translate(
          context,
          textKey,
        ),
        icon: icon == '' ? null : icon,
        secondaryTextKey: secondaryTextKey == '' ? null : secondaryTextKey,
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
