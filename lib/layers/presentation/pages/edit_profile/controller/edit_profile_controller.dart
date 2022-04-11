import 'dart:typed_data';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/data/models/user.dart';
import 'package:freeflow/layers/domain/entities/profile_entity.dart';
import 'package:freeflow/layers/domain/usecases/edit_profile/edit_profile_usecase.dart';
import 'package:freeflow/layers/domain/usecases/get_profile/get_profile_usecase.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'edit_profile_controller.g.dart';

enum PageState { loading, ok, loadingSendData}
enum PhotoSelectedState { all, tickets, badges}

EditProfileController findEditProfileController() => GetIt.I.get<EditProfileController>();

class EditProfileController = _EditProfileControllerBase with _$EditProfileController;

abstract class _EditProfileControllerBase with Store {
  final EditProfileUsecase editProfileUsecase;
  final GetProfileUsecase getProfileUsecase;

  @observable
  String? invalidName;
  @observable
  bool loadingPhotos = false;
  @observable
  Uint8List? imageBytes;
  @observable
  ProfileEntity? user;
  @observable
  PageState _pageState = PageState.loading;
  @observable
  PhotoSelectedState _photoSelectedState = PhotoSelectedState.all;

  _EditProfileControllerBase({
    required this.editProfileUsecase,
    required this.getProfileUsecase
});



  @action
  Future<void> getUser() async{
    _pageState = PageState.loading;

    user = ProfileEntity(displayName: '');
    final result = await getProfileUsecase();
    result.fold(
      (error) {
        print('error $error tratar');
      },
      (success) {
        user = success;
      },
    );
    _pageState = PageState.ok;

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
      invalidName = TranslationService.translate(context, "editProfile.maximum60Characters",).replaceFirst('70', '${text.length}');
      return false;
    }else if(text.isEmpty){
      invalidName =  TranslationService.translate(context, "editProfile.pleaseEnterYourName",);
      return false;
    }
    invalidName = null;
    return true;
  }

  PageState get pageState => _pageState;

  set pageState(PageState value) {
    _pageState = value;
  }

  PhotoSelectedState get photoSelectedState => _photoSelectedState;

  set photoSelectedState(PhotoSelectedState value) {
    _photoSelectedState = value;
  }

}



