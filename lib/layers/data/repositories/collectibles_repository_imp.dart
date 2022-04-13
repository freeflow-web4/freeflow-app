import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/data/datasources/collectibles_datasource.dart';
import 'package:freeflow/layers/domain/entities/collectibles_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/collectibles_repository.dart';

class CollectiblesRepositoryImp implements CollectiblesRepository {
  final CollectiblesDataSource _collectiblesDataSource;
  CollectiblesRepositoryImp(this._collectiblesDataSource);

  @override
  Future<Either<DomainError, List<CollectiblesEntity>>> getCollectibles(
      {required int page,required int limit, required String type,}) async {
    try {
      final result = await _collectiblesDataSource.getCollectibles(
          page: page,
          limit: limit,
          type: type,);
      return Right(result);
    } on Exception catch (error) {
      return Left(convertToDomainError(error.toString()));
    }
  }

}
