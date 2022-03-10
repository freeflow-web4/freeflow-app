import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/usecases/user_set_biometric/user_set_biometric_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_biometric/user_set_biometric_usecase_imp.dart';

import '../mocks/user_has_biometric_repository_mock.dart';

void main() {
  late UserBiometricsRepositoryMock repositoryMock;
  late UserSetBiometricsUsecase usecase;

  setUp(() {
    repositoryMock = UserBiometricsRepositoryMock();
    usecase = UserSetBiometricsUsecaseImp(repositoryMock);
  });

  test('should return true when set biometrics to true', () async {
    repositoryMock.mockSetRequestSuccess(true);
    final result = await usecase(true);
    expect(result, const Right(true));
  });

  test('should return false when set biometrics to false', () async {
    repositoryMock.mockSetRequestSuccess(false);
    final result = await usecase(false);
    expect(result, const Right(false));
  });

  test('should return a DomainError when calls to the repository dont succeed',
      () async {
    repositoryMock.mockSetRequestFailure(DomainError.cacheError);
    final result = await usecase(true);
    expect(result, const Left(DomainError.cacheError));
  });
}
