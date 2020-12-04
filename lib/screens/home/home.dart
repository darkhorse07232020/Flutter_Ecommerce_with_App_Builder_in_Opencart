import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/HomeScreen.dart';
import 'package:shop_app/screens/components/banners_grid.dart';
import 'package:shop_app/screens/components/banners_horizontal_sliding.dart';
import 'package:shop_app/screens/components/banners_square.dart';
import 'package:shop_app/screens/components/categories_top.dart';
import 'package:shop_app/screens/components/products_recent.dart';
import 'package:shop_app/screens/home/component/home_app_bar.dart';
import 'package:shop_app/screens/home/component/left_nav_bar/nav_bar.dart';

import '../components/banners_countdown.dart';
import '../components/products_grid.dart';
import '../components/products_horizontal.dart';
import '../components/products_square.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  Future<void> initialize() async {
    await getHomeData();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: HomeAppBar(
              title: homeScreenVariable.displayLogoOnTitleBar == 1
                  ? Image.network(homeScreenVariable.titleBarLogoUrl)
                  : Container(),
            ),
            drawer: NavBar(),
            body: ListView.builder(
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
                    child = ProductsHorizontal(
                      title: homeScreenVariable.elements[index]['heading'],
                      products: homeScreenVariable.elements[index]['data'],
                    );
                    break;
                  case 'products_grid':
                    child = ProductsGrid(
                      title: homeScreenVariable.elements[index]['heading'],
                      products: homeScreenVariable.elements[index]['data'],
                    );
                    break;
                  default:
                    child = Container();
                    break;
                }
                return Container(
                  color: kBGColor,
                  padding: EdgeInsets.only(top: 10),
                  child: child,
                );
              },
            ),
          );
        } else {
          return Scaffold(
            appBar: HomeAppBar(title: Container()),
            drawer: NavBar(),
            body: Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}
