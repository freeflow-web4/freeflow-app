import 'package:freeflow/layers/data/datasources/user_biometric_datasource.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/repositories/user_biometrics_repository.dart';

class UserHasBiometricsRepositoryImp implements UserBiometricsRepository {
  final UserBiometricsDataSource datasource;
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

  @override
  Future<Either<DomainError, bool>> setHasBiometrics(bool hasBiometrics) async {
    try {
      final result = await datasource.setHasBiometrics(hasBiometrics);
      return Right(result);
    } on Exception catch (error) {
      return Left(convertToDomainError(error.toString()));
    }
  }
}
