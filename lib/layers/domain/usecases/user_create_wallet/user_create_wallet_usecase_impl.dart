import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/entities/user_create_wallet_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/repositories/user_create_wallet_repository.dart';
import 'package:freeflow/layers/domain/usecases/user_create_wallet/user_create_wallet_usecase.dart';

class UserCreateWalletUseCaseImpl implements UserCreateWalletUseCase {
  final UserCreateWalletRepository userCreateWalletRepository;

  UserCreateWalletUseCaseImpl(this.userCreateWalletRepository);
  @override
  Future<Either<DomainError, void>> call(UserCreateWalletEntity entity) {
    return userCreateWalletRepository.createWallet(entity);
  }
}
