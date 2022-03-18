import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioInstance {
  static Dio? _dioInstance;
  static BaseOptions? _options;
  static InterceptorsWrapper? _dioInterceptor;

  static Dio api() {
    _options = _options ??
        BaseOptions(
          baseUrl: dotenv.env['API_URL']!,
          connectTimeout: 30 * 1000,
        );

    _dioInstance = (_dioInstance ?? Dio(_options));

    if (_dioInterceptor == null) {
      _dioInterceptor = AuthInterceptors();
      _dioInstance!.interceptors.add(_dioInterceptor!);
    }

    return _dioInstance!;
  }
}

class AuthInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final bool hasAnotherToken = options.headers['Authorization'] != null;
    options.headers = hasAnotherToken ? options.headers : getHeaders();
    return super.onRequest(options, handler);
  }

  final Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Map<String, String> getHeaders() => _headers;
}
