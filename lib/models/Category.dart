import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/TokenData.dart';

Future<bool> getCategoryData(String id) async {
  // Read sharedpreference data
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String idCurrency = prefs.getString('Currency') ?? 'USD';
  String isoCode = prefs.getString('ISO_Code') ?? 'zh-hk';
  var map = new Map<String, dynamic>();
  map['id_currency'] = idCurrency;
  map['iso_code'] = isoCode;
  map['category_id'] = id;
  final response = await http.post(
    'https://easycartapp.com/index.php?route=webservices/api&method=appGetCategoryDetails&version=1.6&api_token=' +
        apiTokenKey,
    headers: {'Cookie': 'language=' + isoCode + '; currency=' + idCurrency},
    body: map,
  );
  Map<String, dynamic> responseJson = json.decode(response.body);
  if (response.statusCode == 200) {
    categoryVariable = CategoryModel.fromJson(responseJson['fproducts']);
  } else {
    throw Exception('Failed to load Response');
  }
  return true;
}

CategoryModel categoryVariable;

class CategoryModel {
  final String title;
  final dynamic products;

  CategoryModel({
    this.title,
    this.products,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return new CategoryModel(
      title: json['title'],
      products: json['products'],
    );
  }
}
