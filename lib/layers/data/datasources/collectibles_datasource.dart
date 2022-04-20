import 'package:freeflow/layers/domain/entities/collectibles_entity.dart';

abstract class CollectiblesDataSource {

  Future<List<CollectiblesEntity>> getCollectibles(
      {required int page,
        required int limit,
        String? type,});
}
