import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/core/app/env_variables.dart';

import 'store_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await EnvVariables.instance.init(envTypeEnum: EnvTypeEnum.dev);
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyCUPBQu9Yc1MI1nX9EyCn2dQs-Da-NIEjU",
              appId: "1:58046617237:android:727105b2b99efa884fed9c",
              messagingSenderId: "58046617237",
              projectId: "storeapp-3b378"))
      : await Firebase.initializeApp();
  runApp(const StoreApp());
}
