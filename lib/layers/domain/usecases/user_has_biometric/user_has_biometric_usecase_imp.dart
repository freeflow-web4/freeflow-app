import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/repositories/user_biometrics_repository.dart';
import 'package:freeflow/layers/domain/usecases/user_has_biometric/user_has_biometric_usecase.dart';

class UserHasBiometricsUsecaseImp implements UserHasBiometricsUsecase {
  final UserBiometricsRepository repository;
  UserHasBiometricsUsecaseImp(this.repository);
  @override
  Future<Either<DomainError, bool>> call() async {
    return await repository.getHasBiometrics();
  }
}
