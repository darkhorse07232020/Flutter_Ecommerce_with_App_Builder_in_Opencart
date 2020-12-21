import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Login.dart';
import 'package:shop_app/models/TokenData.dart';
import 'package:shop_app/models/Variable.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/providers/detail_state.dart';
import 'package:shop_app/screens/main/home_screen.dart';
import 'package:toast/toast.dart';

Future<bool> addToCart(context, productId, quantity) async {
  if (loginState == true) {
    var map = new Map<String, dynamic>();
    map['id_currency'] = idCurrency;
    map['iso_code'] = isoCode;
    map['cart_products'] = '{"cart_products": [{"product_id": ' +
        productId +
        ', "quantity": ' +
        quantity +
        ', "option": []' +
        '}], "email" : "' +
        loginVariable.email +
        '"}';
    final response = await http.post(
      'https://easycartapp.com/index.php?route=webservices/api&method=appAddToCart&version=1.6&api_token=' +
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
      if (responseJson['status'] == 'success') {
        Toast.show(responseJson['message'], context);
        // cartCount = int.parse(responseJson['total_cart_items'].toString());
        Provider.of<DetailState>(context, listen: false).setCartCount(
            int.parse(responseJson['total_cart_items'].toString()));
        return true;
      }
    } else {
      throw Exception('Failed to load LangClass');
    }
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(initTab: 3),
      ),
    );
  }
  return false;
}

Future<bool> removeToCart(context, productId, quantity) async {
  if (loginState == true) {
    var map = new Map<String, dynamic>();
    map['id_currency'] = idCurrency;
    map['iso_code'] = isoCode;
    map['email'] = loginVariable.email;
    map['session_data'] = sessionData;
    map['cart_products'] = '{"cart_products": [{"product_id": ' +
        productId +
        ', "quantity": ' +
        quantity +
        '}]}';
    final response = await http.post(
      'https://easycartapp.com/index.php?route=webservices/api&method=appRemoveProduct&version=1.6&api_token=' +
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
      if (responseJson['status'] == 'success') {
        Toast.show(responseJson['message'], context);
        // cartCount = int.parse(responseJson['total_cart_items'].toString());
        Provider.of<DetailState>(context, listen: false).setCartCount(
            int.parse(responseJson['cart']['total_cart_items'].toString()));
        return true;
      }
    } else {
      throw Exception('Failed to load LangClass');
    }
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(initTab: 3),
      ),
    );
  }
  return false;
}

Future<bool> updateQuantity(context, productId, quantity) async {
  if (loginState == true) {
    var map = new Map<String, dynamic>();
    map['id_currency'] = idCurrency;
    map['iso_code'] = isoCode;
    map['email'] = loginVariable.email;
    map['session_data'] = sessionData;
    map['cart_products'] = '{"cart_products": [{"product_id": ' +
        productId +
        ', "quantity": ' +
        quantity +
        '}]}';
    final response = await http.post(
      'https://easycartapp.com/index.php?route=webservices/api&method=appUpdateCartQuantity&version=1.6&api_token=' +
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
      if (responseJson['status'] == 'success') {
        Toast.show(responseJson['message'], context);
        // cartCount = int.parse(responseJson['total_cart_items'].toString());
        Provider.of<DetailState>(context, listen: false).setCartCount(
            int.parse(responseJson['cart']['total_cart_items'].toString()));
        return true;
      }
    } else {
      throw Exception('Failed to load LangClass');
    }
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(initTab: 3),
      ),
    );
  }
  return false;
}
