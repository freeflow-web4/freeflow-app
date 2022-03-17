import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/username_exists_repository.dart';
import 'package:freeflow/layers/domain/usecases/username_exist/get_username_exists_usecase.dart';

class GetUsernameExistsUsecaseImp implements GetUsernameExistsUsecase {
  final UsernameExistsRepository repository;
  GetUsernameExistsUsecaseImp(this.repository);
  @override
  Future<Either<DomainError, bool>> call(String username) async {
    return await repository.getUsernameExists(username);
  }
}
