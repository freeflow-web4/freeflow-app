import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_local_auth_repository.dart';
import 'package:mocktail/mocktail.dart';

class UserLocalAuthRepositoryMock extends Mock
    implements UserLocalAuthRepository {
  When _mockRequestSaveLocalAuth() => when(() => saveLocalAuthUser(any()));
  void mockSaveRequestSuccess() => _mockRequestSaveLocalAuth()
      .thenAnswer((_) async => const Right<DomainError, bool>(true));
  void mockSaveRequestFailure() => _mockRequestSaveLocalAuth().thenAnswer(
      (_) async => const Left<DomainError, bool>(DomainError.cacheError));

  When _mockRequestGetLocalAuth() => when(() => getLocalAuthUser());
  void mockGetRequestSuccess(UserEntity entity) => _mockRequestGetLocalAuth()
      .thenAnswer((_) async => Right<DomainError, UserEntity>(entity));
  void mockGetRequestFailure() => _mockRequestGetLocalAuth().thenAnswer(
      (_) async => const Left<DomainError, UserEntity>(DomainError.cacheError));
}

class UserEntityFake extends Fake implements UserEntity {}
