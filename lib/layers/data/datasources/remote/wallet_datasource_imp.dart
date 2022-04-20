import 'package:dio/dio.dart';
import 'package:freeflow/layers/data/datasources/wallet_datasource.dart';
import 'package:freeflow/layers/data/dtos/transcript_dto.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/infra/http/http_client.dart';
import 'package:freeflow/layers/presentation/pages/wallet/util/wallet_util.dart';

class WalletDatasourceImp implements WalletDatasource {
  final HttpClient client;
  WalletDatasourceImp(this.client);

  @override
  Future<List<TranscriptEntity>> getTranscripts({
    required int offset,
    String? category,
  }) async {
    final url = 'users-transcript/get-users-transcript?offset=$offset';
    try {
      final response = await client.get(url);
      List<TranscriptEntity> transcripts =  List<TranscriptEntity>.from(response.data.map((model)=> TranscripDto.fromJson(model).toEntity()));

      print('scatus = ${response.statusCode}');
      print('data = ${response.data}');

      //return transcripts;



      return await Future.delayed(const Duration(seconds: 1), () {
        return WalletUtil.transcriptsMocked;
      });
    } catch (error) {
      if (error is DioError) {
        throw Exception(error.message);
      } else {
        throw Exception(error.toString());
      }
    }
  }
}
