import 'package:freeflow/layers/data/datasources/user_pincode_datasource.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/repositories/user_pincode_repository.dart';

class UserPincodeRepositoryImp implements UserPincodeRepository {
  final UserPincodeDatasource datasource;
  UserPincodeRepositoryImp(this.datasource);

  @override
  Future<Either<DomainError, bool>> getPinCode() async {
    try {
      final result = await datasource.getPincode();
      return Right(result);
    } on Exception catch (error) {
      return Left(convertToDomainError(error.toString()));
    }
  }

  @override
  Future<Either<DomainError, bool>> setPincode(String pincode) async {
    try {
      final result = await datasource.setPincode(pincode);
      return Right(result);
    } on Exception catch (error) {
      return Left(convertToDomainError(error.toString()));
    }
  }
}
