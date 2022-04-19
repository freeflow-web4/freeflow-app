import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/edit_profile_entity.dart';
import 'package:freeflow/layers/domain/entities/profile_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class EditProfileUsecase {
  Future<Either<DomainError, ProfileEntity?>> call({required EditProfileEntity editProfileEntity});
}
