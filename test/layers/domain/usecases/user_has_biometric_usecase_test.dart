import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/usecases/user_has_biometric/user_has_biometric_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_has_biometric/user_has_biometric_usecase_imp.dart';

import '../mocks/user_has_biometric_repository_mock.dart';

void main() {
  late UserBiometricsRepositoryMock repositoryMock;
  late UserHasBiometricsUsecase usecase;

  setUp(() {
    repositoryMock = UserBiometricsRepositoryMock();
    usecase = UserHasBiometricsUsecaseImp(repositoryMock);
  });

  test('should return the correct value', () async {
    repositoryMock.mockRequestSuccess(true);
    final result = await usecase();
    expect(result, const Right(true));
  });

  test('should return a DomainError when calls to the repository dont succeed',
      () async {
    repositoryMock.mockRequestFailure(DomainError.cacheError);
    final result = await usecase();
    expect(result, const Left(DomainError.cacheError));
  });
}
