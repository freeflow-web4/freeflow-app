import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_has_biometric_repository.dart';
import 'package:mocktail/mocktail.dart';

class UserHasBiometricsRepositoryMock extends Mock
    implements UserHasBiometricsRepository {
  When _mockRequestHasBiometrics() => when(() => hasBiometrics());

  void mockRequestSuccess(bool value) => _mockRequestHasBiometrics()
      .thenAnswer((_) async => Right<DomainError, bool>(value));
  void mockRequestFailure(DomainError error) => _mockRequestHasBiometrics()
      .thenAnswer((_) async => Left<DomainError, bool>(error));
}
