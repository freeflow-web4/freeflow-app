import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/profile_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_profile_repository.dart';

import 'get_profile_usecase.dart';

class GetProfileUsecaseImp implements GetProfileUsecase {
  final UserProfileRepository repository;

  GetProfileUsecaseImp(this.repository);

  @override
  Future<Either<DomainError, ProfileEntity>> call() async {
    return await repository.getProfile();
  }

}
