import 'package:get_it/get_it.dart';
import 'package:storeapp/core/app/app_cubite/app_cubit.dart';
import 'package:storeapp/core/services/graphql/api_service.dart';
import 'package:storeapp/core/services/graphql/dio_factory.dart';

final sl = GetIt.instance;
Future<void> setupInjector() async {
  //bloc
  await _initCore();

  //usecase
}


Future<void> _initCore() async {
final dio=DioFactory.getdio();


  sl..registerFactory(AppCubit.new)..registerLazySingleton<ApiService>(() =>ApiService(dio));
}
