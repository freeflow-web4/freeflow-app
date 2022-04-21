import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/domain/usecases/get_transcripts/get_transcripts_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'transcripts_widget_controller.g.dart';


enum ViewState { loading, done, error }

class TranscriptsWidgetController = TranscriptsWidgetControllerBase with _$TranscriptsWidgetController;

abstract class TranscriptsWidgetControllerBase with Store {
  GetTranscriptsUsecase getTranscriptsUsecase =
  GetIt.I.get<GetTranscriptsUsecase>();

  int page = 0;

  @observable
  ViewState transcriptViewState = ViewState.loading;
  @observable
  List<TranscriptEntity> transcripts = [];




  @action
  Future<void> getTranscripts() async {
    transcriptViewState = ViewState.loading;
    page = 0;
    final response = await getTranscriptsUsecase.call(offset: 0);

    response.fold(
          (l) => transcriptViewState = ViewState.error,
          (r) {
        transcripts = r;
        transcriptViewState = ViewState.done;
      },
    );
  }

  @action
  Future<void> refreshData() async {
    try {
      transcriptViewState = ViewState.loading;
      await getTranscripts();
      transcriptViewState = ViewState.done;
    } catch (e) {
      transcriptViewState = ViewState.error;
    }
  }


}