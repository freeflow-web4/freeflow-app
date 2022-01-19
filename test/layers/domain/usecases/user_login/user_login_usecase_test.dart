import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/data/datasources/remote/user_login_datasource_imp.dart';
import 'package:freeflow/layers/data/repositories/user_login_repository_imp.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/repositories/user_login_repository.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_login_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_login_usecase_imp.dart';

main() {
  test('Login user "Ashley"', () async {
    UserLoginUseCase useCase =
        UserLoginUseCaseImp(UserLoginRepositoryImp(UserLoginDataSourceImp()));

    var result = await useCase("private key");
    late UserEntity expected;
    result.fold((e) => null, (r) => expected = r);
    expect(expected.name, "Ashley");
  });
}
