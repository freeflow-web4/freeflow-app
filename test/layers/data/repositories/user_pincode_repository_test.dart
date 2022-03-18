import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/data/repositories/user_pincode_repository_imp.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_pincode_repository.dart';

import '../mocks/user_pincode_datasource_mock.dart';

void main() {
  late UserPincodeDatasourceMock datasourceMock;
  late UserPincodeRepository repository;
  late String pincode;

  setUp(() {
    datasourceMock = UserPincodeDatasourceMock();
    repository = UserPincodeRepositoryImp(datasourceMock);
    pincode = '1234';
  });

  group('set pincode', () {
    test('should return true if set pincode success', () async {
      datasourceMock.mockSetRequestSuccess();
      final result = await repository.setPincode(pincode);
      expect(result, const Right(true));
    });
    test(
        'should return a Domain error when calls to datasource throws an exception',
        () async {
      datasourceMock.mockSetRequestFailure('Cache error!');
      final result = await repository.setPincode(pincode);
      expect(result, const Left(DomainError.cacheError));
    });
  });
}
