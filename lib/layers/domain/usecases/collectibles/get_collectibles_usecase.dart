import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/nfts_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class CollectiblesUsecase {
  Future<Either<DomainError, List<CollectiblesEntity>>> call({
    required int page,
    required int limit,
    required String type,
  });
}
