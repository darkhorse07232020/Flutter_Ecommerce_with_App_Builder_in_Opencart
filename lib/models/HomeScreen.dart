import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<bool> getHomeData() async {
  final response = await http.post(
    'https://easycartapp.com/index.php?route=webservices/api&method=appGetHome&version=1.6&api_token=2e03ec554e84d45353be41509e',
    body: jsonEncode(
      <String, String>{
        'id_currency': 'USD',
        'iso_code': 'en',
      },
    ),
  );
  Map<String, dynamic> responseJson = json.decode(response.body);
  if (response.statusCode == 200) {
    homeScreenVariable = HomeScreenModel.fromJson(responseJson);
    print('hello:  ${homeScreenVariable.titleBarLogoUrl}');
  } else {
    throw Exception('Failed to load LangClass');
  }
  return true;
}

class HomeScreenModel {
  final int isMarketplace;
  final int wishlistActive;
  final int cartButtonStatus;
  final String appThemeColor;
  final String appButtonColor;
  final String appButtonTextColor;
  final String appBackgroundColor;
  final int addToCartRedirectEnabled;
  final int displayLogoOnTitleBar;
  final String titleBarLogoUrl;
  final int contactUsAvailable;
  final String contactUsLink;
  final String message;

  HomeScreenModel({
    this.isMarketplace,
    this.wishlistActive,
    this.cartButtonStatus,
    this.appThemeColor,
    this.appButtonColor,
    this.appButtonTextColor,
    this.appBackgroundColor,
    this.addToCartRedirectEnabled,
    this.displayLogoOnTitleBar,
    this.titleBarLogoUrl,
    this.contactUsAvailable,
    this.contactUsLink,
    this.message,
  });

  factory HomeScreenModel.fromJson(Map<String, dynamic> json) {
    // print(json["languages"]);
    return new HomeScreenModel(
      isMarketplace: int.parse(json['is_marketplace']),
      wishlistActive: json['wishlist_active'],
      cartButtonStatus: json['cart_button_status'],
      appThemeColor: json['app_theme_color'],
      appButtonColor: json['app_button_color'],
      appButtonTextColor: json['app_button_text_color'],
      appBackgroundColor: json['app_background_color'],
      addToCartRedirectEnabled: int.parse(json['add_to_cart_redirect_enabled']),
      displayLogoOnTitleBar: int.parse(json['display_logo_on_title_bar']),
      titleBarLogoUrl: json['title_bar_logo_url'],
      contactUsAvailable: json['contact_us_available'],
      contactUsLink: json['contact_us_link'],
      message: json['message'],
    );
  }
}

HomeScreenModel homeScreenVariable;
