import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  // Default to light theme
  bool _isDark = false;

  bool get isDark => _isDark;

  // Toggle between light and dark theme
  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  // Optionally, you can provide ThemeData for light and dark themes here:
  ThemeData get themeData {
    return _isDark ? ThemeData.dark() : ThemeData.light();
  }
}
