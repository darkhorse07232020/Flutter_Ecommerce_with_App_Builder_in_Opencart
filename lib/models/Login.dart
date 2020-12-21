import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/Variable.dart';
import 'TokenData.dart';

Future<bool> getLogIn(String email, String password) async {
  var map = new Map<String, dynamic>();
  map['id_currency'] = idCurrency;
  map['iso_code'] = isoCode;
  map['email'] = email;
  map['password'] = password;

  final response = await http.post(
    'https://easycartapp.com/index.php?route=webservices/api&method=appLogin&version=1.6&api_token=' +
        apiTokenKey,
    headers: {'Cookie': 'language=' + isoCode + '; currency=' + idCurrency},
    body: map,
  );
  Map<String, dynamic> responseJson = json.decode(response.body);

  if (response.statusCode == 200) {
    loginVariable = LoginModel.fromJson(responseJson, email);
    sessionData = responseJson['login_user']['session_data'];
  } else {
    throw Exception('Failed to load LangClass');
  }
  return (response.statusCode == 200);
}

LoginModel loginVariable;

class LoginModel {
  final dynamic loginUser;
  final dynamic installModule;
  final dynamic email;

  LoginModel({
    this.loginUser,
    this.installModule,
    this.email,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json, String email) {
    return new LoginModel(
      loginUser: json['login_user'] ?? json['signup_user'],
      installModule: json['install_module'],
      email: email,
    );
  }
}

Future<bool> getSignUp(dynamic map, String email) async {
  final response = await http.post(
    'https://easycartapp.com/index.php?route=webservices/api&method=appRegisterUser&version=1.6&api_token=' +
        apiTokenKey,
    headers: {
      'Cookie': 'language=' +
          isoCode +
          '; OCSESSID=' +
          sessionData +
          '; currency=' +
          idCurrency
    },
    body: map,
  );
  Map<String, dynamic> responseJson = json.decode(response.body);

  if (response.statusCode == 200) {
    loginVariable = LoginModel.fromJson(responseJson, email);
    sessionData = responseJson['signup_user']['session_data'];
  } else {
    throw Exception('Failed to load LangClass');
  }
  return (response.statusCode == 200);
}
