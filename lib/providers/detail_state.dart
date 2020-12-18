import 'package:flutter/widgets.dart';

class DetailState extends ChangeNotifier {
  int _wishlistCount = 0;
  int get wishlistCount => _wishlistCount;

  void setWistlistCount(int val) {
    _wishlistCount = val;
    notifyListeners();
  }
}
