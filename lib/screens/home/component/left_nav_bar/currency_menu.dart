import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/component/left_nav_bar/drawer_item.dart';
import 'package:shop_app/screens/main/home_screen.dart';

import '../../../../models/Variable.dart';
import 'drawer_item_with_check.dart';

class CurrencyMenu extends StatefulWidget {
  final dynamic subMenu;

  const CurrencyMenu({
    Key key,
    this.subMenu,
  }) : super(key: key);

  @override
  _CurrencyMenuState createState() => _CurrencyMenuState();
}

class _CurrencyMenuState extends State<CurrencyMenu> {
  bool expand = false;
  String currentCurrency;

  void getCurrentState() async {
    setState(() {
      currentCurrency = idCurrency;
    });
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
                  icon: Icons.monetization_on,
                  text: 'Currency(s)',
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
                    field: 'id_currency',
                    horizonPadding: 20,
                    isChecked:
                        currentCurrency == widget.subMenu[index]['id_currency'],
                    onTap: (String val) {
                      setState(() {
                        currentCurrency = val;
                        setData('Currency', val);
                        idCurrency = val;
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
