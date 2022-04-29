import 'package:freeflow/layers/data/datasources/user_private_key_datasource.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/repositories/user_private_key_repository.dart';

class UserPrivateKeyRepositoryImp implements UserPrivateKeyRepository {
  final UserPrivateKeyDatasource datasource;
  UserPrivateKeyRepositoryImp(this.datasource);

  @override
  Future<Either<DomainError, String>> getPrivateKey() async {
    try {
      final result = await datasource.getPrivateKey();
      return Right(result);
    } on Exception catch (error) {
      return Left(convertToDomainError(error.toString()));
    }
  }

  @override
  Future<Either<DomainError, bool>> setPrivateKey(String value) async {
    try {
      final result = await datasource.setPrivateKey(value);
      return Right(result);
    } on Exception catch (error) {
      return Left(convertToDomainError(error.toString()));
    }
  }
}
