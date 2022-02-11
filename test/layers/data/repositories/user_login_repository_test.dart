import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/data/datasources/user_login_datasource.dart';
import 'package:freeflow/layers/data/dtos/user_login_dto.dart';
import 'package:freeflow/layers/data/repositories/user_login_repository_imp.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_login_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockUserLoginDatasource extends Mock implements UserLoginDataSource {}

void main() {
  late UserLoginDataSource userLoginDataSource;
  late UserLoginRepository userLoginRepository;

  setUp(() {
    userLoginDataSource = MockUserLoginDatasource();
    userLoginRepository = UserLoginRepositoryImp(userLoginDataSource);
  });

  final UserLoginDto userResponse = UserLoginDto(name: 'testName');
  test('should return a UserLoginDto when calls to datasource succeed',
      () async {
    when(() => userLoginDataSource(
            username: any(named: "username"),
            privateKey: any(named: "privateKey")))
        .thenAnswer((_) async => userResponse);

    final result = await userLoginRepository(
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

    final result = await userLoginRepository(
      username: 'testUsername',
      privateKey: 'testPrivateKey',
    );
    expect(result, const Left(DomainError.invalidUsername));
  });
}
