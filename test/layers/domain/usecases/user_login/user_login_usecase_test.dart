import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/data/dtos/user_recover_login_dto.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_recover_login_repository.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_recover_login_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_recover_login_usecase_imp.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRecoverLoginRepository extends Mock
    implements UserRecoverLoginRepository {}

void main() {
  late UserRecoverLoginUseCase userRecoverLoginUsecase;
  late UserRecoverLoginRepository userRecoverLoginRepository;

  setUp(() {
    userRecoverLoginRepository = MockUserRecoverLoginRepository();
    userRecoverLoginUsecase =
        UserRecoverLoginUseCaseImp(userRecoverLoginRepository);
  });

  final UserRecoverLoginDto userResponse =
      UserRecoverLoginDto(name: 'testName');

  test(
    'should return a UserRecoverLogin DTO when calls to the repository succeed',
    () async {
      when(() => userRecoverLoginRepository(
          username: any(named: "username"),
          privateKey: any(named: "privateKey"))).thenAnswer(
        (_) async => Right(userResponse),
      );
      final result = await userRecoverLoginUsecase(
          username: 'testName', privateKey: 'testKey');
      expect(result, Right(userResponse));
    },
  );

  test(
    'should return a DomainError when calls to the repository dont succeed',
    () async {
      when(() => userRecoverLoginRepository(
          username: any(named: "username"),
          privateKey: any(named: "privateKey"))).thenAnswer(
        (_) async => const Left(DomainError.noInternet),
      );
      final result = await userRecoverLoginUsecase(
          username: 'testName', privateKey: 'testKey');
      expect(result, const Left(DomainError.noInternet));
    },
  );
}
