import 'package:flutter/material.dart';

class CommonMethods {
  static void showError(BuildContext context, String errMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errMessage),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
