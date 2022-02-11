import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/data/dtos/user_login_dto.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_login_repository.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_login_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_login/user_login_usecase_imp.dart';
import 'package:mocktail/mocktail.dart';

class MockUserLoginRepository extends Mock implements UserLoginRepository {}

void main() {
  late UserLoginUseCase userLoginUsecase;
  late UserLoginRepository userLoginRepository;

  setUp(() {
    userLoginRepository = MockUserLoginRepository();
    userLoginUsecase = UserLoginUseCaseImp(userLoginRepository);
  });

  final UserLoginDto userResponse = UserLoginDto(name: 'testName');

  test(
    'should return a UserLogin DTO when calls to the repository succeed',
    () async {
      when(() => userLoginRepository(
          username: any(named: "username"),
          privateKey: any(named: "privateKey"))).thenAnswer(
        (_) async => Right(userResponse),
      );
      final result =
          await userLoginUsecase(username: 'testName', privateKey: 'testKey');
      expect(result, Right(userResponse));
    },
  );

  test(
    'should return a DomainError when calls to the repository dont succeed',
    () async {
      when(() => userLoginRepository(
          username: any(named: "username"),
          privateKey: any(named: "privateKey"))).thenAnswer(
        (_) async => const Left(DomainError.noInternet),
      );
      final result =
          await userLoginUsecase(username: 'testName', privateKey: 'testKey');
      expect(result, const Left(DomainError.noInternet));
    },
  );
}
