import 'package:flutter/material.dart' show Locale ,LocalizationsDelegate;
import 'package:storeapp/core/language/app_localization.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
 const AppLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
   return ['en', 'ar'].contains(locale.languageCode);

  }

  @override
  Future<AppLocalizations> load(Locale locale) async{
    final appLocalizations= AppLocalizations(locale);
    await appLocalizations.load();
    return appLocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}