import 'package:dio/dio.dart';

import 'endpoint.dart';
import 'interceptors/logger_interceptor.dart';

class NetworkClient {
  static final dio = Dio(
    BaseOptions(
      baseUrl: Endpoints.baseUrl,
      connectTimeout: Endpoints.connectionTimeout,
      receiveTimeout: Endpoints.receiveTimeout,
    ),
  )..interceptors.addAll([
      // AuthorizationInterceptor(),
      LoggerInterceptor(),
    ]);

  ///
  Future<Response<dynamic>> call({
    required String path,
    required RequestMethod requestMethod,
    Object? data,
    Map<String, dynamic>? queryParams,
  }) async {
    ///
    return switch (requestMethod) {
      RequestMethod.get => await dio.get(path, queryParameters: queryParams),
      RequestMethod.post => await dio.post(path, data: data, queryParameters: queryParams),
      RequestMethod.put => await dio.put(path, data: data, queryParameters: queryParams),
      RequestMethod.patch => await dio.patch(path, data: data, queryParameters: queryParams),
      RequestMethod.delete => await dio.delete(path, data: data, queryParameters: queryParams),
    };
  }
}

///
enum RequestMethod {
  ///
  get,

  ///
  post,

  ///
  put,

  ///
  patch,

  ///
  delete,
}
