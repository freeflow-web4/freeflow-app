import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_pincode_repository.dart';

import 'user_set_pincode_usecase.dart';

class UserSetPincodeUsecaseImp implements UserSetPincodeUsecase {
  final UserPincodeRepository repository;
  UserSetPincodeUsecaseImp(this.repository);
  @override
  Future<Either<DomainError, bool>> call(String value) async {
    return await repository.setPincode(value);
  }
}
