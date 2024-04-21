import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storeapp/core/services/pref_keys.dart';
import 'package:storeapp/core/services/shared_pref.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());
  bool isDark = true;
  String languagecurent = 'en';
  //themMode
  void changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(AppState.themeChangeMode(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref().setBoolean(SharedKeys.themeMode, isDark).then(
        (value) {
          emit(
            AppState.themeChangeMode(isDark: isDark),
          );
        },
      );
    }
  }

  void getSavedLanguage({String? sharedMode}) {
    final result = SharedPref().containPref(SharedKeys.language)
        ? SharedPref().getString(SharedKeys.language)
        : 'en';
    languagecurent = result!;
    emit(AppState.langChangeState(language: languagecurent));
  }

  Future<void> _changelang(String langCode) async {
    await SharedPref().setString(SharedKeys.language, langCode);
    languagecurent = langCode;
    emit(AppState.langChangeState(language: languagecurent));
  }

  void toArabic() => _changelang('ar');
  void toEnglish() => _changelang('en');
}
