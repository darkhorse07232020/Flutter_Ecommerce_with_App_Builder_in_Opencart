import 'package:flutter/foundation.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isLightTheme = true;
  bool get isLightTheme => _isLightTheme;

  void changeTheme() {
    _isLightTheme = !_isLightTheme;
    notifyListeners();
  }
}
