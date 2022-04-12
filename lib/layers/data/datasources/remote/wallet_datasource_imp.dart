import 'package:dio/dio.dart';
import 'package:freeflow/layers/data/datasources/wallet_datasource.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/infra/http/http_client.dart';
import 'package:freeflow/layers/presentation/pages/wallet/util/wallet_util.dart';

class WalletDatasourceImp implements WalletDatasource {
  final HttpClient client;
  WalletDatasourceImp(this.client);

  @override
  Future<List<TranscriptEntity>> getTranscriptList({
    required int offset,
    String? category,
  }) async {
    final url = 'users-transcript/get-users-transcript?offset=$offset';
    try {
      // final response = await client.get(url);
      // final transcript = TranscripDto.fromJson(response.data).toEntity();
      return WalletUtil.transcriptsMocked;
    } catch (error) {
      if (error is DioError) {
        throw Exception(error.message);
      } else {
        throw Exception(error.toString());
      }
    }
  }
}
