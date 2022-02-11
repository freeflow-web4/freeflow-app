import 'package:freeflow/layers/data/datasources/user_login_datasource.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/data/dtos/user_login_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/repositories/user_login_repository.dart';

class UserLoginRepositoryImp implements UserLoginRepository {
  final UserLoginDataSource _userLoginDataSource;
  UserLoginRepositoryImp(this._userLoginDataSource);

  @override
  Future<Either<DomainError, UserLoginDto>> call(
      {required String username, required String privateKey}) async {
    try {
      final result = await _userLoginDataSource(
          username: username, privateKey: privateKey);
      return Right(result);
    } catch (error) {
      return Left(DomainError.somethingWrong.fromError(error.toString()));
    }
  }
}
