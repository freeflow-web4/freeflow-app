import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/edit_profile_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_profile_repository.dart';
import 'edit_profile_usecase.dart';

class EditProfileUsecaseImp implements EditProfileUsecase {
  final UserProfileRepository repository;

  EditProfileUsecaseImp(this.repository);

  @override
  Future<Either<DomainError, bool>> call({required EditProfileEntity editProfileEntity}) async {
    return await repository.editProfile(editProfileEntity: editProfileEntity);
  }

}
