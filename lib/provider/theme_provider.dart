import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;

  late SharedPreferences sharedPreferences;

  Future<void> changeTheme(ThemeMode themeMode) async {
    mode = themeMode;
    notifyListeners();

    saveTheme(themeMode);
  }

  saveTheme(ThemeMode themeMode) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("themeMode", themeMode.toString());
  }

  loadTheme() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String? saveMode = sharedPreferences.getString("themeMode");

    if (saveMode == ThemeMode.dark.toString()) {
      mode = ThemeMode.dark;
    } else if (saveMode == ThemeMode.light.toString()) {
      mode = ThemeMode.light;
    } else {
      mode = ThemeMode.light;
    }

    notifyListeners();
  }
}
