import 'package:dio/dio.dart';
import 'package:freeflow/layers/data/dtos/collectibles/collectibles_dto.dart';
import 'package:freeflow/layers/domain/entities/collectibles_entity.dart';
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
      final response = await client.get('collectibles',);
      List<CollectiblesEntity> collectibles = List<CollectiblesEntity>.from(response.data.map((model)=> CollectiblesDto.fromJson(model).toEntity()));
      return collectibles;
    } catch (error) {
      if (error is DioError) {
        throw Exception(error.message);
      } else {
        throw Exception(error.toString());
      }
    }
  }



}
