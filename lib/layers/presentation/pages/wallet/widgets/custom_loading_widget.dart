import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/layers/presentation/widgets/loading_widget.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: LoadingWidget(
          isLoading: true,
          size: 30,
          padding: EdgeInsets.only(left: normalSpacing),
        ),
      ),
    );
  }
}
