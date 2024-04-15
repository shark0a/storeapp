class FontHelper {
  FontHelper._();
  static const String cairoArabic = "Cairo";
  static const String poppinsEng = "Poppins";
  static String geLocaLozedFontFamily(){
  //TODO:  sharedPreferance
  final currentLanguage = 'ar';
  if(currentLanguage == 'ar'){
    return cairoArabic;
  }else{
    return poppinsEng;
  }
  }
}
