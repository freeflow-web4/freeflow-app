import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/user_create_wallet_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/user_create_wallet_error.dart';

abstract class UserCreateWalletRepository {
  Future<Either<UserCreateWalletError, void>> createWallet(
    UserCreateWalletEntity entity,
  );
}
