import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/TokenData.dart';

Future<bool> getHomeData() async {
  final response = await http.post(
    'https://easycartapp.com/index.php?route=webservices/api&method=appGetHome&version=1.6&api_token=' +
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
    homeScreenVariable = HomeScreenModel.fromJson(responseJson);
    print('hello:  ${homeScreenVariable.titleBarLogoUrl}');
  } else {
    throw Exception('Failed to load LangClass');
  }
  return true;
}

HomeScreenModel homeScreenVariable;

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
  final List<dynamic> elements;
  final List<dynamic> menuCategories;
  final List<dynamic> cmsLinks;
  final Map<String, dynamic> currencies;
  final Map<String, dynamic> languages;
  final List<dynamic> languagesRecord;
  final int isTabBarEnabled;
  final Map<String, dynamic> spinWinResponse;

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
    this.elements,
    this.menuCategories,
    this.cmsLinks,
    this.currencies,
    this.languages,
    this.languagesRecord,
    this.isTabBarEnabled,
    this.spinWinResponse,
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
      elements: json['elements'],
      menuCategories: json['Menu_Categories'],
      cmsLinks: json['cms_links'],
      currencies: json['currencies'],
      languages: json['languages'],
      languagesRecord: json['languages_record'],
      isTabBarEnabled: int.parse(json['is_tab_bar_enabled']),
      spinWinResponse: json['spin_win_response'],
    );
  }
}
