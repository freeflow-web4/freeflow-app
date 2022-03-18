import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/repositories/user_biometrics_repository.dart';
import 'package:freeflow/layers/domain/usecases/user_set_biometric/user_set_biometric_usecase.dart';

class UserSetBiometricsUsecaseImp implements UserSetBiometricsUsecase {
  final UserBiometricsRepository userBiometricsRepository;
  UserSetBiometricsUsecaseImp(this.userBiometricsRepository);
  @override
  Future<Either<DomainError, bool>> call(bool value) async {
    return await userBiometricsRepository.setHasBiometrics(value);
  }
}
