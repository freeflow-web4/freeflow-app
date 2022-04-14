import 'package:dio/dio.dart';
import 'package:freeflow/layers/infra/http/http_client.dart';

class DioHttpClientImp implements HttpClient {
  final Dio _dio;
  DioHttpClientImp(this._dio);

  @override
  Future<Response> get(String url) async {
    final Response response = await _dio.get(url);
    return response;
  }

  @override
  Future<Response> post(String url,
      {required Map<String, dynamic> body,}) async {
    final Response response = await _dio.post(url, data: body);
    return response;
  }

  @override
  Future<Response> put(String url, { body}) async {
    final Response response = await _dio.put(url, data: body);
    return response;
  }
}
