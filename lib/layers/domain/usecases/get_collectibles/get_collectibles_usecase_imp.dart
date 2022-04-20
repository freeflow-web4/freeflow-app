import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/collectibles_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/collectibles_repository.dart';

import 'get_collectibles_usecase.dart';

class CollectiblesUsecaseImp implements GetCollectiblesUsecase {
  final CollectiblesRepository repository;

  CollectiblesUsecaseImp(this.repository);

  @override
  Future<Either<DomainError, List<CollectiblesEntity>>> call({
    required int page,
    required int limit,
    String? type,}) async {
    return await repository.getCollectibles(page: page, limit:limit, type:type);
  }

}
