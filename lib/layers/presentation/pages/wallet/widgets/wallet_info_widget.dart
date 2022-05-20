import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/wallet/controller/transcripts/transcripts_widget_controller.dart';
import 'package:freeflow/layers/presentation/pages/wallet/controller/wallet/wallet_controller.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/custom_loading_widget.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/total_amount_text.dart';
import 'package:freeflow/layers/presentation/widgets/custom_action_card.dart';

class WalletInfoWidget extends StatelessWidget with TextThemes {
  final WalletController walletController;
  final TranscriptsWidgetController transcriptController;
  final Function onTapLeftAction;
  final Function onTapRighAction;

  const WalletInfoWidget({
    Key? key,
    required this.walletController,
    required this.transcriptController,
    required this.onTapLeftAction,
    required this.onTapRighAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: mdSpacingx2,
        right: mdSpacingx2,
        top: largeSpacingx2,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              walletController.refreshData();
              transcriptController.refreshData();
            },
            child: Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(
                bottom: normalSpacing,
              ),
              child: textH6(
                context,
                textKey: 'wallet.wallet',
                isUpperCase: true,
              ),
            ),
          ),
          //TODO: awaiting data from backend (ThreeFold)
          Observer(
            builder: (context) {
              return CustomActionCard(
                cardHeight: walletController.walletIsLoading ? 195 : 172,
                cardWidth: double.infinity,
                isLoading: walletController.walletIsLoading,
                child: TotalAmountText(
                  totalAmount: '1111',
                  padding: EdgeInsets.fromLTRB(
                    mdSpacing,
                    walletController.walletIsLoading ? 0 : mdSpacing,
                    mdSpacing,
                    mdSpacing,
                  ),
                ),
                onTapLeftAction: onTapLeftAction,
                onTapRighAction: onTapRighAction,
                leftTextAction: 'wallet.deposit',
                rightTextAction: 'wallet.exchange',
              );
            },
          ),
          const SizedBox(
            height: normalSpacing,
          )
        ],
      ),
    );
  }
}
