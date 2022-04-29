import 'package:freeflow/layers/domain/usecases/user_private_key/get_user_private_key_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'profile_show_phrase_controller.g.dart';

enum PageState { loading, initial, done }

ProfileShowPhraseController findProfileShowPhraseController() =>
    GetIt.I.get<ProfileShowPhraseController>();

class ProfileShowPhraseController = ProfileShowPhraseControllerBase
    with _$ProfileShowPhraseController;

abstract class ProfileShowPhraseControllerBase with Store {
  final GetUserPrivateKeyUsecase getUserPrivateKeyUsecase;
  ProfileShowPhraseControllerBase({required this.getUserPrivateKeyUsecase});

  @observable
  String? privateKey;
  @observable
  PageState pageState = PageState.loading;
  @computed
  bool get loadingIsNotCompleted =>
      pageState == PageState.loading || privateKey == null;

  @action
  Future<void> getPrivateKey({required Function onError}) async {
    pageState = PageState.loading;
    final result = await getUserPrivateKeyUsecase();
    result.fold(
      (error) {
        onError();
      },
      (success) {
        privateKey = success;
      },
    );
    pageState = PageState.done;
  }
}
