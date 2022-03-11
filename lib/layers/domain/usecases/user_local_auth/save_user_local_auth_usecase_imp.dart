import 'dart:ffi';

import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/entities/user_local_auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/repositories/user_local_auth_repository.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/save_user_local_auth_usecase.dart';

class SaveUserLocalAuthUsecaseImp implements SaveUserLocalAuthUsecase {
  final UserLocalAuthRepository repository;
  SaveUserLocalAuthUsecaseImp(this.repository);

  @override
  Future<Either<DomainError, bool>> call(UserLocalAuthEntity user) async {
    return await repository.saveLocalAuthUser(user);
  }
}
