import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/usecases/user_recover_login/user_recover_login_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_recover_login/user_recover_login_usecase_imp.dart';

import '../mocks/field_validator_mock.dart';
import '../mocks/user_recover_login_repository_mock.dart';

void main() {
  late UserRecoverLoginUseCase usecase;
  late MockUserRecoverLoginRepository repository;
  late MockFieldValidator fieldValidator;

  setUp(() {
    repository = MockUserRecoverLoginRepository();
    fieldValidator = MockFieldValidator();
    usecase = UserRecoverLoginUseCaseImp(
      repository: repository,
      fieldValidator: fieldValidator,
    );
  });

  final UserEntity userResponse =
      UserEntity(email: '', id: '', token: '', username: '');

  test(
    'should return a UserEntity when calls to the repository succeed',
    () async {
      repository.mockRequestSuccess(userResponse);
      final result = await usecase(username: 'testName', privateKey: 'testKey');
      expect(result, Right(userResponse));
    },
  );

  test(
    'should return a DomainError when calls to the repository dont succeed',
    () async {
      repository.mockRequestError(DomainError.noInternet);
      final result = await usecase(username: 'testName', privateKey: 'testKey');
      expect(result, const Left(DomainError.noInternet));
    },
  );
}
