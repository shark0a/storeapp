import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:storeapp/core/services/pref_keys.dart';
import 'package:storeapp/core/services/shared_pref.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;
  static Dio getdio() {
    const timeOut = Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.headers['Authorization'] =
            'Bearer ${SharedPref().getString(SharedKeys.accessToken)}';
      debugPrint(
          "{USER TOKEN }=======> ${SharedPref().getString(SharedKeys.accessToken) ?? 'NULL TOKEN'}");
      addDioIntercepter();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioIntercepter() {
    dio?.interceptors.add(PrettyDioLogger(
      request: false,
      compact: false,
    ));
  }
}
