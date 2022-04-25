import 'package:flutter/cupertino.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';


class WalletUtil {
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
    //FLOWER EXCHANGE
    TranscriptEntity(
      id: '',
      viewed: false,
      amount: '102',
      category: 'flower_exchange',
      createdAt: '6 ds 21h',
      gratitudeType: 'received',
      userName: 'fulano',
      exchangeUsername: 'ciclano A',
      photoUrl: 'https://picsum.photos/250?image=9',
    ),
    TranscriptEntity(
      id: '',
      viewed: true,
      amount: '12',
      category: 'flower_exchange',
      createdAt: '6 ds 21h',
      gratitudeType: 'sent',
      exchangeUsername: 'ciclano B',
      userName: 'fulano',

    ),


    //GRATITUDE
    TranscriptEntity(
      id: '',
      viewed: false,
      amount: '102',
      category: 'gratitude',
      createdAt: '6 ds 21h',
      gratitudeType: 'NFT',
      userName: 'fulano',
    ),
    TranscriptEntity(
      id: '',
      viewed: false,
      amount: '102',
      category: 'gratitude',
      createdAt: '6 ds 21h',
      gratitudeType: 'welcome',
      userName: 'fulano',
    ),
    TranscriptEntity(
      id: '',
      viewed: true,
      amount: '102',
      category: 'gratitude',
      createdAt: '6 ds 21h',
      gratitudeType: 'quest',
      userName: 'fulano',
    ),



    TranscriptEntity(
      id: '',
      viewed: false,
      amount: '666',
      category: 'interactions',
      createdAt: '6 ds 21h',
      userName: 'fulano',
    ),
    TranscriptEntity(
      id: '',
      viewed: true,
      amount: '999',
      category: 'interactions',
      createdAt: '6 ds 21h',
      userName: 'fulano',
    ),
  ];

  static String getInternationalizedFilterName(
    BuildContext context,
    String name,
  ) {
    switch (name) {
      case "gratitude":
        {
          return TranslationService.translate(
            context,
            'wallet.gratitude',
          );
        }

      case "inter_action":
        {
          return TranslationService.translate(
            context,
            'wallet.interAction',
          );
        }
      case "flower_exchange":
        {
          return TranslationService.translate(
            context,
            'wallet.flowerExchange',
          );
        }
      default:
        {
          return name;
        }
    }
  }
}
