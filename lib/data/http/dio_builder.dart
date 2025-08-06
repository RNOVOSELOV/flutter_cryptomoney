import 'package:dio/dio.dart';

import '../../resources/app_constants.dart';
import 'token_interceptor.dart';


class DioBuilder {
  late final Dio _dio;

  DioBuilder() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.apiUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
      ),
    );
  }

  DioBuilder addAuthInterceptor(final AuthTokenInterceptor interceptor) {
    _dio.interceptors.add(interceptor);
    return this;
  }

  DioBuilder addHeaderParameters() {
    _dio.options.headers['Accept'] = 'application/json';
    return this;
  }

  Dio build() => _dio;
}
