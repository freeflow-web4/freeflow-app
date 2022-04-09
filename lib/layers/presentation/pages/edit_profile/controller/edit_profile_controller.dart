import 'dart:typed_data';

import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'edit_profile_controller.g.dart';

EditProfileController findEditProfileController() => GetIt.I.get<EditProfileController>();

class EditProfileController = _EditProfileControllerBase with _$EditProfileController;

abstract class _EditProfileControllerBase with Store {
  @observable
  bool hasImage = true;
  @observable
  String? invalidName;
  @observable
  bool loadingSendData = false;
  @observable
  bool loadingPhotos = false;
  @observable
  int itemSelected = 0;

  @observable
  Uint8List? imageBytes;

  void onTapToChangePhoto(String urlImage) async {
    Uint8List? bytes = await Routes.instance.goToCutImagePageRoute(urlImage);
    if(bytes != null){
      imageBytes = bytes;
    }
  }

  bool validateName(text, context){
    if(text!.length > 60){
      invalidName = TranslationService.translate(context, "editProfile.maximum60Characters",).replaceFirst('70', '${text.length}');
      return false;
    }else if(text.isEmpty){
      invalidName =  TranslationService.translate(context, "editProfile.pleaseEnterYourName",);
      return false;
    }
    return true;
  }
}



