import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/user_create_wallet_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class UserCreateWalletUseCase {
  Future<Either<DomainError, void>> call(
    UserCreateWalletEntity entity,
  );
}
