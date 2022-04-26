import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/repositories/user_local_auth_repository.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/get_user_is_logged_usecase.dart';

class GetUserIsLoggedUsecaseImp implements GetUserIsLoggedUsecase {
  final UserLocalAuthRepository repository;
  GetUserIsLoggedUsecaseImp(this.repository);

  @override
  Future<Either<DomainError, bool>> call() async {
    return await repository.getUserIsLogged();
  }
}
