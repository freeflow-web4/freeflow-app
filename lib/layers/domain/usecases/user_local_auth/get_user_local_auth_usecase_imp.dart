import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/repositories/user_local_auth_repository.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/get_user_local_auth_usecase.dart';

class GetUserLocalAuthUsecaseImp implements GetUserLocalAuthUsecase {
  final UserLocalAuthRepository repository;
  GetUserLocalAuthUsecaseImp(this.repository);

  @override
  Future<Either<DomainError, UserEntity>> call() async {
    return await repository.getLocalAuthUser();
  }
}
