import 'package:flutter/material.dart';
import 'package:storeapp/core/styles/colors/colors_dark.dart';
import 'package:storeapp/core/styles/colors/colors_light.dart';
import 'package:storeapp/core/styles/fonts/font_helper.dart';
import 'package:storeapp/core/styles/theme/colors_extension.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColors.dark],
    useMaterial3: true,
    textTheme: TextTheme(
        displaySmall: TextStyle(
            fontSize: 14,
            fontFamily: FontHelper.geLocaLozedFontFamily(),
            color: ColorsDark.white)),
  );
}

ThemeData themeLight() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsLight.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColors.light],
    useMaterial3: true,
    textTheme: TextTheme(
        displaySmall: TextStyle(
            fontSize: 14,
            fontFamily: FontHelper.geLocaLozedFontFamily(),
            color: ColorsDark.black)),
  );
}
