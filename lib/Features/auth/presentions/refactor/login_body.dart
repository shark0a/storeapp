import 'package:flutter/material.dart';
import 'package:storeapp/Features/auth/presentions/widget/auth_info_title.dart';
import 'package:storeapp/Features/auth/presentions/widget/login/login_button.dart';
import 'package:storeapp/Features/auth/presentions/widget/login/login_text_filed.dart';
import 'package:storeapp/common/widget/text_app.dart';
import 'package:storeapp/core/extensions/context_extensions.dart';
import 'package:storeapp/core/language/lang_keys.dart';
import 'package:storeapp/core/routes/app_routes.dart';
import 'package:storeapp/core/styles/fonts/font_weight_helper.dart';

import '../widget/mode_and_language_button.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ModeAndLanguageButton(),
            const SizedBox(
              height: 30,
            ),
            AuthTitleInfo(
                title: context.translate(LangKeys.login),
                descrip: context.translate(LangKeys.welcome)),
            const SizedBox(
              height: 30,
            ),
            const LoginTextFiled(),
            const SizedBox(
              height: 30,
            ),
            const LoginButton(),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                context.pushReplacementNamed(AppRoutes.signUp);
              },
              child: TextApp(
                text: context.translate(LangKeys.createAccount),
                theme: context.textStyle.copyWith(
                  color: context.color.bluePinkLight,
                  fontSize: 18,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
