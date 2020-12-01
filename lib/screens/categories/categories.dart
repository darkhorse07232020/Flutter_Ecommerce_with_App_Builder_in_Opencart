import 'package:flutter/material.dart';
import 'package:shop_app/components/expand_menu.dart';
import 'package:shop_app/models/HomeScreen.dart';
import 'package:shop_app/components/drawer_item.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: homeScreenVariable.menuCategories.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          dynamic card = homeScreenVariable.menuCategories[index];
          return card['second_children'].length > 0
              ? ExpandItem(
                  title: card['name'],
                  subMenu: card['second_children'],
                )
              : DrawerItem(text: card['name']);
        },
      ),
    );
  }
}
