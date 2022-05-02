import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/assets_constants.dart';

class WalletBackgroundImage extends StatelessWidget {
  const WalletBackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Opacity(
        opacity: 0.15,
        child: Image.asset(
          ImagesAsset.background,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
