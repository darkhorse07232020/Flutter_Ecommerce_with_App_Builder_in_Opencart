import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/TokenData.dart';

import '../models/Variable.dart';

Future<bool> getProductData(String id) async {
  var map = new Map<String, dynamic>();
  map['id_currency'] = idCurrency;
  map['iso_code'] = isoCode;
  map['product_id'] = id;
  print('$id   $sessionData');
  final response = await http.post(
    'https://easycartapp.com/index.php?route=webservices/api&method=appGetProductDetails&version=1.6&api_token=' +
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
    productVariable = ProductModel.fromJson(responseJson);
  } else {
    throw Exception('Failed to load Response');
  }
  return true;
}

ProductModel productVariable;

class ProductModel {
  final dynamic product;
  final dynamic fproducts;
  final dynamic installModule;

  ProductModel({
    this.product,
    this.fproducts,
    this.installModule,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return new ProductModel(
      product: json['product'],
      fproducts: json['fproducts'],
      installModule: json['install_module'],
    );
  }
}
