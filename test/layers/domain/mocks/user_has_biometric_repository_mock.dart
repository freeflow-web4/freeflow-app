import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_biometrics_repository.dart';
import 'package:mocktail/mocktail.dart';

class UserBiometricsRepositoryMock extends Mock
    implements UserBiometricsRepository {
  When _mockRequestHasBiometrics() => when(() => getHasBiometrics());
  void mockRequestSuccess(bool value) => _mockRequestHasBiometrics()
      .thenAnswer((_) async => Right<DomainError, bool>(value));
  void mockRequestFailure(DomainError error) => _mockRequestHasBiometrics()
      .thenAnswer((_) async => Left<DomainError, bool>(error));

  When _mockRequestSetBiometrics() => when(() => setHasBiometrics(any()));
  void mockSetRequestSuccess(bool value) => _mockRequestSetBiometrics()
      .thenAnswer((_) async => Right<DomainError, bool>(value));
  void mockSetRequestFailure(DomainError error) => _mockRequestSetBiometrics()
      .thenAnswer((_) async => Left<DomainError, bool>(error));
}
