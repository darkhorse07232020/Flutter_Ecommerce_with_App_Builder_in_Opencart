import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/component/left_nav_bar/drawer_item.dart';
import 'package:shop_app/screens/products/product_screen.dart';

class ExpandItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final dynamic subMenu;

  const ExpandItem({
    Key key,
    this.icon,
    this.title,
    this.subMenu,
  }) : super(key: key);

  @override
  _ExpandItemState createState() => _ExpandItemState();
}

class _ExpandItemState extends State<ExpandItem> {
  bool expand = false;

  @override
  void initState() {
    setState(() {
      expand = false;
    });
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
                  icon: widget.icon,
                  text: widget.title,
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
                  return DrawerItem(
                    text: widget.subMenu[index]['name'],
                    horizonPadding: 20,
                    onTap: () => Navigator.pushNamed(
                      context,
                      ProductScreen.routeName,
                      arguments: ProductsArguments(
                        val: widget.subMenu[index]['id'].toString(),
                        key: 'category_id',
                      ),
                    ),
                  );
                },
              )
            : Container(),
      ],
    );
  }
}
