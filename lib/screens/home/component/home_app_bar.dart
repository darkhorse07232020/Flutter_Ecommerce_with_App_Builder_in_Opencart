import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/HomeScreen.dart';

class HomeAppBar extends PreferredSize {
  final Widget title;

  HomeAppBar({this.title});

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: kBtnTxtColor,
      ),
      backgroundColor: kPrimaryColor,
      title: title,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.favorite_outline),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.card_travel),
          onPressed: () {},
        ),
      ],
    );
  }
}
