import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:storeapp/core/app/env_variables.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvVariables.instance.init(envTypeEnum: EnvTypeEnum.dev);
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyCUPBQu9Yc1MI1nX9EyCn2dQs-Da-NIEjU",
              appId: "1:58046617237:android:727105b2b99efa884fed9c",
              messagingSenderId: "58046617237",
              projectId: "storeapp-3b378"))
      : await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp])
      .then((_) => runApp(const StoreApp()));
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: const Text("First line "),
      ),
    );
  }
}
