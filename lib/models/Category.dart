import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/Variable.dart';
import 'package:shop_app/models/TokenData.dart';

Future<bool> getCategoryData(dynamic map) async {
  final response = await http.post(
    'https://easycartapp.com/index.php?route=webservices/api&method=appGetCategoryDetails&version=1.6&api_token=' +
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
