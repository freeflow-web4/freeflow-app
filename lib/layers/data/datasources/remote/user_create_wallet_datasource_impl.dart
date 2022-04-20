import 'package:dio/dio.dart';
import 'package:freeflow/layers/data/datasources/user_create_wallet_datasource.dart';
import 'package:freeflow/layers/data/dtos/user_create_wallet/user_create_wallet_dto.dart';
import 'package:freeflow/layers/domain/entities/user_create_wallet_entity.dart';
import 'package:freeflow/layers/infra/http/http_client.dart';

class UserCreateWalletDataSourceImpl implements UserCreateWalletDataSource {
  final HttpClient client;

  UserCreateWalletDataSourceImpl(this.client);
  @override
  Future<void> createWallet(UserCreateWalletEntity entity) async {
    try {
      final json = UserCreateWalletDTO.fromEntity(entity).toJson();
      final response = await client.post(
        'users/create',
        body: json,
      );
      if (response.statusCode != 200) throw Exception(response.data['message']);
    } catch (error) {
      if (error is DioError) {
        throw Exception(error.message);
      } else {
        throw Exception(error.toString());
      }
    }
  }
}
