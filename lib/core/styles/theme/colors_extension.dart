import 'package:flutter/material.dart';
import 'package:storeapp/core/styles/colors/colors_dark.dart';
import 'package:storeapp/core/styles/colors/colors_light.dart';

class MyColors extends ThemeExtension<MyColors> {
  const MyColors({required this.mainColor});
  final Color? mainColor;

  @override
  ThemeExtension<MyColors> copyWith({Color? mainColor}) {
    return MyColors(mainColor: mainColor);
  }

  @override
  ThemeExtension<MyColors> lerp(
    covariant ThemeExtension<ThemeExtension>? other,
    double t,
  ) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      mainColor: mainColor,
    );
  }

  static const MyColors dark = MyColors(mainColor: ColorsDark.mainColor);
  static const MyColors light = MyColors(mainColor: ColorsLight.mainColor);
}
