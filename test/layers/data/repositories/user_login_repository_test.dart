import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/data/datasources/remote/user_login_datasource_imp.dart';
import 'package:freeflow/layers/data/datasources/user_login_datasource.dart';
import 'package:freeflow/layers/data/repositories/user_login_repository_imp.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/repositories/user_login_repository.dart';

main() {
  UserLoginDataSource dataSource = UserLoginDataSourceImp();
  UserLoginRepository repository = UserLoginRepositoryImp(dataSource);
  test("User login", () async {
    var result = await repository.call('private key');
    late UserEntity expected;

    result.fold((e) => null, (r) => expected = r);

    expect(expected.name, "Ashley");
  });
}
