import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class GetTranscripsUsecase {
  Future<Either<DomainError, List<TranscriptEntity>>> call({
    required int offset,
    String? category,
  });
}
