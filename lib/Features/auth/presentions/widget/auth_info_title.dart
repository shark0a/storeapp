import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storeapp/common/widget/text_app.dart';
import 'package:storeapp/core/extensions/context_extensions.dart';
import 'package:storeapp/core/styles/fonts/font_weight_helper.dart';

class AuthTitleInfo extends StatelessWidget {
  const AuthTitleInfo({super.key, required this.title, required this.descrip});
  final String title;
  final String descrip;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextApp(
          text: title,
          theme: context.textStyle.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeightHelper.bold,
              color: context.color.textColor),
        ),
        const SizedBox(
          height: 10,
        ),
        TextApp(
          text: descrip,
          theme: context.textStyle.copyWith(
            fontSize: 16.sp,
            color: context.color.textColor,
            fontWeight: FontWeightHelper.medium,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
