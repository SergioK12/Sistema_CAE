import 'package:shared_preferences/shared_preferences.dart';

class Preferencias {
  static late SharedPreferences _prefs;
  static bool _isDarkMode = false;
  static bool _isEnglish = false;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //MODO OSCURO
  static bool get getIsDarkMode {
    return _prefs.getBool('isdarkmode') ?? _isDarkMode;
  }

  static set setIsdarkmode(bool isdakrmode) {
    _isDarkMode = isdakrmode;
    _prefs.setBool('isdarkmode', isdakrmode);
  }

  //LENGUAJE
  static bool get getIsEnglish {
    return _prefs.getBool('isEnglish') ?? _isEnglish;
  }

  static set setIsEnglish(bool isEnglish) {
    _isEnglish = isEnglish;
    _prefs.setBool('isEnglish', isEnglish);
  }
}
