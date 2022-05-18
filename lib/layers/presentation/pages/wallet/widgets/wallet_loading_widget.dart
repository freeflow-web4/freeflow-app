import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/custom_loading_widget.dart';

class WalletLoadingWidget extends StatelessWidget {
  final bool isLoading;
  final double paddingTop;
  final double paddingLeft;

  const WalletLoadingWidget({
    Key? key,
    required this.isLoading,
    required this.paddingTop,
    required this.paddingLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Visibility(
        child: Padding(
          padding: EdgeInsets.only(top: paddingTop, left: paddingLeft),
          child: const CustomLoadingWidget(
            color: StandardColors.lightGrey2,
          ),
        ),
        visible: isLoading,
      ),
    );
  }
}
