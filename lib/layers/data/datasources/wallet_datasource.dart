import 'package:freeflow/layers/domain/entities/transcript_details_entity.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';

abstract class WalletDatasource {
  Future<List<TranscriptEntity>> getTranscripts({required int offset, String? category});

  Future<TranscriptDetailsEntity> getTranscriptDetails({required String id,required String status});


}
