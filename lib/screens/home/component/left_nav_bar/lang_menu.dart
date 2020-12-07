import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/screens/home/component/left_nav_bar/drawer_item.dart';
import 'package:shop_app/screens/main/home_screen.dart';

import 'drawer_item_with_check.dart';

class LangMenu extends StatefulWidget {
  final dynamic subMenu;

  const LangMenu({
    Key key,
    this.subMenu,
  }) : super(key: key);

  @override
  _LangMenuState createState() => _LangMenuState();
}

class _LangMenuState extends State<LangMenu> {
  bool expand = false;
  String currentLang;

  void getCurrentState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String isoCode = prefs.getString('ISO_Code') ?? 'en-gb';
    setState(() {
      currentLang = isoCode;
    });
  }

  void setData(String key, String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, data);
  }

  @override
  void initState() {
    setState(() {
      expand = false;
    });
    getCurrentState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              expand = !expand;
            });
          },
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DrawerItem(
                  icon: Icons.language,
                  text: 'Language(s)',
                ),
                Icon(expand
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ),
        expand
            ? ListView.builder(
                padding: EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.subMenu.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return DrawerItemWithLang(
                    item: widget.subMenu[index],
                    horizonPadding: 20,
                    field: 'iso_code',
                    isChecked: currentLang == widget.subMenu[index]['iso_code'],
                    onTap: (String val) {
                      setState(() {
                        currentLang = val;
                        setData('ISO_Code', val);
                      });
                      Navigator.pushNamed(
                        context,
                        HomeScreen.routeName,
                      );
                    },
                  );
                },
              )
            : Container(),
      ],
    );
  }
}
