import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storeapp/common/screens/no_network.dart';
import 'package:storeapp/core/app/app_cubite/app_cubit.dart';
import 'package:storeapp/core/app/connectivity.dart';
import 'package:storeapp/core/app/env_variables.dart';
import 'package:storeapp/core/di/injections_container.dart';
import 'package:storeapp/core/language/app_localization_setup.dart';
import 'package:storeapp/core/routes/app_routes.dart';
import 'package:storeapp/core/services/pref_keys.dart';
import 'package:storeapp/core/services/shared_pref.dart';
import 'package:storeapp/core/styles/theme/app_theme.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: ConnectivityController.instance.isConnect,
        builder: (_, value, __) {
          if (value) {
            return BlocProvider(
              create: (context) => sl<AppCubit>()
                ..changeAppThemeMode(
                    sharedMode: SharedPref().getBoolean(SharedKeys.themeMode))
                ..getSavedLanguage(),
              child: ScreenUtilInit(
                designSize: const Size(360, 690),
                minTextAdapt: true,
                child: BlocBuilder<AppCubit, AppState>(
                  buildWhen: (previous, current) {
                    return previous != current;
                  },
                  builder: (context, state) {
                    return MaterialApp(
                      title: 'my Store',
                      debugShowCheckedModeBanner:
                          EnvVariables.instance.depugMode,
                      theme: context.read<AppCubit>().isDark
                          ? themeLight()
                          : themeDark(),
                      locale: Locale(context.read<AppCubit>().languagecurent),
                      supportedLocales: AppLocalizationsSetup.supprtedLocales,
                      localeResolutionCallback:
                          AppLocalizationsSetup.localeResolutionCallback,
                      localizationsDelegates:
                          AppLocalizationsSetup.localizationsDelegates,
                      builder: (context, widget) {
                        return GestureDetector(
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          child: Scaffold(
                            body: Builder(
                              builder: (context) {
                                ConnectivityController.instance.init();
                                return widget!;
                              },
                            ),
                          ),
                        );
                      },
                      navigatorKey: sl<GlobalKey<NavigatorState>>(),
                      onGenerateRoute: AppRoutes.onGenerateRoute,
                      initialRoute:
                          SharedPref().getString(SharedKeys.accessToken) != null
                              ? SharedPref().getString(SharedKeys.userRole) ==
                                      'admin'
                                  ? AppRoutes.adminPage
                                  : AppRoutes.customerPage
                              : AppRoutes.login,
                    );
                  },
                ),
              ),
            );
          } else {
            return const MaterialApp(
              title: 'Shark Store',
              home: NoNetworkScreen(),
            );
          }
        });
  }
}
