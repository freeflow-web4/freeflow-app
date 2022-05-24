import 'package:flutter/material.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/wallet_loading_widget.dart';
import 'package:freeflow/layers/presentation/widgets/custom_rounded_card.dart';
import 'package:freeflow/layers/presentation/widgets/transcript/flower_exchange/flower_exchange_widget.dart';
import 'package:shimmer/shimmer.dart';

class TranscriptShimmerWidget extends StatelessWidget {
  final bool isLoading;

  const TranscriptShimmerWidget({Key? key, required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomRoundedCard(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(normalSpacing),
          topRight: Radius.circular(normalSpacing),
        ),
        boxShadow: const [],
        margin: EdgeInsets.zero,
        width: double.infinity,
        child: Column(
          children: [
            WalletLoadingWidget(
              isLoading: isLoading,
              paddingTop: normalSpacing,
              paddingLeft: huge6Spacing,
            ),
            Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              baseColor: StandardColors.baseShimmer,
              highlightColor: StandardColors.highlightShimmer,
              child: FlowerExchangeWidget(
                transcriptEntity: TranscriptEntity(
                  id: '',
                  viewed: true,
                  category: '',
                  createdAt: 'createdAt',
                  receiverUsername: 'receiverUsername',
                  receiverPhotoUrl: 'receiverPhotoUrl',
                  receiverDisplayName: 'receiverDisplayName',
                  senderUsername: 'senderUsername',
                  senderDisplayName: 'senderDisplayName',
                  senderPhotoUrl: 'senderPhotoUrl',
                  transferAction: '',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
