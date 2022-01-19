import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/data/datasources/user_login_datasource.dart';
import 'package:freeflow/layers/data/dtos/user_login_dto.dart';
import 'package:freeflow/layers/domain/repositories/user_login_repository.dart';

class UserLoginRepositoryImp implements UserLoginRepository {
  UserLoginDataSource _userLoginDataSource;

  UserLoginRepositoryImp(this._userLoginDataSource);

  @override
  Future<Either<Exception, UserLoginDto>> call(String privateKey) async {
    try {
      await Future.delayed(Duration.zero);
      return _userLoginDataSource(privateKey);
    } catch (e) {
      return Left(Exception('Login Error'));
    }
  }
}
