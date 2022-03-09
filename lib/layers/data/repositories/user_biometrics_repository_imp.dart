import 'dart:convert';

import 'package:freeflow/layers/data/datasources/user_biometric_datasource.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/repositories/user_biometrics_repository.dart';

class UserBiometricsRepositoryImp implements UserBiometricsRepository {
  final UserBiometricsDataSource datasource;
  UserBiometricsRepositoryImp(this.datasource);

  @override
  Future<Either<DomainError, bool>> getHasBiometrics() async {
    try {
      final result = await datasource.getHasBiometrics();
      return Right(jsonDecode(result));
    } on Exception catch (error) {
      return Left(convertToDomainError(error.toString()));
    }
  }

  @override
  Future<Either<DomainError, bool>> setHasBiometrics(bool hasBiometrics) async {
    try {
      final result =
          await datasource.setHasBiometrics(jsonEncode(hasBiometrics));
      return Right(jsonDecode(result));
    } on Exception catch (error) {
      return Left(convertToDomainError(error.toString()));
    }
  }
}
