import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/domain/usecases/get_transcript/get_transcript_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'flower_exchange_controller.g.dart';

FlowerExchangeController findFlowerExchangeController() =>
    GetIt.I.get<FlowerExchangeController>();

class FlowerExchangeController = _FlowerExchangeControllerBase
    with _$FlowerExchangeController;

abstract class _FlowerExchangeControllerBase with Store {
  GetTranscriptUsecase getTranscriptUsecase = GetIt.I.get<GetTranscriptUsecase>();

  @observable
  late TranscriptEntity transcriptEntity;


  @action
  Future<bool> onTapFlowerExchange(TranscriptEntity transcriptEntity) async {
    final response = await getTranscriptUsecase.call(id: transcriptEntity.id, status: '1');
    bool status = true;
    response.fold(
          (l) => status =  false,
          (r) => transcriptEntity = r,
    );
    return status;

  }





}
