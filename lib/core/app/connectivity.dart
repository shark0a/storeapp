import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityController {
  ConnectivityController._();
  static final ConnectivityController instance = ConnectivityController._();
  ValueNotifier<bool> isConnect = ValueNotifier(true);
  bool isConnectedToInternet(ConnectivityResult? result) {
    if (result == ConnectivityResult.none) {
      isConnect.value = false;
      Connectivity().onConnectivityChanged.listen(isConnectedToInternet);
      return false;
    } else if (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile) {
      isConnect.value = true;
      return true;
    } else {
      return false;
    }
  }

  void init() async {
    final result = await Connectivity().checkConnectivity();
    isConnectedToInternet(result);
  }
}
