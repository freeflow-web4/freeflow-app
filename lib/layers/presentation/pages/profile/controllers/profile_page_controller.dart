import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:freeflow/layers/domain/entities/profile_entity.dart';
import 'package:freeflow/layers/domain/usecases/get_profile/get_profile_usecase.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:share_plus/share_plus.dart';

part 'profile_page_controller.g.dart';

enum PageState { loading, done, error }

ProfilePageController findProfileController() =>
    GetIt.I.get<ProfilePageController>();

class ProfilePageController = ProfilePageControllerBase
    with _$ProfilePageController;

abstract class ProfilePageControllerBase with Store {
  final GetProfileUsecase getProfileUsecase;
  ProfilePageControllerBase({required this.getProfileUsecase});

  @observable
  ProfileEntity? user;
  @observable
  PageState pageState = PageState.loading;
  @computed
  bool get loadingIsNotCompleted =>
      pageState == PageState.loading || user == null;

  @action
  Future<void> getUser({required Function onError}) async {
    pageState = PageState.loading;
    final result = await getProfileUsecase();
    result.fold(
      (error) {
        pageState = PageState.error;
        onError();
      },
      (success) {
        pageState = PageState.done;
        user = success;
      },
    );
  }

  void setContentToClipBoard() =>
      Clipboard.setData(ClipboardData(text: user!.contractAddress));

  void shareAddress() => Share.share(user!.contractAddress ?? '');

  Future<void> goToEditProfile() async {
    ProfileEntity? profile =
        await Routes.instance.goToEditProfilePageRoute(user!);
    if (profile != null) {
      user = profile;
    }
  }

  void showLogoutPage(BuildContext context,) {
    Routes.instance.goToLogout(context);
  }

  void showPhrasePage(BuildContext context,) {
    Routes.instance.goToShowPhrase(context);
  }

  bool get hasError => pageState == PageState.error;
}
