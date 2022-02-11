import 'package:freeflow/layers/data/dtos/user_login_dto.dart';

abstract class UserLoginDataSource {
  Future<UserLoginDto> call({
    required String username,
    required String privateKey,
  });
}
