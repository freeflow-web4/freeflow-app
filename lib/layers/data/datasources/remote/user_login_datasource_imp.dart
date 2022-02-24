import 'package:freeflow/layers/data/datasources/user_recover_login_datasource.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';

class UserRecoverLoginDataSourceImp implements UserRecoverLoginDataSource {
  @override
  Future<UserEntity> call(
      {required String username, required String privateKey}) {
    throw UnimplementedError();
  }
}
