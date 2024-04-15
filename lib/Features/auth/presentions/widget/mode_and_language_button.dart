import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storeapp/common/animations/animate_do.dart';
import 'package:storeapp/common/widget/custom_linear_button.dart';
import 'package:storeapp/common/widget/text_app.dart';
import 'package:storeapp/core/extensions/context_extensions.dart';
import 'package:storeapp/core/language/lang_keys.dart';

class ModeAndLanguageButton extends StatelessWidget {
  const ModeAndLanguageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomFadeInLeft(
          duration: 400,
          child: CustomLinearButton(
            onPressed: () {},
            child: const Icon(
              Icons.light_mode_rounded,
              color: Colors.white,
            ),
          ),
        ),
        CustomFadeInRight(
          duration: 400,
          child: CustomLinearButton(
            width: 110,
            onPressed: () {},
            child: TextApp(
                text: context.translate(LangKeys.language),
                theme: context.textStyle
                    .copyWith(fontSize: 16.sp, color: context.color.textColor)),
          ),
        ),
      ],
    );
  }
}
