import 'package:freeflow/layers/data/datasources/user_has_biometric_datasource.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/repositories/user_has_biometric_repository.dart';

class UserHasBiometricsRepositoryImp implements UserHasBiometricsRepository {
  final UserHasBiometricsDataSource datasource;
  UserHasBiometricsRepositoryImp(this.datasource);

  @override
  Future<Either<DomainError, bool>> getHasBiometrics() async {
    try {
      final result = await datasource.getHasBiometrics();
      return Right(result);
    } on Exception catch (error) {
      return Left(convertToDomainError(error.toString()));
    }
  }
}
