import 'package:freeflow/layers/domain/entities/transcript_details_entity.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/domain/usecases/get_transcript_details/get_transcript_details_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'interaction_controller.g.dart';

InteractionController findInteractionController() => GetIt.I.get<InteractionController>();

class InteractionController = _InteractionControllerBase with _$InteractionController;

abstract class _InteractionControllerBase with Store {
  GetTranscriptDetailsUsecase getTranscriptDetails = GetIt.I.get<GetTranscriptDetailsUsecase>();

  @observable
  TranscriptDetailsEntity? transcriptDetailsEntity;
  @observable
  bool loading = false;

  @action
  Future<bool> onTapInteraction(TranscriptEntity transcriptEntity) async {
    loading = true;
    final response = await getTranscriptDetails.call(id: transcriptEntity.id, status: '0');
    bool status = true;
    response.fold(
          (l) => status =  false,
          (r) => transcriptDetailsEntity = r,
    );
    loading = false;
    return status;
  }


}
