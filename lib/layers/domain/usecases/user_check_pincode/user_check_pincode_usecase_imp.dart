import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_pincode_repository.dart';

import 'user_check_pincode_usecase.dart';

class UserCheckPinCodeUsecaseImp implements UserCheckPinCodeUsecase {
  final UserPincodeRepository repository;
  UserCheckPinCodeUsecaseImp(this.repository);
  @override
  Future<Either<DomainError, bool>> call(String pin) async {
    final userPinEither = await repository.getPinCode();
    late Either<DomainError, bool> result;
    userPinEither.fold((error) => result = Left(error), (userPin) => result = Right(userPin == pin));
    return result;
  }
}
