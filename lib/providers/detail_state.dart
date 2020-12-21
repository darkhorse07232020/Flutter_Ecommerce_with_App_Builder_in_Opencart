import 'package:flutter/widgets.dart';

class DetailState extends ChangeNotifier {
  int _wishlistCount = 0;
  int _cartCount = 0;
  int get wishlistCount => _wishlistCount;
  int get cartCount => _cartCount;

  void setWishlistCount(int val) {
    _wishlistCount = val;
    notifyListeners();
  }

  void setCartCount(int val) {
    _cartCount = val;
    notifyListeners();
  }
}
