import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/usecases/user_set_pincode/user_set_pincode_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_pincode/user_set_pincode_usecase_Imp.dart';

import '../mocks/user_pincode_repository_mock.dart';

void main() {
  late UserPincodeRepositoryMock repositoryMock;
  late UserSetPincodeUsecase usecase;
  late String pincode;

  setUp(() {
    repositoryMock = UserPincodeRepositoryMock();
    usecase = UserSetPincodeUsecaseImp(repositoryMock);
    pincode = '1234';
  });

  test('should return true when set pincode to true', () async {
    repositoryMock.mockSetRequestSuccess(true);
    final result = await usecase(pincode);
    expect(result, const Right(true));
  });

  test('should return false when set biometrics to false', () async {
    repositoryMock.mockSetRequestSuccess(false);
    final result = await usecase(pincode);
    expect(result, const Right(false));
  });

  test('should return a DomainError when calls to the repository dont succeed',
      () async {
    repositoryMock.mockSetRequestFailure(DomainError.cacheError);
    final result = await usecase(pincode);
    expect(result, const Left(DomainError.cacheError));
  });
}
