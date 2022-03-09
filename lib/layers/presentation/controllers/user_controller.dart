import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_recover_login_usecase.dart';

class UserController {
  final UserRecoverLoginUseCase _userLoginUseCase;

  UserController(this._userLoginUseCase);

  late UserEntity loggedInUser;

  // login(String privateKey) async {
  //   var result = await _userLoginUseCase(privateKey);
  //   result.fold((e) => debugPrint("$e"), (res) => loggedInUser = res);
  // }
}
