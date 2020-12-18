import 'package:shared_preferences/shared_preferences.dart';

bool loginState = false;
String idCurrency = '';
String isoCode = '';
String sessionData = '';
int wishlistCount = 0;
int cartCount = 0;

void setData(String key, String data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, data);
}
