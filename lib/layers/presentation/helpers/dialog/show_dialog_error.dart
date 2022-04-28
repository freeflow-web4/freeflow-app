import 'package:flutter/material.dart';
import 'package:freeflow/layers/presentation/helpers/dialog/show_dialog_default.dart';
import 'package:freeflow/routes/routes.dart';

void showDialogError(BuildContext context) {
  showDialogDefault(
    context,
    type: DialogType.systemInstability,
    onTap: () {
      Navigator.of(context).pop();
      Routes.instance.pop();
    },
  );
}
