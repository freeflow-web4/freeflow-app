import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/domain/usecases/get_transcripts/get_transcripts_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'wallet_controller.g.dart';

enum ViewContentType { transcript, flwr, collectibles }
enum ViewState { start, loading, done, error }

class WalletController = WalletControllerBase with _$WalletController;

abstract class WalletControllerBase with Store {
  GetTranscriptsUsecase getTranscriptsUsecase =
  GetIt.I.get<GetTranscriptsUsecase>();

  @observable
  int index = 0;

  @observable
  ViewState transcriptViewState = ViewState.start;

  @observable
  ViewState walletViewState = ViewState.start;

  @observable
  ViewContentType viewContentType = ViewContentType.transcript;

  @computed
  bool get walletIsLoading => walletViewState == ViewState.loading;
  @computed
  bool get transcriptIsLoading => walletViewState == ViewState.loading;
  @computed
  bool get isTranscriptError => transcriptViewState == ViewState.error;

  bool walletOrTranscriptsLoadingOrNull(
    List<TranscriptEntity>? transcriptList,
  ) =>
      transcriptViewState == ViewState.loading ||
      transcriptList == null ||
      walletViewState == ViewState.loading;

  @action
  Future<List<TranscriptEntity>> getTranscriptList() async {
    late List<TranscriptEntity> transcriptList;
    transcriptViewState = ViewState.loading;
    final response = await getTranscriptsUsecase.call(offset: 0);
    transcriptViewState = ViewState.done;

    response.fold(
      (l) => transcriptViewState = ViewState.error,
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
