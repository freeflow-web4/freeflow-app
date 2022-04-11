import 'package:flutter/material.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../domain/usecases/transcript_get_list/get_transcript_list_usecase.dart';

part 'wallet_controller.g.dart';

enum ViewContentType { transcript, flwr, collectibles }
enum ViewState { start, loading, done, error }

class WalletController = WalletControllerBase with _$WalletController;

abstract class WalletControllerBase with Store {
  @observable
  int index = 0;

  @observable
  ViewState viewState = ViewState.start;

  String? selectedFilterOption;

  @observable
  ViewContentType viewContentType = ViewContentType.transcript;

  GetTranscripListUsecase getTranscripListUsecase =
      GetIt.I.get<GetTranscripListUsecase>();

  @action
  Future<List<TranscriptEntity>> getTranscriptList() async {
    late List<TranscriptEntity> transcriptList;
    viewState = ViewState.loading;
    final response = await getTranscripListUsecase.call(offset: 5);
    viewState = ViewState.done;

    response.fold(
      (l) => viewState = ViewState.error,
      (r) => transcriptList = r,
    );

    return transcriptList;
  }

  @action
  List<String> getCategoryList(
    BuildContext context,
    List<TranscriptEntity> transcripts,
  ) {
    viewState = ViewState.loading;
    List<String> categoryList = [];
    if (categoryList.isEmpty) {
      categoryList.add('All');
    }
    for (int i = 0; i < transcripts.length; i++) {
      if (!categoryList.contains(
        getinternationalizedFilterName(context, transcripts[i].category),
      )) {
        categoryList.add(
          getinternationalizedFilterName(context, transcripts[i].category),
        );
      }
    }
    categoryList.add(
      TranslationService.translate(
        context,
        'wallet.networkUpdates',
      ),
    );
    categoryList.add(
      TranslationService.translate(
        context,
        'wallet.clearSelection',
      ),
    );
    viewState = ViewState.done;

    return categoryList;
  }

  String getinternationalizedFilterName(BuildContext context, String name) {
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
