import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/user_create_wallet_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class UserCreateWalletRepository {
  Future<Either<DomainError, void>> createWallet(
    UserCreateWalletEntity entity,
  );
}
