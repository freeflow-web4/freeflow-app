import 'package:dio/dio.dart';
import 'package:freeflow/layers/data/datasources/wallet_datasource.dart';
import 'package:freeflow/layers/data/dtos/transcript_dto.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/infra/http/http_client.dart';

class WalletDatasourceImp implements WalletDatasource {
  final HttpClient client;
  WalletDatasourceImp(this.client);

  @override
  Future<List<TranscriptEntity>> getTranscripts({
    required int offset,
    String? category,
  }) async {
    Map<String, dynamic> query = {
      'offset': offset,
      'category': category,
    };
    if(category == null){
      query.remove('category');
    }

    try {
      final response = await client.get(
          'users-transcript/get-users-transcript',
          query: query,);
      List<TranscriptEntity> transcripts =  List<TranscriptEntity>.from(response.data.map((model)=> TranscripDto.fromJson(model).toEntity()));

      return transcripts;

      // return await Future.delayed(const Duration(seconds: 1), () {
      //   return WalletUtil.transcriptsMocked;
      // });
    } catch (error) {
      if (error is DioError) {
        throw Exception(error.message);
      } else {
        throw Exception(error.toString());
      }
    }
  }

  @override
  Future<TranscriptEntity> getTranscript({required String id, required String status,}) async {
    try {
      final response = await client.get('users-transcript/$id',
        query: {
          "changeViewed" : status
        },
      );
      return TranscripDto.fromJson(response.data).toEntity();
    } catch (error) {
      if (error is DioError) {
        throw Exception(error.message);
      } else {
        throw Exception(error.toString());
      }
    }
  }
}
