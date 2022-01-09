import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:retrace/const/constant.dart';

// ignore_for_file: implementation_imports
class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  bool _isDark = true;

  get thememode => _themeMode;
  get isDark => _isDark;

  toggleTheme(isDark) {
    _isDark = isDark;
    isDark = _themeMode = isDark && _isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  static ThemeData light = ThemeData(
      colorScheme: const ColorScheme.light(
          brightness: Brightness.light, background: Colors.white));
  static ThemeData dark = ThemeData(
      colorScheme:
          ColorScheme.light(brightness: Brightness.dark, background: bg));
}

Color themeManger(
    {required BuildContext c, required Color l, required Color d}) {
  bool theme = c.watch<ThemeProvider>().isDark;
  return theme ? d : l;
}
