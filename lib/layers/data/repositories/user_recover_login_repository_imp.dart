import 'package:freeflow/layers/data/datasources/user_recover_login_datasource.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/repositories/user_recover_login_repository.dart';

class UserRecoverLoginRepositoryImp implements UserRecoverLoginRepository {
  final UserRecoverLoginDataSource _userLoginDataSource;
  UserRecoverLoginRepositoryImp(this._userLoginDataSource);

  @override
  Future<Either<DomainError, UserEntity>> call(
      {required String username, required String privateKey}) async {
    try {
      final result = await _userLoginDataSource(
          username: username, privateKey: privateKey);
      return Right(result);
    } on Exception catch (error) {
      return Left(convertToDomainError(error.toString()));
    }
  }
}
