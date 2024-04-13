import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storeapp/common/screens/no_network.dart';
import 'package:storeapp/core/app/connectivity.dart';
import 'package:storeapp/core/app/env_variables.dart';
import 'package:storeapp/core/language/app_localization_setup.dart';
import 'package:storeapp/core/styles/theme/app_theme.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnect,
      builder: (_, value, __) {
        if (value) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            child: MaterialApp(
              theme: themeDark(),
              locale: Locale('en'),
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
              home: Scaffold(
                appBar: AppBar(
                  title: const Text('Shark Store'),
                ),
                body: const Text("First line "),
              ),
            ),
          );
        } else {
          return MaterialApp(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: EnvVariables.instance.depugMode,
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Shark Store'),
              ),
              body: const NoNetworkScreen(),
            ),
          );
        }
      },
    );
  }
}
