import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:shop_app/components/icon_with_counter.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Login.dart';
import 'package:shop_app/models/Variable.dart';
import 'package:shop_app/screens/products/product_screen.dart';
import 'package:toast/toast.dart';

class HomeAppBar extends StatefulWidget {
  final Widget title;

  HomeAppBar({this.title});

  @override
  _HomeAppBarState createState() => new _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  SearchBar searchBar;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: kBtnTxtColor,
      ),
      backgroundColor: kPrimaryColor,
      title: widget.title,
      actions: [
        searchBar.getSearchAction(context),
        loginState
            ? IconWithCounter(
                text: '',
                iconData: Icons.favorite_outline,
                notificationCount: wishlistCount,
                onTap: () {},
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

  void onSubmitted(String value) {
    // setState(() => _scaffoldKey.currentState
    //     .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));
    // Toast.show(value, context);
    Navigator.pushNamed(context, ProductScreen.routeName,
        arguments: ProductsArguments(
          val: value,
          key: 'search_term',
        ));
  }

  _HomeAppBarState() {
    searchBar = new SearchBar(
      inBar: true,
      buildDefaultAppBar: buildAppBar,
      setState: setState,
      onSubmitted: onSubmitted,
      onCleared: () {
        Navigator.maybePop(context);
      },
      onClosed: () {
        print("closed");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return searchBar.build(context);
  }
}
