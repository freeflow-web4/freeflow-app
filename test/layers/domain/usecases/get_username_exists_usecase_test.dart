import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/usecases/username_exist/get_username_exists_usecase.dart';
import 'package:freeflow/layers/domain/usecases/username_exist/get_username_exists_usecase_imp.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/user_local_auth_repository_mock.dart';
import '../mocks/username_exists_repository_mock.dart';

void main() {
  late UsernameExistsRepositoryMock repositoryMock;
  late GetUsernameExistsUsecase usecase;
  late String username;

  setUp(() {
    repositoryMock = UsernameExistsRepositoryMock();
    usecase = GetUsernameExistsUsecaseImp(repositoryMock);
    username = faker.internet.userName();
  });

  setUpAll(() {
    registerFallbackValue(UserEntityFake());
  });

  test('should return true if username exists', () async {
    repositoryMock.mockGetRequestSuccess(true);
    final result = await usecase(username);
    expect(result, const Right(true));
  });

  test('should return false if username dont exists', () async {
    repositoryMock.mockGetRequestSuccess(false);
    final result = await usecase(username);
    expect(result, const Right(false));
  });

  test('should return a DomainError if repository return an error', () async {
    repositoryMock.mockGetRequestFailure();
    final result = await usecase(username);
    expect(result, const Left(DomainError.invalidUsername));
  });
}
