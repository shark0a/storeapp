import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storeapp/Features/auth/presentions/widget/auth_info_title.dart';
import 'package:storeapp/Features/auth/presentions/widget/mode_and_language_button.dart';
import 'package:storeapp/Features/auth/presentions/widget/sign_up/sign_up_text_filed.dart';
import 'package:storeapp/Features/auth/presentions/widget/sign_up/user_avatar.dart';
import 'package:storeapp/common/widget/custom_linear_button.dart';
import 'package:storeapp/common/widget/text_app.dart';
import 'package:storeapp/core/extensions/context_extensions.dart';
import 'package:storeapp/core/language/lang_keys.dart';
import 'package:storeapp/core/routes/app_routes.dart';
import 'package:storeapp/core/styles/fonts/font_weight_helper.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ModeAndLanguageButton(),
          SizedBox(height: 25.sp),
          AuthTitleInfo(
            title: context.translate(LangKeys.signUp),
            descrip: context.translate(LangKeys.signUpWelcome),
          ),
          SizedBox(height: 35.sp),
          const UserAvatarImage(),
          SizedBox(height: 10.h),
          const SignUpTextFiled(),
          const SizedBox(
            height: 10,
          ),
          CustomLinearButton(
            width: MediaQuery.of(context).size.width,
            onPressed: () {},
            child: TextApp(
              text: context.translate(LangKeys.signUp),
              theme: context.textStyle.copyWith(
                color: context.color.textColor,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              context.pushReplacementNamed(AppRoutes.login);
            },
            child: TextApp(
                text: context.translate(LangKeys.youHaveAccount),
                theme: context.textStyle.copyWith(
                  color: context.color.bluePinkLight,
                  fontWeight: FontWeightHelper.bold,
                  fontSize: 16,
                )),
          )
        ],
      ),
    );
  }
}
