import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/entities/profile_entity.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class UserProfileRepository {
  Future<Either<DomainError, ProfileEntity>> getProfile();
  Future<Either<DomainError, bool>> editProfile(String name, Uint8List? image);
}
