import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/core/services/pref_keys.dart';
import 'package:storeapp/core/services/shared_pref.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    const timeOut = Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      debugPrint(
        "[USER Token] ====> ${SharedPref().getString(SharedKeys.accessToken) ?? 'NULL TOKEN'}",
      );

      // addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  // static void addDioInterceptor() {
  //   dio?.interceptors.add(
  //     PrettyDioLogger(
  //       request: false,
  //       compact: false,
  //     ),
  //   );
  //   dio?.interceptors.add(
  //     InterceptorsWrapper(
  //       onRequest: (options, handler) {
  //         options.headers['Authorization'] =
  //             'Bearer ${SharedPref().getString(SharedKeys.accessToken)}';

  //         return handler.next(options);
  //       },
  //       onError: (error, handler) async {
  //         if (error.response?.statusCode == 401) {
  //           await AppLogout().logout();
  //         }
  //       },
  //     ),
  //   );
  // }
}
