import 'package:flutter/material.dart';
import 'package:shop_app/models/Languages.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/home/component/left_nav_bar/expand_menu.dart';
import 'package:shop_app/models/HomeScreen.dart';
import 'package:shop_app/screens/home/component/left_nav_bar/drawer_item.dart';
import 'package:shop_app/screens/home/component/left_nav_bar/lang_menu.dart';
import 'package:shop_app/screens/main/home_screen.dart';
import 'package:shop_app/screens/products/product_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';

import 'currency_menu.dart';
import '../../../../models/Variable.dart';

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
                DrawerItem(
                  icon: Icons.home,
                  // text: getWord(isoCode, 'home'),
                  text: getWord(isoCode, 'home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                loginState
                    ? DrawerItem(
                        icon: Icons.account_circle,
                        text: getWord(isoCode, 'my_account'),
                      )
                    : Container(),
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
                                val: card['id'].toString(),
                                key: 'category_id',
                              ),
                            ),
                          );
                  },
                ),
                Divider(),
                DrawerItem(
                    icon: Icons.contacts, text: getWord(isoCode, 'contact_us')),
                LangMenu(subMenu: homeScreenVariable.languages['lang_list']),
                CurrencyMenu(
                  subMenu: homeScreenVariable.currencies['currency_list'],
                ),
                loginState
                    ? DrawerItem(
                        icon: Icons.logout,
                        text: 'Log out',
                        onTap: () {
                          loginState = false;
                          Navigator.popAndPushNamed(
                              context, HomeScreen.routeName);
                        },
                      )
                    : DrawerItem(
                        icon: Icons.login,
                        text: getWord(isoCode, 'log_in'),
                        onTap: () {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
