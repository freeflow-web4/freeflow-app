import 'package:flutter/cupertino.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';

import '../../../../../core/translation/translation_service.dart';

class WalletConstants {
  static transcriptFilters(BuildContext context) {
    return [
      TranslationService.translate(
        context,
        'wallet.all',
      ),
      TranslationService.translate(
        context,
        'wallet.gratitude',
      ),
      TranslationService.translate(
        context,
        'wallet.flowerExchange',
      ),
      TranslationService.translate(
        context,
        'wallet.interAction',
      ),
      TranslationService.translate(
        context,
        'wallet.networkUpdates',
      ),
      TranslationService.translate(
        context,
        'wallet.clearSelection',
      ),
    ];
  }

  static final List<TranscriptEntity> transcriptsMocked = [
    TranscriptEntity(
      amount: '102',
      category: 'flower_exchange',
      createdAt: '6 ds 21h',
      gratitudeType: 'NFT',
      userName: 'fulano',
    ),
    TranscriptEntity(
      amount: '102',
      category: 'inter_action',
      createdAt: '6 ds 21h',
      gratitudeType: 'NFT',
      userName: 'fulano',
    ),
    TranscriptEntity(
      amount: '102',
      category: 'inter_action',
      createdAt: '6 ds 21h',
      gratitudeType: 'NFT',
      userName: 'fulano',
    ),
  ];
}
