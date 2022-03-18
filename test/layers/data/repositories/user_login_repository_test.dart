import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/data/repositories/user_recover_login_repository_imp.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_recover_login_repository.dart';

import '../mocks/user_recover_login_datasource_mock.dart';

void main() {
  late MockUserLoginDatasource datasource;
  late UserRecoverLoginRepository repository;

  setUp(() {
    datasource = MockUserLoginDatasource();
    repository = UserRecoverLoginRepositoryImp(datasource);
  });

  final UserEntity userResponse =
      UserEntity(email: '', id: '', token: '', username: '');
  test('should return a UserEntity when calls to datasource succeed', () async {
    datasource.mockRequestSuccess(userResponse);
    final result = await repository.auth(
      username: 'testUsername',
      privateKey: 'testPrivateKey',
    );
    expect(result, Right(userResponse));
  });

  test(
      'should return a DomainError when calls to datasource throws a exception',
      () async {
    datasource.mockRequestError('Invalid username!');
    final result = await repository.auth(
      username: 'testUsername',
      privateKey: 'testPrivateKey',
    );
    expect(result, const Left(DomainError.invalidUsername));
  });
}
