import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/repositories/user_private_key_repository.dart';
import 'package:freeflow/layers/domain/usecases/user_private_key/set_user_private_key_usecase.dart';

class SetUserPrivateKeyUsecaseImp implements SetUserPrivateKeyUsecase {
  final UserPrivateKeyRepository repository;
  SetUserPrivateKeyUsecaseImp(this.repository);

  @override
  Future<Either<DomainError, bool>> call(String value) async =>
      await repository.setPrivateKey(value);
}
