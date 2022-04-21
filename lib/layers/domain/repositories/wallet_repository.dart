import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class WalletRepository {
  Future<Either<DomainError, List<TranscriptEntity>>> getTranscripts({
    required int offset, String? category,});

  Future<Either<DomainError, TranscriptEntity>> getTranscript({
    required String id,required String status,});


}
