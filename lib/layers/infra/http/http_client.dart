import 'package:dio/dio.dart';

abstract class HttpClient {
  Future<Response> get(String url, {Map<String, dynamic>? query});
  Future<Response> post(String url, {required Map<String, dynamic> body});
  Future<Response> put(String url, {body});

}
