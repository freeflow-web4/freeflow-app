import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/repositories/user_profile_repository.dart';
import 'package:freeflow/layers/domain/repositories/username_exists_repository.dart';

import 'edit_profile_usecase.dart';

class EditProfileUsecaseImp implements EditProfileUsecase {
  final UserProfileRepository repository;
  EditProfileUsecaseImp(this.repository);
  @override
  Future<Either<DomainError, bool>> call(String username, String image) async {
    return await repository.editProfile(username, image);
  }
}
