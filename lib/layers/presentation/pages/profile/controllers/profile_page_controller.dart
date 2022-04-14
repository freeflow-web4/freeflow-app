import 'package:flutter/services.dart';
import 'package:freeflow/layers/domain/entities/profile_entity.dart';
import 'package:freeflow/layers/domain/usecases/get_profile/get_profile_usecase.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:share_plus/share_plus.dart';

part 'profile_page_controller.g.dart';

enum PageState { loading, initial, done }

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

  @action
  Future<void> getUser({required Function onError}) async {
    pageState = PageState.loading;
    final result = await getProfileUsecase();
    result.fold(
      (error) {
        onError();
      },
      (success) {
        user = success;
      },
    );
    pageState = PageState.done;
  }

  void setContentToClipBoard() =>
      Clipboard.setData( ClipboardData(text: user!.contractAddress));

  void shareAddress() => Share.share(user!.contractAddress ?? '');

  void goToEditProfile () => Routes.instance.goToEditProfilePageRoute();


}
