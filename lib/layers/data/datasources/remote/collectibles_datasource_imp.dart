import 'package:dio/dio.dart';
import 'package:freeflow/layers/domain/entities/nfts_entity.dart';
import 'package:freeflow/layers/infra/http/http_client.dart';
import '../collectibles_datasource.dart';

class CollectiblesDataSourceImp implements CollectiblesDataSource {
  final HttpClient client;
  CollectiblesDataSourceImp(this.client);

  @override
  Future<List<CollectiblesEntity>> getCollectibles({
    required int page,
    required int limit,
    required String type
  }) async {
    try {
      final response = await client.post(
        'users',
        body: {
          //   "displayName": username,
          //   "file": image,
        },
      );
      if(response.statusCode == 200){
        return [];
      }
      //TODO CONFERIR ERROS
      throw Exception('ERROR');
    } catch (error) {
      if (error is DioError) {
        throw Exception(error.message);
      } else {
        throw Exception(error.toString());
      }
    }
  }



}
