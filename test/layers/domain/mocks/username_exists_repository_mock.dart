import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/username_exists_repository.dart';
import 'package:mocktail/mocktail.dart';

class UsernameExistsRepositoryMock extends Mock
    implements UsernameExistsRepository {
  When _mockRequestGetLocalAuth() => when(() => getUsernameExists(any()));
  void mockGetRequestSuccess(bool value) => _mockRequestGetLocalAuth()
      .thenAnswer((_) async => Right<DomainError, bool>(value));
  void mockGetRequestFailure() => _mockRequestGetLocalAuth().thenAnswer(
      (_) async => const Left<DomainError, bool>(DomainError.invalidUsername));
}
