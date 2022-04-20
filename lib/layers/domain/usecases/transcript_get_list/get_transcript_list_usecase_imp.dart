import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/wallet_repository.dart';
import 'package:freeflow/layers/domain/usecases/transcript_get_list/get_transcript_list_usecase.dart';

class GetTranscriptsImp implements GetTranscripsUsecase {
  final WalletRepository repository;
  GetTranscriptsImp(this.repository);
  @override
  Future<Either<DomainError, List<TranscriptEntity>>> call({
    required int offset,
    String? category,
  }) async {
    return await repository.getTranscripts(
      offset: offset,
      category: category,
    );
  }
}
