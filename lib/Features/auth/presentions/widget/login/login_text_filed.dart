import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storeapp/Features/auth/presentions/bloc/auth_bloc.dart';
import 'package:storeapp/common/widget/custom_text_field.dart';
import 'package:storeapp/core/extensions/context_extensions.dart';
import 'package:storeapp/core/language/lang_keys.dart';
import 'package:storeapp/core/util/app_regex.dart';

class LoginTextFiled extends StatefulWidget {
  const LoginTextFiled({super.key});

  @override
  State<LoginTextFiled> createState() => _LoginTextFiledState();
}

bool isShowPass = false;
late AuthBloc _bloc;

class _LoginTextFiledState extends State<LoginTextFiled> {
  @override
  void initState() {
    _bloc = context.read<AuthBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.emailController.dispose();
    _bloc.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _bloc.formKey,
        child: Column(children: [
          CustomTextField(
            controller: _bloc.emailController,
            hintText: context.translate(LangKeys.email),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (AppRegex.isEmailValid(_bloc.emailController.text)) {
                return context.translate(LangKeys.validEmail);
              }
              return null;
            },
          ),

          SizedBox(
            height: 25.h,
          ),
          //password
          CustomTextField(
            controller: _bloc.passwordController,
            hintText: context.translate(LangKeys.password),
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null || value.isEmpty || value.length <= 6) {
                return context.translate(LangKeys.validPasswrod);
              }
              return null;
            },
            obscureText: isShowPass,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isShowPass = !isShowPass;
                });
              },
              icon: isShowPass
                  ? const Icon(
                      Icons.visibility_off,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.visibility,
                      color: Colors.white,
                    ),
            ),
          ),
        ]));
  }
}
