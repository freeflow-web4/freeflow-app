import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/user_create_wallet_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/user_create_wallet_error.dart';

abstract class UserCreateWalletUseCase {
  Future<Either<UserCreateWalletError, void>> call(
    UserCreateWalletEntity entity,
  );
}
