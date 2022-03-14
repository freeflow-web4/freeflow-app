import 'package:freeflow/layers/data/datasources/user_pincode_datasource.dart';
import 'package:mocktail/mocktail.dart';

class UserPincodeDatasourceMock extends Mock implements UserPincodeDatasource {
  When _mockRequestCall() => when(() => getPincode());
  void mockRequestSuccess(bool value) =>
      _mockRequestCall().thenAnswer((_) async => value);
  void mockRequestFailure(String error) =>
      _mockRequestCall().thenThrow(Exception(error));

  When _mockSetRequestCall() => when(() => setPincode(any()));
  void mockSetRequestSuccess() =>
      _mockSetRequestCall().thenAnswer((_) async => true);
  void mockSetRequestFailure(String error) =>
      _mockSetRequestCall().thenThrow(Exception(error));
}
