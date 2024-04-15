import 'package:flutter/material.dart';
import 'package:storeapp/Features/auth/presentions/refactor/auth_custom_painter.dart';
import 'package:storeapp/Features/auth/presentions/refactor/login_body.dart';
import 'package:storeapp/core/extensions/context_extensions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomPaint(
        size: Size(MediaQuery.of(context).size.width, 150),
        painter: AuthCustomPainter(
          gradient: LinearGradient(
            colors: [
              context.color.bluePinkLight!,
              context.color.bluePinkLight!,
              context.color.bluePinkLight!,
              context.color.bluePinkDark!,
            ],
          ),
        ),
      ),
      body: const SafeArea(
        bottom: false,
        child: LoginBody(),
      ),
    );
  }
}
