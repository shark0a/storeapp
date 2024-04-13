import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:storeapp/core/language/app_localization_delegate.dart';

class AppLocalizations {
  AppLocalizations(this.locale);
  final Locale locale;
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();
  late Map<String, String> _localizedStrings;
  // Load the language JSON file from the "lang" folder
  Future<bool> load() async {
    final String jsonString =
        await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }

  bool get isEn => locale.languageCode == 'en';
}
