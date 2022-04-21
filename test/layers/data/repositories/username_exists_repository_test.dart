import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/data/repositories/username_exists_repository_imp.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/username_exists_repository.dart';

import '../mocks/username_exists_datasource_mock.dart';

void main() {
  late UsernameExistsDatasourceMock datasourceMock;
  late UsernameExistsRepository repository;
  late String username;

  setUp(() {
    datasourceMock = UsernameExistsDatasourceMock();
    repository = UsernameExistsRepositoryImp(datasourceMock);
    username = faker.internet.userName();
  });

  test('should return true if username exists', () async {
    datasourceMock.mockRequestSuccess(true);
    final result = await repository.getUsernameExists(username);
    expect(result, const Right(true));
  });

  test('should return false if username dont exists', () async {
    datasourceMock.mockRequestSuccess(false);
    final result = await repository.getUsernameExists(username);
    expect(result, const Right(false));
  });

  test(
      'should return a Domain error when calls to datasource throws an exception',
      () async {
    datasourceMock.mockRequestError('error');
    final result = await repository.getUsernameExists(username);
    expect(result, const Left(DomainError.somethingWrong));
  });
}
