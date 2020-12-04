import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/TokenData.dart';

// Future<bool> getCategoryData(String id) async {
//   var map = new Map<String, dynamic>();
//   map['id_currency'] = 'USD';
//   map['iso_code'] = 'en';
//   map['product_id'] = id;
//   final response = await http.post(
//     'https://easycartapp.com/index.php?route=webservices/api&method=appGetProductDetails&version=1.6&api_token=' +
//         apiTokenKey,
//     body: map,
//   );
//   Map<String, dynamic> responseJson = json.decode(response.body);
//   if (response.statusCode == 200) {
//     categoryVariable = Product.fromJson(responseJson['fproducts']);
//   } else {
//     throw Exception('Failed to load Response');
//   }
//   return true;
// }

class Product {
  //   final int id;
  // final int quantity;
  // final int allowOutOfStock;
  // final String name;
  // final String price;
  // final String discountPrice;
  // final String discountPercentage;
  // final int cartQuantity;
  // final String hasAttributes;
  // final String displayWriteReviews;
  // final String displayReadReviews;
  // final int numberOfReviews;
  // final int averagecomments;
  // final int minimalQuantity;
  // final List<dynamic> images;
  // final List<dynamic> options;
  // final bool isInWishlist;

  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    @required this.id,
    @required this.images,
    @required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    @required this.title,
    @required this.price,
    @required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
