import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'TokenData.dart';

Future<bool> getLogIn(String email, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String idCurrency = prefs.getString('Currency') ?? 'USD';
  String isoCode = prefs.getString('ISO_Code') ?? 'zh-hk';
  var map = new Map<String, dynamic>();
  map['id_currency'] = idCurrency;
  map['iso_code'] = isoCode;
  map['email'] = email;
  map['password'] = password;

  final response = await http.post(
    'https://easycartapp.com/index.php?route=webservices/api&method=appGetCategoryDetails&version=1.6&api_token=' +
        apiTokenKey,
    headers: {'Cookie': 'language=' + isoCode + '; currency=' + idCurrency},
    body: map,
  );
  Map<String, dynamic> responseJson = json.decode(response.body);

  if (response.statusCode == 200) {
    loginVariable = LoginModel.fromJson(responseJson);
  } else {
    throw Exception('Failed to load LangClass');
  }
  return true;
}

LoginModel loginVariable;
bool loginState = false;

class LoginModel {
  final dynamic loginUser;
  final dynamic installModule;

  LoginModel({
    this.loginUser,
    this.installModule,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return new LoginModel(
      loginUser: json['login_user'],
      installModule: json['install_module'],
    );
  }
}
