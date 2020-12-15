import 'package:shared_preferences/shared_preferences.dart';

bool loginState = false;
String idCurrency = '';
String isoCode = '';
int wishlistCount = 0;
String sessionData = '';

void setData(String key, String data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, data);
}
