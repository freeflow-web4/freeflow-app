import 'package:freeflow/layers/domain/entities/user_create_wallet_entity.dart';

abstract class UserCreateWalletDataSource {
  Future<void> createWallet(
    UserCreateWalletEntity entity,
  );
}