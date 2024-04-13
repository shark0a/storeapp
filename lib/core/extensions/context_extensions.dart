import 'package:flutter/material.dart';
import 'package:storeapp/core/language/app_localization.dart';
import 'package:storeapp/core/styles/theme/colors_extension.dart';

extension ContextExt on BuildContext {
  //Colors themes
  MyColors get color => Theme.of(this).extension<MyColors>()!;
  //Language
  String translate(String langkey) {
    return AppLocalizations.of(this)!.translate(langkey).toString();
  }

  //Navigator
  Future<dynamic> pushName(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> replacement(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushUntil(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
    );
  }

  void pop() => Navigator.pop(this);
}
