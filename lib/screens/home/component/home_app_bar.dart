import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

import 'package:shop_app/models/Variable.dart';
import 'package:shop_app/components/icon_with_counter.dart';

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
        loginState
            ? IconWithCounter(
                text: '',
                iconData: Icons.favorite_outline,
                notificationCount: 11,
                onTap: () {},
              )
            : Container(),
        IconButton(
          icon: Icon(Icons.card_travel),
          onPressed: () {},
        ),
      ],
    );
  }
}
