import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/helpers/colors.dart';
import 'package:shop_app/models/HomeScreen.dart';

import '../../../size_config.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: kBackgroundDarkColor,
            ),
          ),
          _createDrawerItem(icon: Icons.home, text: 'Home'),
          _createDrawerItem(icon: Icons.account_circle, text: 'My Account'),
          Divider(),
          ListView.builder(
            padding: EdgeInsets.all(0),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: homeScreenVariable.menuCategories.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              dynamic card = homeScreenVariable.menuCategories[index];
              print(card);
              return _createDrawerItem(icon: Icons.stars, text: 'card[]');
            },
          ),
          Divider(),
          _createDrawerItem(icon: Icons.home, text: 'Home'),
          _createDrawerItem(icon: Icons.account_circle, text: 'My Account'),
        ],
      ),
    );
  }

  Widget _createDrawerItem({
    IconData icon,
    String text,
    double horizonPadding,
    GestureTapCallback onTap,
  }) {
    return InkWell(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizonPadding = 10, vertical: 5),
        child: Row(
          children: <Widget>[
            Icon(icon),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 14),
              ),
            )
          ],
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _createExpandItem() {}
}
