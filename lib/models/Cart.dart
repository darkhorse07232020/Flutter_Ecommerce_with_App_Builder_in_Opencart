import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/Variable.dart';
import 'TokenData.dart';

Future<bool> getCartDetails(String email) async {
  var map = new Map<String, dynamic>();
  map['id_currency'] = idCurrency;
  map['iso_code'] = isoCode;
  map['email'] = email;

  final response = await http.post(
    'https://easycartapp.com/index.php?route=webservices/api&method=appGetCartDetails&version=1.6&api_token=' +
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
    cartVariable = CartModel.fromJson(responseJson);
  } else {
    throw Exception('Failed to load LangClass');
  }
  return (response.statusCode == 200);
}

CartModel cartVariable;

class CartModel {
  final dynamic products;
  final dynamic cart;
  final dynamic delayShipping;
  final String cartId;
  final String voucherAllowed;
  final String minimumPurchaseMessage;
  final String voucherHtml;
  final dynamic giftWrapping;
  final String guestCheckoutEnabled;
  final dynamic totals;
  final dynamic vouchers;
  final dynamic checkoutPage;

  CartModel({
    this.products,
    this.cart,
    this.delayShipping,
    this.cartId,
    this.voucherAllowed,
    this.minimumPurchaseMessage,
    this.voucherHtml,
    this.giftWrapping,
    this.guestCheckoutEnabled,
    this.totals,
    this.vouchers,
    this.checkoutPage,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return new CartModel(
      products: json['products'],
      cart: json['cart'],
      delayShipping: json['delay_shipping'],
      cartId: json['cart_id'],
      voucherAllowed: json['voucher_allowed'],
      minimumPurchaseMessage: json['minimum_purchase_message'],
      voucherHtml: json['voucher_html'],
      giftWrapping: json['gift_wrapping'],
      guestCheckoutEnabled: json['guest_checkout_enabled'],
      totals: json['totals'],
      vouchers: json['vouchers'],
      checkoutPage: json['checkout_page'],
    );
  }
}
