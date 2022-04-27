import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/transcript_details_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/wallet_repository.dart';
import 'get_transcript_details_usecase.dart';

class GetTranscriptDetailsImp implements GetTranscriptDetailsUsecase {
  final WalletRepository repository;
  GetTranscriptDetailsImp(this.repository);
  @override
  Future<Either<DomainError, TranscriptDetailsEntity>> call({
    required String id,
    required String status,
  }) async {
    return await repository.getTranscriptDetails(
      id: id,
      status: status,
    );
  }
}
