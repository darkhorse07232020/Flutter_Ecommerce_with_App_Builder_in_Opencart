import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/icon_with_counter.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Languages.dart';
import 'package:shop_app/models/Variable.dart';
import 'package:shop_app/providers/detail_state.dart';
import 'package:shop_app/screens/main/home_screen.dart';
import 'package:shop_app/screens/wishlist/wishlist_screen.dart';

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
      centerTitle: true,
      backgroundColor: kPrimaryColor,
      title: Text(
        getWord(isoCode, 'product'),
        style: TextStyle(color: kBtnTxtColor),
      ),
      actions: [
        loginState
            ? Consumer<DetailState>(
                builder: (context, details, child) {
                  return IconWithCounter(
                    text: '',
                    iconData: Icons.favorite_outline,
                    notificationCount: details.wishlistCount,
                    onTap: () {
                      Navigator.pushNamed(context, WishlistScreen.routeName);
                    },
                  );
                },
              )
            : Container(),
        loginState
            ? Consumer<DetailState>(
                builder: (context, details, child) {
                  return IconWithCounter(
                    text: '',
                    iconData: Icons.card_travel,
                    notificationCount: details.cartCount,
                    onTap: () {},
                  );
                },
              )
            : IconButton(
                icon: Icon(Icons.card_travel),
                onPressed: () {},
              ),
      ],
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(initTab: 0),
              ),
            );
          }),
    );
  }
}
