import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/transcript_details_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class GetTranscriptDetailsUsecase {
  Future<Either<DomainError, TranscriptDetailsEntity>> call({
    required String id,
    required String status,
  });
}
