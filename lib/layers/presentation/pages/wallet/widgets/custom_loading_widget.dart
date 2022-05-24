import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/layers/presentation/widgets/loading_widget.dart';

class CustomLoadingWidget extends StatelessWidget {
  final Color? color;
  const CustomLoadingWidget({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: LoadingWidget(
          color: color,
          isLoading: true,
          size: 30,
          padding: const EdgeInsets.only(left: normalSpacing),
        ),
      ),
    );
  }
}
