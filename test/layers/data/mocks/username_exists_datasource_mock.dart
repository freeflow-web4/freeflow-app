import 'package:freeflow/layers/data/datasources/username_exists_datasource.dart';
import 'package:mocktail/mocktail.dart';

class UsernameExistsDatasourceMock extends Mock
    implements UsernameExistsDatasource {
  When mockRequestCall() => when(() => getUsernameExists(any()));
  void mockRequestSuccess(bool value) =>
      mockRequestCall().thenAnswer((_) async => value);
  void mockRequestError(String error) =>
      mockRequestCall().thenThrow(Exception(error));
}
