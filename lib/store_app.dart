import 'package:flutter/material.dart';
import 'package:storeapp/common/screens/no_network.dart';
import 'package:storeapp/core/app/connectivity.dart';
import 'package:storeapp/core/app/env_variables.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnect,
      builder: (_, value, __) {
        if (value) {
          return MaterialApp(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            builder: (context, widget) {
              return Scaffold(
                body: Builder(
                  builder: (context) {
                    ConnectivityController.instance.init();
                    return widget!;
                  },
                ),
              );
            },
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Shark Store'),
              ),
              body: const Text("First line "),
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