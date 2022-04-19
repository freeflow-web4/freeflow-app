import 'package:flutter/material.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/domain/usecases/transcript_get_list/get_transcript_list_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'wallet_controller.g.dart';

enum ViewContentType { transcript, flwr, collectibles }
enum ViewState { start, loading, done, error }

class WalletController = WalletControllerBase with _$WalletController;

abstract class WalletControllerBase with Store {
  @observable
  int index = 0;

  @observable
  ViewState trasncriptViewState = ViewState.start;

  @observable
  ViewState walletViewState = ViewState.start;

  String? selectedFilterOption;

  @observable
  ViewContentType viewContentType = ViewContentType.transcript;

  GetTranscripListUsecase getTranscripListUsecase =
      GetIt.I.get<GetTranscripListUsecase>();

  @action
  Future<List<TranscriptEntity>> getTranscriptList() async {
    late List<TranscriptEntity> transcriptList;
    trasncriptViewState = ViewState.loading;
    final response = await getTranscripListUsecase.call(offset: 5);
    trasncriptViewState = ViewState.done;

    response.fold(
      (l) => trasncriptViewState = ViewState.error,
      (r) => transcriptList = r,
    );

    return transcriptList;
  }

  @action
  Future<void> refreshData() async {
    try {
      walletViewState = ViewState.loading;
      await getTranscriptList();
      walletViewState = ViewState.done;
    } catch (e) {
      walletViewState = ViewState.error;
    }
  }
}
