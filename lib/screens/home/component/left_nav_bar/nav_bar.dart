import 'package:flutter/material.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/home/component/left_nav_bar/expand_menu.dart';
import 'package:shop_app/models/HomeScreen.dart';
import 'package:shop_app/screens/home/component/left_nav_bar/drawer_item.dart';
import 'package:shop_app/screens/home/component/left_nav_bar/lang_menu.dart';
import 'package:shop_app/screens/products/product_screen.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 170,
            child: DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
              children: <Widget>[
                DrawerItem(icon: Icons.home, text: 'Home'),
                DrawerItem(icon: Icons.account_circle, text: 'My Account'),
                Divider(),
                ListView.builder(
                  padding: EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: homeScreenVariable.menuCategories.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    dynamic card = homeScreenVariable.menuCategories[index];
                    return card['second_children'].length > 0
                        ? ExpandItem(
                            icon: Icons.stars,
                            title: card['name'],
                            subMenu: card['second_children'],
                          )
                        : DrawerItem(
                            icon: Icons.stars,
                            text: card['name'],
                            onTap: () => Navigator.pushNamed(
                              context,
                              ProductScreen.routeName,
                              arguments: ProductsArguments(
                                id: card['id'].toString(),
                                // title: card['title'],
                              ),
                            ),
                          );
                  },
                ),
                Divider(),
                DrawerItem(icon: Icons.contacts, text: 'Contact Us'),
                LangMenu(subMenu: homeScreenVariable.languages['lang_list']),
                ExpandItem(
                  icon: Icons.monetization_on,
                  title: 'Currency(s)',
                  subMenu: homeScreenVariable.currencies['currency_list'],
                ),
                DrawerItem(
                  icon: Icons.logout,
                  text: 'Logout',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
