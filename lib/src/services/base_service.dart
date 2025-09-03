// package we need for json encode/decode
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:flutter/material.dart';

import '../helpers/shared_preferences.dart';
import '../startup.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey(debugLabel: "Main Navigator");

abstract class BaseService {
  late final Dio dio = singleton.get<DioClient>()._dio;

  BaseService() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }
}

class DioClient {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://a03b97200fb1.ngrok-free.app/api',
      connectTimeout: 500000,
      receiveTimeout: 100000,
      responseType: ResponseType.json,
    ),
  );

  DioClient() {
    _dio.interceptors.add(DioInterceptor());

  }

  Dio get dio => _dio;
}

class DioInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError

    super.onError(err, handler);
  }
}
