import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/layers/domain/entities/collectibles_entity.dart';
import 'package:freeflow/layers/domain/entities/edit_profile_entity.dart';
import 'package:freeflow/layers/domain/entities/profile_entity.dart';
import 'package:freeflow/layers/domain/usecases/edit_profile/edit_profile_usecase.dart';
import 'package:freeflow/layers/domain/usecases/get_collectibles/get_collectibles_usecase.dart';
import 'package:freeflow/layers/domain/usecases/get_profile/get_profile_usecase.dart';
import 'package:freeflow/layers/presentation/helpers/dialog/show_dialog_default.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'edit_profile_controller.g.dart';

enum PageState { loading, ready, loadingSendData}
enum PhotoSelectedState { all, tickets, badges}

EditProfileController findEditProfileController() => GetIt.I.get<EditProfileController>();

class EditProfileController = _EditProfileControllerBase with _$EditProfileController;

abstract class _EditProfileControllerBase with Store {
  final EditProfileUsecase editProfileUsecase;
  final GetProfileUsecase getProfileUsecase;
  final GetCollectiblesUsecase getCollectiblesUsecase;

  @observable
  String? invalidName;
  @observable
  bool loadingPhotos = false;
  @observable
  bool hasMorePhotos = true;
  @observable
  bool loadingMorePhotos = false;
  @observable
  Uint8List? imageBytes;
  @observable
  ProfileEntity? user;
  @observable
  PageState _pageState = PageState.loading;
  @observable
  PhotoSelectedState _photoSelectedState = PhotoSelectedState.all;
  @observable
  GlobalKey navigatorKey = GlobalKey<NavigatorState>();
  @observable
  TextEditingController controllerName = TextEditingController();
  @observable
  List<CollectiblesEntity> images = [];
  int page = 0;
  int limit = 30;


  _EditProfileControllerBase( {
    required this.editProfileUsecase,
    required this.getProfileUsecase,
    required this.getCollectiblesUsecase,
  });


  @action
  saveProfile() async {
    _pageState = PageState.loadingSendData;
    final result = await editProfileUsecase(editProfileEntity: EditProfileEntity(username: controllerName.text, image: imageBytes));
    result.fold(
          (l) => showDialogError(),
          (r) {
            Routes.instance.pop();
          },
    );
    _pageState = PageState.ready;

  }


  @action
  Future<void> getUser() async{

    _pageState = PageState.loading;

    user = ProfileEntity(displayName: '');
    final result = await getProfileUsecase();
    result.fold(
          (error) {
        showDialogError();
      },
          (success) {
        user = success;
        controllerName.text = user?.displayName ?? '';
      },
    );
    _pageState = PageState.ready;

  }

  @action
  Future<void> getCollectibles() async{
    loadingPhotos = true;
    page = 0;
    images = [];
    final result = await getCollectiblesUsecase(page: page, limit: limit, type: collectibleSelected());
    result.fold(
          (l) => showDialogError(),
          (r) => images = r,
    );

    hasMorePhotos = images.length >= limit;
    loadingPhotos = false;
  }

  @action
  Future<void> getMoreCollectibles() async{
    loadingMorePhotos = true;
    page++;
    final result = await getCollectiblesUsecase(page: page, limit: limit, type: collectibleSelected());
    result.fold(
          (l) => showDialogError(),
          (r) {
            images.addAll(r);
            hasMorePhotos = r.length >= limit;
          },
    );
    loadingMorePhotos = false;
  }

  @action
  Future<void> onTapToChangePhoto(String urlImage) async {
    Uint8List? bytes = await Routes.instance.goToCutImagePageRoute(urlImage);
    if(bytes != null){
      imageBytes = bytes;
    }
  }

  @action
  bool validateName(text, context){
    if(text!.length > 60){
      invalidName = TranslationService.translate(context, "editProfile.maximum60Characters",);
      return false;
    }else if(text.isEmpty){
      invalidName =  TranslationService.translate(context, "editProfile.pleaseEnterYourName",);
      return false;
    }
    invalidName = null;
    return true;
  }

  @action
  dispose(){
    invalidName = null;
    loadingPhotos = false;
    hasMorePhotos = true;
    loadingMorePhotos = false;
    imageBytes = null;
    user = null;
    _pageState = PageState.loading;
    _photoSelectedState = PhotoSelectedState.all;
    controllerName.text = '';
    images = [];
  }

  PageState get pageState => _pageState;

  set pageState(PageState value) {
    _pageState = value;
  }

  PhotoSelectedState get photoSelectedState => _photoSelectedState;

  set photoSelectedState(PhotoSelectedState value) {
    _photoSelectedState = value;
  }

  void showDialogError() {
    showDialogDefault(
      navigatorKey.currentContext!,
      type: DialogType.systemInstability,
      onTap: (){
        Navigator.of(navigatorKey.currentContext!).pop();
        Routes.instance.pop();
      },
    );
  }

  String? collectibleSelected(){
    switch(_photoSelectedState) {
      case PhotoSelectedState.all:
        return null;
      case PhotoSelectedState.tickets:
        return 'ticket';
      case PhotoSelectedState.badges:
        return 'badge';
    }
  }

}



