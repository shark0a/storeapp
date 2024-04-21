import 'package:get_it/get_it.dart';
import 'package:storeapp/core/app/app_cubite/app_cubit.dart';

final sl = GetIt.instance;
Future<void> setupInjector() async {
  //bloc
  await _initCore();

  //usecase
}

Future<void> _initCore() async {
  sl.registerFactory(AppCubit.new);
}
