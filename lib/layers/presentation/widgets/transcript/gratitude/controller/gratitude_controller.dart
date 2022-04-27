import 'package:flutter/services.dart';
import 'package:freeflow/layers/domain/entities/transcript_details_entity.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/domain/usecases/get_transcript_details/get_transcript_details_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'gratitude_controller.g.dart';

GratitudeController findGratitudeController() => GetIt.I.get<GratitudeController>();

class GratitudeController = _GratitudeControllerBase with _$GratitudeController;

abstract class _GratitudeControllerBase with Store {
  GetTranscriptDetailsUsecase getTranscriptDetails = GetIt.I.get<GetTranscriptDetailsUsecase>();

  @observable
  TranscriptDetailsEntity? transcriptDetailsEntity;
  @observable
  bool loading = false;

  @action
  Future<bool> onTapGratitude(TranscriptEntity transcriptEntity) async {
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

  void copyText(String text) => Clipboard.setData(ClipboardData(text: text));

}
