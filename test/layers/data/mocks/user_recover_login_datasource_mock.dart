import 'package:freeflow/layers/data/datasources/user_recover_login_datasource.dart';
import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:mocktail/mocktail.dart';

class MockUserLoginDatasource extends Mock
    implements UserRecoverLoginDataSource {
  When mockRequestCall() => when(() => recover(
        username: any(named: "username"),
        privateKey: any(named: "privateKey"),
      ));

  void mockRequestSuccess(UserEntity response) =>
      mockRequestCall().thenAnswer((_) async => response);

  void mockRequestError(String error) =>
      mockRequestCall().thenThrow(Exception(error));
}
