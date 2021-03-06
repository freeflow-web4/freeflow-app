import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/get_user_local_auth_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/get_user_local_auth_usecase_imp.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/user_local_auth_repository_mock.dart';

void main() {
  late UserLocalAuthRepositoryMock repositoryMock;
  late GetUserLocalAuthUsecase usecase;
  late UserEntity entity;

  setUp(() {
    repositoryMock = UserLocalAuthRepositoryMock();
    usecase = GetUserLocalAuthUsecaseImp(repositoryMock);
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

  test('should return the correct entity', () async {
    repositoryMock.mockGetRequestSuccess(entity);
    final result = await usecase();
    expect(result, Right(entity));
  });

  test('should return a DomainError if not succeed', () async {
    repositoryMock.mockGetRequestFailure();
    final result = await usecase();
    expect(result, const Left(DomainError.cacheError));
  });
}
