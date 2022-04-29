import 'package:flutter/material.dart';
import 'package:freeflow/layers/presentation/helpers/dialog/show_dialog_default.dart';

class CollectiblesView extends StatefulWidget {

  const CollectiblesView({Key? key,}) : super(key: key);

  @override
  State<CollectiblesView> createState() => _CollectiblesViewState();
}

class _CollectiblesViewState extends State<CollectiblesView> {

  @override
  void initState() {
    showDialogFeatureNotAvailable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }

  void showDialogFeatureNotAvailable() {
    showDialogDefault(
      context,
      automaticallyCloses: true,
      type: DialogType.featureNotAvailable,
      onTap: () {},
    );
  }

}
