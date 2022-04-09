import 'dart:typed_data';

import 'package:freeflow/routes/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'edit_profile_controller.g.dart';

EditProfileController findEditProfileController() => GetIt.I.get<EditProfileController>();

class EditProfileController = _EditProfileControllerBase with _$EditProfileController;

abstract class _EditProfileControllerBase with Store {

  @observable
  Uint8List? imageBytes;

  void onTapToChangePhoto(String urlImage) async {
    Uint8List? bytes = await Routes.instance.goToCutImagePageRoute(urlImage);
    if(bytes != null){
      imageBytes = bytes;
    }
  }


}
