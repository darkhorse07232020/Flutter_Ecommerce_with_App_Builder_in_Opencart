import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Languages.dart';
import 'package:shop_app/models/Variable.dart';
import 'package:shop_app/screens/home/component/left_nav_bar/expand_menu.dart';
import 'package:shop_app/models/HomeScreen.dart';
import 'package:shop_app/screens/home/component/left_nav_bar/drawer_item.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: Container(),
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.all(0),
          child: Text(
            getWord(isoCode, 'categories'),
            style: TextStyle(color: kBtnTxtColor),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
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
      ),
    );
  }
}
