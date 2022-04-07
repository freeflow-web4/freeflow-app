import 'package:freeflow/routes/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'edit_profile_controller.g.dart';

EditProfileController findEditProfileController() => GetIt.I.get<EditProfileController>();

class EditProfileController = _LoginControllerBase with _$EditProfileController;

abstract class _LoginControllerBase with Store {
  Future<void> onSwipe() {
    return Routes.instance.goToAuthPageRoute();
  }



}
