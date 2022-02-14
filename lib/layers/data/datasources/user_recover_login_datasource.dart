import 'package:freeflow/layers/data/dtos/user_recover_login_dto.dart';

abstract class UserLoginDataSource {
  Future<UserRecoverLoginDto> call({
    required String username,
    required String privateKey,
  });
}
