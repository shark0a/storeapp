import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/Features/auth/presentions/bloc/auth_bloc.dart';
import 'package:storeapp/Features/auth/presentions/screens/login_screen.dart';
import 'package:storeapp/Features/auth/presentions/screens/sign_up_screen.dart';
import 'package:storeapp/common/screens/under_build_page.dart';
import 'package:storeapp/core/di/injections_container.dart';
import 'package:storeapp/core/routes/base_routs.dart';

class AppRoutes {
  static const login = "Login";
  static const signUp = "SignUp";
  static Route<void> onGenerateRoute(RouteSettings setting) {
    final arg = setting.arguments;
    switch (setting.name) {
      case login:
        return BaseRoute(
            page: BlocProvider(
          create: (context) => sl<AuthBloc>(),
          child: const LoginScreen(),
        ));

      case signUp:
        return BaseRoute(page: const SignUpScreen());
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
