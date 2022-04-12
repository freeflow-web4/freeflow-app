import 'package:freeflow/layers/domain/entities/nfts_entity.dart';

abstract class CollectiblesDataSource {

  Future<List<CollectiblesEntity>> getCollectibles(
      {required int page,required int limit, required String type}
      );
}
