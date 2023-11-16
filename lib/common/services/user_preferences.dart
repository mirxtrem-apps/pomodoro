import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  SharedPreferences prefs;
  UserPreferences(this.prefs);

  bool get darkMode => prefs.getBool('DARK') ?? true;
  set darkMode(bool value) => prefs.setBool('DARK', value);
}
