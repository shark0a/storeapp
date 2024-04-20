import 'package:flutter/material.dart';
import 'package:storeapp/Features/auth/presentions/screens/login_screen.dart';
import 'package:storeapp/Features/auth/presentions/screens/sign_up_screen.dart';
import 'package:storeapp/common/screens/under_build_page.dart';
import 'package:storeapp/core/routes/base_routs.dart';

class AppRoutes {
  static const login = "Login";
  static const signUp = "SignUp";
  static Route<void> onGenerateRoute(RouteSettings setting) {
    final arg = setting.arguments;
    switch (setting.name) {
      case login:
        return BaseRoute(page: const LoginScreen());

      case signUp:
        return BaseRoute(page: const SignUpScreen());
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
