import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:storeapp/Features/auth/data/data_source/auth_data_source.dart';
import 'package:storeapp/Features/auth/data/repo/auth_repo.dart';
import 'package:storeapp/Features/auth/presentions/bloc/auth_bloc.dart';
import 'package:storeapp/core/app/app_cubite/app_cubit.dart';
import 'package:storeapp/core/app/upload/cubit/uploadimage_cubit.dart';
import 'package:storeapp/core/app/upload/data_source/uplaod_image_data_source.dart';
import 'package:storeapp/core/app/upload/repo/upload_image_repo.dart';
import 'package:storeapp/core/services/graphql/api_service.dart';
import 'package:storeapp/core/services/graphql/dio_factory.dart';

final sl = GetIt.instance;
Future<void> setupInjector() async {
  //bloc
  await _initCore();
  await _initAuth();
  //usecase
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();
  sl
    ..registerFactory(AppCubit.new)
    ..registerLazySingleton<ApiService>(() => ApiService(dio))
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
    ..registerFactory(() => UploadimageCubit(sl()))
    ..registerLazySingleton(() => UploadImageRepo(sl()))
    ..registerLazySingleton(() => UploadImageDataSource(sl()));
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(() => AuthBloc(sl()))
    ..registerLazySingleton(() => AuthRepos(sl()))
    ..registerLazySingleton(() => AuthDataSource(sl()));
}
