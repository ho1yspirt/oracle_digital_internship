import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:oracle_digital_internship/src/app/data/app_config.dart';
import 'package:oracle_digital_internship/src/core/components/rest_client/interceptors/logger_interceptor.dart';

abstract interface class IAppRestClient {
  Future<Response> get(
    String path, {
    Map<String, dynamic>? parameters,
  });

  Future<Response> post(
    String path,
    Object? data, {
    Map<String, dynamic>? parameters,
  });

  Future<Response> patch(
    String path,
    Object? data, {
    Map<String, dynamic>? parameters,
  });

  Future<Response> put(
    String path,
    Object? data, {
    Map<String, dynamic>? parameters,
  });

  Future<Response> delete(
    String path,
    Object? data, {
    Map<String, dynamic>? parameters,
  });
}

class AppRestClient implements IAppRestClient {
  AppRestClient(IAppConfig appConfig) {
    dio = Dio(BaseOptions(
      baseUrl: appConfig.baseUrl,
      responseType: ResponseType.plain,
    ))
      ..interceptors.addAll([
        if (kDebugMode) LoggerInterceptor(),
        // AuthInterceptor(),
        // RefreshInterceptor(),
      ]);
  }

  late final Dio dio;

  @override
  Future<Response> get(
    String path, {
    Map<String, dynamic>? parameters,
  }) async =>
      await dio.get(
        path,
        queryParameters: parameters,
      );

  @override
  Future<Response> post(
    String path,
    Object? data, {
    Map<String, dynamic>? parameters,
  }) async =>
      await dio.get(
        path,
        data: data,
        queryParameters: parameters,
      );

  @override
  Future<Response> patch(
    String path,
    Object? data, {
    Map<String, dynamic>? parameters,
  }) async =>
      await dio.patch(
        path,
        data: data,
        queryParameters: parameters,
      );

  @override
  Future<Response> put(
    String path,
    Object? data, {
    Map<String, dynamic>? parameters,
  }) async =>
      await dio.put(
        path,
        data: data,
        queryParameters: parameters,
      );

  @override
  Future<Response> delete(
    String path,
    Object? data, {
    Map<String, dynamic>? parameters,
  }) async =>
      await dio.delete(
        path,
        data: data,
        queryParameters: parameters,
      );
}
