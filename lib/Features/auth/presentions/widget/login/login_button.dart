import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storeapp/Features/auth/presentions/bloc/auth_bloc.dart';
import 'package:storeapp/common/widget/custom_linear_button.dart';
import 'package:storeapp/common/widget/text_app.dart';
import 'package:storeapp/core/extensions/context_extensions.dart';
import 'package:storeapp/core/language/lang_keys.dart';
import 'package:storeapp/core/routes/app_routes.dart';
import 'package:storeapp/core/styles/fonts/font_weight_helper.dart';
import 'package:storeapp/core/util/common_methods.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (userRole) {
            CommonMethods.showError(
                context, context.translate(LangKeys.loggedSuccessfully));
            if (userRole == 'admin') {
              context.pushNamedAndRemoveUntil(AppRoutes.adminPage);
            } else {
              context.pushNamedAndRemoveUntil(AppRoutes.customerPage);
            }
          },
          faliure: (messsage) {
            CommonMethods.showError(context, messsage);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return CustomLinearButton(
              onPressed: () {},
              height: 50.h,
              width: MediaQuery.of(context).size.width,
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          },
          orElse: () {
            return CustomLinearButton(
              onPressed: () {
                _validiateAndLogin(context);
              },
              height: 50.h,
              width: MediaQuery.of(context).size.width,
              child: TextApp(
                text: context.translate(LangKeys.login),
                theme: context.textStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _validiateAndLogin(BuildContext context) {
    if (context.read<AuthBloc>().formKey.currentState!.validate()) {}
    context.read<AuthBloc>().add(const AuthEvent.login());
  }
}
