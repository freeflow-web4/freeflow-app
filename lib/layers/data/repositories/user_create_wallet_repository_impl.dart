import 'package:freeflow/layers/data/datasources/user_create_wallet_datasource.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/entities/user_create_wallet_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/repositories/user_create_wallet_repository.dart';

class UserCreateWalletRepositoryImpl implements UserCreateWalletRepository {
  final UserCreateWalletDataSource _userCreateWalletDataSource;

  UserCreateWalletRepositoryImpl(this._userCreateWalletDataSource);
  @override
  Future<Either<DomainError, void>> createWallet(
    UserCreateWalletEntity entity,
  ) async {
    try {
      final result = await _userCreateWalletDataSource.createWallet(entity);
      return Right(result);
    } on Exception catch (error) {
      return Left(convertToDomainError(error.toString()));
    }
  }
}
