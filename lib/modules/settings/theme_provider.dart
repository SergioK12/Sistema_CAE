  import 'package:flutter/material.dart';

import '../../ui/styles/themes.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData temaactual;

  ThemeProvider({
    required bool isDarkMode,
  }) : temaactual = isDarkMode ? themedatadark : themedatalight;

  setlightMode() {
    temaactual = themedatalight;
    notifyListeners();
  }

  setDarkMode() {
    temaactual = themedatadark;
    notifyListeners();
  }
}