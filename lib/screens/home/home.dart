import 'package:flutter/material.dart';
import 'package:shop_app/models/HomeScreen.dart';
import 'package:shop_app/screens/home/component/banners_grid.dart';
import 'package:shop_app/screens/home/component/banners_horizontal_sliding.dart';
import 'package:shop_app/screens/home/component/banners_square.dart';
import 'package:shop_app/screens/home/component/categories_top.dart';
import 'package:shop_app/screens/home/component/products_recent.dart';

import 'component/banners_countdown.dart';
import 'component/products_square.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: homeScreenVariable.elements.length,
        itemBuilder: (context, index) {
          Widget child;
          switch (homeScreenVariable.elements[index]['element_type']) {
            case 'banners_horizontal_sliding':
              child = BannersHorizontalSliding(
                  title: homeScreenVariable.elements[index]['heading'],
                  banner: homeScreenVariable.elements[index]['data']);
              break;
            case 'categories_top':
              child = CategoriesTop(
                categories: homeScreenVariable.elements[index]['data'],
              );
              break;
            case 'banners_square':
              child = BannerSquare(
                title: homeScreenVariable.elements[index]['heading'],
                banner: homeScreenVariable.elements[index]['data'],
              );
              break;
            case 'banners_grid':
              child = BannerGrid(
                title: homeScreenVariable.elements[index]['heading'],
                banner: homeScreenVariable.elements[index]['data'],
              );
              break;
            case 'banners_countdown':
              child = BannerCountdown(
                title: homeScreenVariable.elements[index]['heading'],
                banner: homeScreenVariable.elements[index]['data'],
              );
              break;
            case 'products_square':
              child = ProductSquare(
                title: homeScreenVariable.elements[index]['heading'],
                products: homeScreenVariable.elements[index]['data'],
              );
              break;
            case 'products_horizontal':
              child = ProductHorizontal(
                title: homeScreenVariable.elements[index]['heading'],
                products: homeScreenVariable.elements[index]['data'],
              );
              break;
            default:
              child = Container();
              break;
          }
          return Container(
            padding: EdgeInsets.only(top: 10),
            child: child,
            //
            // SizedBox(height: 10),
            // // ProductRecent(
            // //   product: homeScreenVariable.elements[5]['data'],
            // // ),
          );
        },
      ),
    );
  }
}
