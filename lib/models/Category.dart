import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/TokenData.dart';

Future<bool> getCategoryData() async {
  final response = await http.post(
    'https://easycartapp.com/index.php?route=webservices/api&method=appGetCategoryDetails&version=1.6&api_token=' +
        apiTokenKey,
    body: jsonEncode(
      <String, String>{
        'id_currency': 'USD',
        'iso_code': 'en',
      },
    ),
  );
  Map<String, dynamic> responseJson = json.decode(response.body);
  if (response.statusCode == 200) {
    categoryVariable = CategoryModel.fromJson(responseJson);
  } else {
    throw Exception('Failed to load Response');
  }
  return true;
}

CategoryModel categoryVariable;

class CategoryModel {
  final int id;
  final String name;
  final int availableForOrder;
  final int newProducts;
  final int onSaleProducts;
  final String categoryName;
  final String clickActivityName;
  final int categoryId;
  final String price;
  final String src;
  final int hasAttributes;
  final int cartQuantity;
  final int numberOfReviews;
  final int averageComments;
  final String discountPrice;
  final double discountPercentage;
  final bool isInWishList;

  CategoryModel({
    this.id,
    this.name,
    this.availableForOrder,
    this.newProducts,
    this.onSaleProducts,
    this.categoryName,
    this.clickActivityName,
    this.categoryId,
    this.price,
    this.src,
    this.hasAttributes,
    this.cartQuantity,
    this.numberOfReviews,
    this.averageComments,
    this.discountPrice,
    this.discountPercentage,
    this.isInWishList,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return new CategoryModel(
      id: int.parse(json['id']),
      name: json['name'],
      availableForOrder: json['available_for_order'],
      newProducts: json['new_products'],
      onSaleProducts: json['on_sale_products'],
      categoryName: json['category_name'],
      clickActivityName: json['ClickActivityName'],
      categoryId: int.parse(json['category_id']),
      price: json['price'],
      src: json['src'],
      hasAttributes: int.parse(json['has_attributes']),
      cartQuantity: json['cart_quantity'],
      numberOfReviews: int.parse(json['number_of_reviews']),
      averageComments: int.parse(json['averagecomments']),
      discountPrice: json['discount_price'],
      discountPercentage: json['discount_percentage'],
      isInWishList: json['is_in_wishlist'],
    );
  }
}
