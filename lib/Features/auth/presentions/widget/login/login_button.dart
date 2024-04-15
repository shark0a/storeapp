import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storeapp/common/widget/custom_linear_button.dart';
import 'package:storeapp/common/widget/text_app.dart';
import 'package:storeapp/core/extensions/context_extensions.dart';
import 'package:storeapp/core/language/lang_keys.dart';
import 'package:storeapp/core/styles/fonts/font_weight_helper.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLinearButton(
      onPressed: () {},
      height: 50.h,
      width: MediaQuery.of(context).size.width,
      child: TextApp(
        text: context.translate(LangKeys.login),
        theme: context.textStyle.copyWith(
          color: context.color.textColor,
          fontSize: 18.sp,
          fontWeight: FontWeightHelper.medium,
        ),
      ),
    );
  }
}
