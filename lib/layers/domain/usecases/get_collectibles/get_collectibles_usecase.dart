import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/collectibles_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class GetCollectiblesUsecase {
  Future<Either<DomainError, List<CollectiblesEntity>>> call({
    required int page,
    required int limit,
    String? type,
  });
}
