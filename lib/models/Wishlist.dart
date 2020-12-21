import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/Variable.dart';
import 'TokenData.dart';

Future<bool> getWishlist(String email) async {
  var map = new Map<String, dynamic>();
  map['id_currency'] = idCurrency;
  map['iso_code'] = isoCode;
  map['email'] = email;
  print(sessionData);
  final response = await http.post(
    'https://easycartapp.com/index.php?route=webservices/api&method=appGetWishlist&version=1.6&api_token=' +
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
    wishlistVariable = WishlistModel.fromJson(responseJson);
  } else {
    throw Exception('Failed to load LangClass');
  }
  return (response.statusCode == 200);
}

WishlistModel wishlistVariable;

class WishlistModel {
  final dynamic wishlistProduct;
  final dynamic installModule;
  final dynamic status;

  WishlistModel({
    this.wishlistProduct,
    this.installModule,
    this.status,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> json) {
    return new WishlistModel(
      wishlistProduct: json['wishlist_products'],
      installModule: json['install_module'],
      status: json['status'],
    );
  }
}
