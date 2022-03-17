import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/save_user_local_auth_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/save_user_local_auth_usecase_imp.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/user_local_auth_repository_mock.dart';

void main() {
  late UserLocalAuthRepositoryMock repositoryMock;
  late SaveUserLocalAuthUsecase usecase;
  late UserEntity entity;

  setUp(() {
    repositoryMock = UserLocalAuthRepositoryMock();
    usecase = SaveUserLocalAuthUsecaseImp(repositoryMock);
    entity = UserEntity(
      email: 'email',
      id: 'id',
      token: '123',
      username: 'username',
    );
  });

  setUpAll(() {
    registerFallbackValue(UserEntityFake());
  });

  test('should return true if save user local auth', () async {
    repositoryMock.mockSaveRequestSuccess();
    final result = await usecase(entity);
    expect(result, const Right(true));
  });

  test('should return a DomainError if not succeed', () async {
    repositoryMock.mockSaveRequestFailure();
    final result = await usecase(entity);
    expect(result, const Left(DomainError.cacheError));
  });
}
