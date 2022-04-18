import 'package:freeflow/layers/domain/entities/edit_profile_entity.dart';
import 'package:freeflow/layers/data/datasources/user_profile_datasource.dart';
import 'package:freeflow/layers/domain/entities/profile_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/repositories/user_profile_repository.dart';

class UserProfileRepositoryImp implements UserProfileRepository {
  final UserProfileDataSource _userProfileDataSource;
  UserProfileRepositoryImp(this._userProfileDataSource);

  @override
  Future<Either<DomainError, ProfileEntity>> getProfile() async {
    try {
      final result = await _userProfileDataSource.getProfile();
      return Right(result);
    } on Exception catch (error) {
      return Left(convertToDomainError(error.toString()));
    }
  }

  @override
  Future<Either<DomainError, ProfileEntity?>> editProfile({required EditProfileEntity editProfileEntity}) async {
    try {
      final result = await _userProfileDataSource.editProfile(editProfileEntity: editProfileEntity,);
      return Right(result);
    } on Exception catch (error) {
      return Left(convertToDomainError(error.toString()));
    }
  }
}
