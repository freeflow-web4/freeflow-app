import 'package:flutter/material.dart';
import 'package:freeflow/layers/presentation/helpers/dialog/show_dialog_default.dart';

class FlwrView extends StatefulWidget {

  const FlwrView({Key? key,}) : super(key: key);

  @override
  State<FlwrView> createState() => _FlwrViewState();
}

class _FlwrViewState extends State<FlwrView> {

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
    Future.delayed(Duration.zero,() async {
      showDialogDefault(
        context,
        automaticallyCloses: true,
      type: DialogType.featureNotAvailable,
      onTap: () {},
    );
    });
  }

}
