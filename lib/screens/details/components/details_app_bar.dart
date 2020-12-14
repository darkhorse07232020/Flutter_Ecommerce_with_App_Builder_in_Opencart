import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Languages.dart';
import 'package:shop_app/models/Variable.dart';

class DetailsAppBar extends PreferredSize {
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
      title: Text(
        getWord(isoCode, 'product'),
        style: TextStyle(color: kBtnTxtColor),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.card_travel),
          onPressed: () {},
        ),
      ],
    );
  }
}
