import 'package:flutter/material.dart';
import 'package:freeflow/layers/presentation/helpers/dialog/system_instability.dart';

import 'feature_not_available.dart';
import 'no_internet_warning.dart';

enum DialogType {
  noInternetConnection,
  systemInstability,
  featureNotAvailable,}

Future<dynamic> showDialogDefault(BuildContext context, {
  required DialogType type,
  required void Function() onTap,
  bool barrierDismissible = true,
}) {
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return GestureDetector(
        onTap: onTap,
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          content: getPage(type),
        ),
      );
    },
  );
}

Widget getPage(DialogType type){
  switch(type){
    case DialogType.noInternetConnection:
      return const NoInternetWarning();
    case DialogType.systemInstability:
      return const SystemInstability();
    case DialogType.featureNotAvailable:
      return const FeatureNotAvailable();
  }
}


