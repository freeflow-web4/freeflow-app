import 'package:freeflow/layers/data/datasources/user_local_auth_datasource.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/repositories/user_local_auth_repository.dart';

class UserLocalAuthRepositoryImp implements UserLocalAuthRepository {
  final UserLocalAuthDatasource datasource;
  UserLocalAuthRepositoryImp(this.datasource);

  @override
  Future<Either<DomainError, UserEntity>> getLocalAuthUser() async {
    try {
      final entity = await datasource.getUser();
      return Right(entity);
    } on Exception catch (_) {
      return const Left(DomainError.cacheError);
    }
  }

  @override
  Future<Either<DomainError, bool>> saveLocalAuthUser(UserEntity entity) async {
    try {
      final result = await datasource.saveUser(entity);
      return Right(result);
    } on Exception catch (_) {
      return const Left(DomainError.cacheError);
    }
  }

  @override
  Future<Either<DomainError, bool>> getUserIsLogged() async {
    try {
      final result = await datasource.getUserIsLogged();
      return Right(result);
    } on Exception catch (_) {
      return const Left(DomainError.cacheError);
    }
  }

  @override
  Future<Either<DomainError, bool>> saveUserIsLogged(bool value) async {
    try {
      final result = await datasource.saveUserIsLogged(value);
      return Right(result);
    } on Exception catch (_) {
      return const Left(DomainError.cacheError);
    }
  }
}
