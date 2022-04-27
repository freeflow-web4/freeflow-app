import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_pincode_repository.dart';

import 'user_has_pincode_usecase.dart';

class UserHasPinCodeUsecaseImp implements UserHasPinCodeUsecase {
  final UserPincodeRepository repository;
  UserHasPinCodeUsecaseImp(this.repository);
  @override
  Future<Either<DomainError, bool>> call() async {
    final userPinEither = await repository.getPinCode();
    late Either<DomainError, bool> result;
    userPinEither.fold(
      (error) => result = Left(error),
      (userPin) => result = Right(userPin.isNotEmpty),
    );
    return result;
  }
}
