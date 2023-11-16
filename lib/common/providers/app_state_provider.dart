import 'package:flutter/material.dart';
import 'package:pomodoro/common/services/user_preferences.dart';

class AppStateProvider extends ChangeNotifier {

  final UserPreferences prefs;
  AppStateProvider({required this.prefs});

  bool _isDark = true;

  bool get isDark {
    _isDark = prefs.darkMode;
    return _isDark;
  }

  setThemeMode() {
    _isDark = !_isDark;
    prefs.darkMode = _isDark;
    notifyListeners();
  }

  int currentPage = 0;

  jumpToPage(int page) {
    currentPage = page;
    notifyListeners();
  }
}