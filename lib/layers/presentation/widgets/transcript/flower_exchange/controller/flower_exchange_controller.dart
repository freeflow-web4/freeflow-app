import 'package:flutter/services.dart';
import 'package:freeflow/layers/domain/entities/transcript_details_entity.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/domain/usecases/get_transcript_details/get_transcript_details_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'flower_exchange_controller.g.dart';

FlowerExchangeController findFlowerExchangeController() =>
    GetIt.I.get<FlowerExchangeController>();

class FlowerExchangeController = _FlowerExchangeControllerBase
    with _$FlowerExchangeController;

abstract class _FlowerExchangeControllerBase with Store {
  GetTranscriptDetailsUsecase getTranscriptDetails = GetIt.I.get<GetTranscriptDetailsUsecase>();

  @observable
  TranscriptDetailsEntity? transcriptDetailsEntity;
  @observable
  bool loading = false;

  @action
  Future<bool> onTapFlowerExchange(TranscriptEntity transcriptEntity) async {
    loading = true;
    final response = await getTranscriptDetails.call(id: transcriptEntity.id, status: '1');
    bool status = true;
    response.fold(
          (l) => status =  false,
          (r) => transcriptDetailsEntity = r,
    );
    loading = false;
    return status;

  }

  void copyText(String text) =>
      Clipboard.setData(ClipboardData(text: text));

}
