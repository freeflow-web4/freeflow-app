import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/wallet_repository.dart';
import 'get_transcript_usecase.dart';

class GetTranscriptImp implements GetTranscriptUsecase {
  final WalletRepository repository;
  GetTranscriptImp(this.repository);
  @override
  Future<Either<DomainError, TranscriptEntity>> call({
    required String id,
    required String status,
  }) async {
    return await repository.getTranscript(
      id: id,
      status: status,
    );
  }
}
