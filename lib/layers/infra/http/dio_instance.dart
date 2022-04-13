import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/get_user_is_logged_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/get_user_local_auth_usecase.dart';
import 'package:get_it/get_it.dart';

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
      _dioInterceptor = GetIt.I.get<AuthInterceptors>();
      _dioInstance!.interceptors.add(_dioInterceptor!);
    }

    return _dioInstance!;
  }
}

class AuthInterceptors extends InterceptorsWrapper {
  final GetUserIsLoggedUsecase userIsLoggedUsecase;
  final GetUserLocalAuthUsecase userLocalAuthUsecase;
  AuthInterceptors({
    required this.userIsLoggedUsecase,
    required this.userLocalAuthUsecase,
  });

  bool isLoggedIn = false;

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final bool hasAnotherToken = options.headers['Authorization'] != null;
    options.headers = hasAnotherToken ? options.headers : await getHeaders();
    return super.onRequest(options, handler);
  }

  final Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<Map<String, String>> getHeaders([String? contentType]) async {
    await setIsLoggedIn();
    if (!isLoggedIn) {
      return _headers;
    }

    final String? token = await getAuthToken();
    if (token == null) return _headers;

    final Map<String, String> headers = {'Authorization': 'Bearer ' + token};

    print('token: $token');
    if (contentType == null) {
      headers['Content-Type'] = 'application/json; charset=UTF-8';
    }

    return headers;
  }

  Future<void> setIsLoggedIn() async {
    final result = await userIsLoggedUsecase();
    result.fold(
      (l) => isLoggedIn = false,
      (r) => isLoggedIn = r,
    );
  }

  Future<String?> getAuthToken() async {
    String? token;
    final result = await userLocalAuthUsecase();
    result.fold(
      (l) => token = null,
      (r) => token = r.token,
    );
    return token;
  }
}
