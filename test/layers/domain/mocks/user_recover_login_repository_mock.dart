import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:mocktail/mocktail.dart';
import 'package:freeflow/layers/domain/repositories/user_recover_login_repository.dart';

class MockUserRecoverLoginRepository extends Mock
    implements UserRecoverLoginRepository {
  When mockRequestCall() => when(() => auth(
        username: any(named: "username"),
        privateKey: any(named: "privateKey"),
      ));

  void mockRequestSuccess(UserEntity response) => mockRequestCall()
      .thenAnswer((_) async => Right<DomainError, UserEntity>(response));

  void mockRequestError(DomainError error) => mockRequestCall()
      .thenAnswer((_) async => Left<DomainError, UserEntity>(error));
}
