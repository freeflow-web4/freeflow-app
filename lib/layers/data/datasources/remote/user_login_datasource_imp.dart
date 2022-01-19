import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freeflow/layers/data/datasources/user_login_datasource.dart';
import 'package:freeflow/layers/data/dtos/user_login_dto.dart';

class UserLoginDataSourceImp implements UserLoginDataSource {
  var options = BaseOptions(baseUrl: "https://app.fakejson.com/q/");

  @override
  Future<Either<Exception, UserLoginDto>> call(String privateKey) async {
    try {
      var response =
          await Dio(options).get("wVupBTi5?token=0Zrj3ZoYTyoUop3s22Nagw");
      return Right(UserLoginDto.fromJson(response.data));
    } catch (e) {
      return Left(Exception("Login Api Error"));
    }
  }
}
