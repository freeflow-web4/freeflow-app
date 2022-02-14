import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/data/datasources/user_recover_login_datasource.dart';
import 'package:freeflow/layers/data/dtos/user_recover_login_dto.dart';
import 'package:freeflow/layers/data/repositories/user_recover_login_repository_imp.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_recover_login_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockUserLoginDatasource extends Mock implements UserLoginDataSource {}

void main() {
  late UserLoginDataSource userLoginDataSource;
  late UserRecoverLoginRepository userRecoverLoginRepository;

  setUp(() {
    userLoginDataSource = MockUserLoginDatasource();
    userRecoverLoginRepository =
        UserRecoverLoginRepositoryImp(userLoginDataSource);
  });

  final UserEntity userResponse = UserEntity(name: 'testName');
  test('should return a UserLoginDto when calls to datasource succeed',
      () async {
    when(() => userLoginDataSource(
            username: any(named: "username"),
            privateKey: any(named: "privateKey")))
        .thenAnswer((_) async => userResponse);

    final result = await userRecoverLoginRepository(
      username: 'testUsername',
      privateKey: 'testPrivateKey',
    );
    expect(result, Right(userResponse));
  });

  test(
      'should return a DomainError when calls to datasource throws a exception',
      () async {
    when(() => userLoginDataSource(
        username: any(named: "username"),
        privateKey: any(named: "privateKey"))).thenThrow('Invalid username!');

    final result = await userRecoverLoginRepository(
      username: 'testUsername',
      privateKey: 'testPrivateKey',
    );
    expect(result, const Left(DomainError.invalidUsername));
  });
}
