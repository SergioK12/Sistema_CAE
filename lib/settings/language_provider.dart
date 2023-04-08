import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale langActual;

  LanguageProvider({
    required bool isEnglish,
  }) : langActual = isEnglish ? const Locale('en') : const Locale('es');

  setEnglish() {
    langActual = const Locale('en');
    notifyListeners();
  }

  setSpanish() {
    langActual = const Locale('es');
    notifyListeners();
  }
}