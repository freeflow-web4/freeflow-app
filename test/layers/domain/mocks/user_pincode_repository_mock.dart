import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_biometrics_repository.dart';
import 'package:freeflow/layers/domain/repositories/user_pincode_repository.dart';
import 'package:mocktail/mocktail.dart';

class UserPincodeRepositoryMock extends Mock implements UserPincodeRepository {
  When _mockRequestSetBiometrics() => when(() => setPincode(any()));
  void mockSetRequestSuccess(bool value) => _mockRequestSetBiometrics()
      .thenAnswer((_) async => Right<DomainError, bool>(value));
  void mockSetRequestFailure(DomainError error) => _mockRequestSetBiometrics()
      .thenAnswer((_) async => Left<DomainError, bool>(error));
}
