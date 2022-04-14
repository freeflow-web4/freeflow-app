import 'package:dio/dio.dart';

abstract class HttpClient {
  Future<Response> get(String url);
  Future<Response> post(String url, {required Map<String, dynamic> body});
  Future<Response> put(String url, {body});

}
