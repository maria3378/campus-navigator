import 'package:flutter/foundation.dart';

class AppSettings extends ChangeNotifier {
  bool _darkMode = false;
  bool _notificationsEnabled = true;

  bool get darkMode => _darkMode;
  bool get notificationsEnabled => _notificationsEnabled;

  void setDarkMode(bool value) {
    if (_darkMode == value) return;
    _darkMode = value;
    notifyListeners();
  }

  void setNotificationsEnabled(bool value) {
    if (_notificationsEnabled == value) return;
    _notificationsEnabled = value;
    notifyListeners();
  }
}
