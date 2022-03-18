import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/infra/cache/cache_storage.dart';
import 'package:freeflow/layers/infra/cache/cache_storage_imp.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/flutter_secure_storage_mock.dart';

void main() {
  late CacheStorage cacheStorage;
  late FlutterSecureStorageMock secureStorageMock;
  late String key;
  late String value;

  setUp(() {
    key = faker.lorem.word();
    value = faker.lorem.sentence();
    secureStorageMock = FlutterSecureStorageMock();
    cacheStorage = CacheStorageImp(storage: secureStorageMock);
  });

  group('write', () {
    test('should call save with correct values', () async {
      secureStorageMock.mockWriteRequestSuccess();
      await cacheStorage.save(key: key, value: value);
      verify(() => secureStorageMock.write(key: key, value: value));
    });

    test('should throw if save throws', () async {
      secureStorageMock.mockWriteRequestFailure();
      final result = cacheStorage.save(key: key, value: value);
      expect(result, throwsA(const TypeMatcher<Exception>()));
    });
  });

  group('read', () {
    test('should call read with correct values', () async {
      secureStorageMock.mockReadRequestSuccess(value);
      await cacheStorage.get(key);
      verify(() => secureStorageMock.read(key: key));
    });

    test('should return correct value', () async {
      secureStorageMock.mockReadRequestSuccess(value);
      final result = await cacheStorage.get(key);
      expect(result, value);
    });

    test('should throw if read throws', () async {
      secureStorageMock.mockReadRequestFailure();
      final result = cacheStorage.get(key);
      expect(result, throwsA(const TypeMatcher<Exception>()));
    });
  });

  group('delete', () {
    test('should call delete with correct key', () async {
      secureStorageMock.mockDeleteRequestSuccess();
      await cacheStorage.delete(key);
      verify(() => secureStorageMock.delete(key: key));
    });

    test('should throw if delete throws', () async {
      secureStorageMock.mockDeleteRequestFailure();
      final result = cacheStorage.delete(key);
      expect(result, throwsA(const TypeMatcher<Exception>()));
    });
  });
}
