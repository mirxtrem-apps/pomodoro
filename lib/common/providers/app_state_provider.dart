import 'package:flutter/material.dart';

class AppStateProvider extends ChangeNotifier {
  bool isDark = true;

  setThemeMode() {
    isDark = !isDark;
    notifyListeners();
  }
}