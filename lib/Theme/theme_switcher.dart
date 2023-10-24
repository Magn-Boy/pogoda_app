import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = ThemeData.light();
  bool _isDarkMode = false; // Добавьте это свойство

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _isDarkMode; // Геттер для состояния темы

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _themeData = _isDarkMode ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }
}