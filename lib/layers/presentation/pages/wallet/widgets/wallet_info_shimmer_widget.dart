import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/wallet/controller/wallet/wallet_controller.dart';
import 'package:freeflow/layers/presentation/widgets/custom_action_card.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/spacing_constants.dart';

class WalletInfoShimmerWidget extends StatelessWidget with TextThemes {
  final WalletController walletController;

  const WalletInfoShimmerWidget({Key? key, required this.walletController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomActionCard(
      cardHeight: walletController.walletIsLoading ? 195 : 172,
      cardWidth: double.infinity,
      isLoading: walletController.walletIsLoading,
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            mdSpacing,
            walletController.walletIsLoading ? 0 : mdSpacing,
            mdSpacing,
            mdSpacing,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                direction: ShimmerDirection.ltr,
                baseColor: StandardColors.baseShimmer,
                highlightColor: StandardColors.highlightShimmer,
                child: Container(
                  height: 42,
                  width: 93,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.red,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              textSubtitle2(
                context,
                textKey: 'wallet.totalAmount',
                color: StandardColors.textMediumGrey.withOpacity(0.6),
              ),
            ],
          ),
        ),
      ),
      onTapLeftAction: () {},
      onTapRighAction: () {},
      leftTextAction: 'wallet.deposit',
      rightTextAction: 'wallet.exchange',
    );
  }
}
