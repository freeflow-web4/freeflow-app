import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/repositories/user_private_key_repository.dart';
import 'package:freeflow/layers/domain/usecases/user_private_key/get_user_private_key_usecase.dart';

class GetUserPrivateKeyUsecaseImp implements GetUserPrivateKeyUsecase {
  final UserPrivateKeyRepository repository;
  GetUserPrivateKeyUsecaseImp(this.repository);

  @override
  Future<Either<DomainError, String>> call() async =>
      await repository.getPrivateKey();
}
