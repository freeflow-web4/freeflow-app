import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'flower_exchange_controller.g.dart';

FlowerExchangeController findFlowerExchangeController() =>
    GetIt.I.get<FlowerExchangeController>();

class FlowerExchangeController = _FlowerExchangeControllerBase
    with _$FlowerExchangeController;

abstract class _FlowerExchangeControllerBase with Store {


  @action
  onTapFlowerExchange(TranscriptEntity transcriptEntity){
    print('id: ${transcriptEntity.id}');
  }



}
