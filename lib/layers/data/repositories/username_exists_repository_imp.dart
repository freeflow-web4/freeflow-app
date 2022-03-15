import 'package:freeflow/layers/data/datasources/username_exists_datasource.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/repositories/username_exists_repository.dart';

class UsernameExistsRepositoryImp implements UsernameExistsRepository {
  final UsernameExistsDatasource datasource;
  UsernameExistsRepositoryImp(this.datasource);
  @override
  Future<Either<DomainError, bool>> getUsernameExists(String username) async {
    try {
      final result = await datasource.getUsernameExists(username);
      return Right(result);
    } on Exception catch (error) {
      return Left(convertToDomainError(error.toString()));
    }
  }
}
