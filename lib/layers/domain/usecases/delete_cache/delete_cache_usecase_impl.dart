import 'package:freeflow/layers/domain/repositories/cache_repository.dart';
import 'package:freeflow/layers/domain/usecases/delete_cache/delete_cache_usecase.dart';

class DeleteCacheUsecaseImpl implements DeleteCacheUsecase {
  final CacheRepository cacheRepository;

  DeleteCacheUsecaseImpl(this.cacheRepository);
  @override
  Future<void> call() {
    return cacheRepository.clear();
  }
}
