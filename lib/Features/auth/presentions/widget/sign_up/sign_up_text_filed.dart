import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storeapp/common/widget/custom_text_field.dart';
import 'package:storeapp/core/extensions/context_extensions.dart';
import 'package:storeapp/core/language/lang_keys.dart';
import 'package:storeapp/core/util/app_regex.dart';

class SignUpTextFiled extends StatefulWidget {
  const SignUpTextFiled({super.key});

  @override
  State<SignUpTextFiled> createState() => _SignUpTextFiledState();
}

class _SignUpTextFiledState extends State<SignUpTextFiled> {
  bool isshow = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: TextEditingController(),
          hintText: context.translate(LangKeys.fullName),
          keyboardType: TextInputType.name,
        ),
        SizedBox(height: 20.h),
        CustomTextField(
          controller: TextEditingController(),
          hintText: context.translate(LangKeys.email),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (AppRegex.isEmailValid('')) {
              return context.translate(LangKeys.validEmail);
            }
            return null;
          },
        ),
        SizedBox(height: 20.h),
        CustomTextField(
          controller: TextEditingController(),
          hintText: context.translate(LangKeys.password),
          keyboardType: TextInputType.visiblePassword,
          validator: (p0) {
            if (AppRegex.isPasswordValid('')) {
              return context.translate(LangKeys.validPasswrod);
            }
            return null;
          },
          suffixIcon: IconButton(
            onPressed: () {
              isshow = !isshow;
              setState(() {});
            },
            icon: isshow
                ? const Icon(Icons.visibility_off_sharp)
                : const Icon(Icons.visibility_outlined),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
