import 'package:storeapp/core/services/pref_keys.dart';
import 'package:storeapp/core/services/shared_pref.dart';

class FontHelper {
  FontHelper._();
  static const String cairoArabic = "Cairo";
  static const String poppinsEng = "Poppins";
  static String geLocaLozedFontFamily() {
    final currentLanguage = SharedPref().getString(SharedKeys.language);
    if (currentLanguage == 'ar') {
      return cairoArabic;
    } else {
      return poppinsEng;
    }
  }
}
