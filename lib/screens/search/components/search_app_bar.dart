import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class SearchAppBar extends PreferredSize {
  final Widget leading;

  SearchAppBar({this.leading});

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      iconTheme: IconThemeData(
        color: kBtnTxtColor,
      ),
      backgroundColor: kPrimaryColor,
      title: TextFormField(),
      actions: [
        IconButton(
          icon: Icon(Icons.mic),
          onPressed: () {},
        ),
      ],
    );
  }
}
