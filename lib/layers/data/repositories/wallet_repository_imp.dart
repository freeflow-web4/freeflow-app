import 'package:freeflow/layers/data/datasources/wallet_datasource.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/repositories/wallet_repository.dart';

class WalletRepositoryImp implements WalletRepository {
  final WalletDatasource datasource;
  WalletRepositoryImp(this.datasource);

  @override
  Future<Either<DomainError,List <TranscriptEntity>>> getTranscripts({required int offset, String? category,}) async {
    try {
      final result = await datasource.getTranscripts(
        offset: offset,
        category: category,
      );
      return Right(result);
    } on Exception catch (error) {
      return Left(convertToDomainError(error.toString()));
    }
  }
}
