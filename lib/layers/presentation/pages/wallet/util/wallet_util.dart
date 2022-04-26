import 'package:flutter/cupertino.dart';
import 'package:freeflow/core/translation/translation_service.dart';


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

      case "interactions":
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
