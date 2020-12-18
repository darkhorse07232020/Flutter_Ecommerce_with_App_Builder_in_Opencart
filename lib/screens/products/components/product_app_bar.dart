import 'package:flutter/material.dart';
import 'package:shop_app/components/icon_with_counter.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Login.dart';
import 'package:shop_app/models/Variable.dart';
import 'package:shop_app/screens/wishlist/wishlist_screen.dart';

class ProductAppBar extends PreferredSize {
  final String title;

  ProductAppBar({this.title = ''});

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
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: kBtnTxtColor),
      ),
      actions: [
        loginState
            ? IconWithCounter(
                text: '',
                iconData: Icons.favorite_outline,
                notificationCount: wishlistCount,
                onTap: () {
                  Navigator.pushNamed(context, WishlistScreen.routeName);
                },
              )
            : Container(),
        loginState
            ? IconWithCounter(
                text: '',
                iconData: Icons.card_travel,
                notificationCount: loginVariable.loginUser["cart_count"],
                onTap: () {},
              )
            : IconButton(
                icon: Icon(Icons.card_travel),
                onPressed: () {},
              ),
      ],
    );
  }
}
