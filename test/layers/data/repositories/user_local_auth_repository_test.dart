import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/data/repositories/user_local_auth_repository_imp.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_local_auth_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/mocks/user_local_auth_repository_mock.dart';
import '../mocks/user_local_auth_datasource_mock.dart';

void main() {
  late UserLocalAuthDatasourceMock datasourceMock;
  late UserLocalAuthRepository repository;
  late UserEntity entity;

  setUp(() {
    datasourceMock = UserLocalAuthDatasourceMock();
    repository = UserLocalAuthRepositoryImp(datasourceMock);
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

  group('get local auth user', () {
    test('should return the correct UserLocalAuthEntity', () async {
      datasourceMock.mockGetRequestSuccess(entity);
      final user = await repository.getLocalAuthUser();
      expect(user, Right(entity));
    });

    test('should return a Domain Error when unsuccessful', () async {
      datasourceMock.mockGetRequestFailure();
      final user = await repository.getLocalAuthUser();
      expect(user, const Left(DomainError.cacheError));
    });
  });

  group('save local auth user', () {
    test('should return true if succeed', () async {
      datasourceMock.mockSaveRequestSuccess();
      final user = await repository.saveLocalAuthUser(entity);
      expect(user, const Right(true));
    });

    test('should return a Domain Error when unsuccessful', () async {
      datasourceMock.mockSaveRequestFailure();
      final user = await repository.saveLocalAuthUser(entity);
      expect(user, const Left(DomainError.cacheError));
    });
  });
}
