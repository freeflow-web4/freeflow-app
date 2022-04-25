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
  @observable
  bool loadingMoreTranscripts = false;
  @observable
  bool hasMoreTranscripts = false;


  @action
  Future<void> getTranscripts() async {
    page = 0;
    final response = await getTranscriptsUsecase.call(offset: page);
    response.fold(
          (l) => transcriptViewState = ViewState.error,
          (r) {
        transcripts = r;
        transcriptViewState = ViewState.done;
        hasMoreTranscripts = r.isNotEmpty;
      },
    );
  }

  @action
  Future<void> getMoreTranscripts() async {
    loadingMoreTranscripts = true;
    page++;
    final response = await getTranscriptsUsecase.call(offset: page);

    response.fold(
          (l) => transcriptViewState = ViewState.error,
          (r) {
        transcripts.addAll(r);
        hasMoreTranscripts = r.isNotEmpty;
      },
    );
    loadingMoreTranscripts = false;
  }

  @action
  Future<void> refreshData() async {
    await getTranscripts();
  }


}