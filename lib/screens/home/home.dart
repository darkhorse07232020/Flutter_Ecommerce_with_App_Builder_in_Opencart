import 'package:flutter/material.dart';
import 'package:shop_app/models/HomeScreen.dart';
import 'package:shop_app/screens/home/component/banners_horizontal_sliding.dart';

import '../../size_config.dart';
import '../main/components/categories.dart';
import '../main/components/discount_banner.dart';
import '../main/components/home_header.dart';
import '../main/components/popular_product.dart';
import '../main/components/special_offers.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          // HomeHeader(),
          BannersHorizontalSliding(
            title: homeScreenVariable.elements[0]['heading'],
            banner: homeScreenVariable.elements[0]['data'],
          ),
          SizedBox(height: getProportionateScreenWidth(10)),
          DiscountBanner(),
          Categories(),
          SpecialOffers(),
          SizedBox(height: getProportionateScreenWidth(30)),
          PopularProducts(),
          SizedBox(height: getProportionateScreenWidth(30)),
        ],
      ),
    );
  }
}
