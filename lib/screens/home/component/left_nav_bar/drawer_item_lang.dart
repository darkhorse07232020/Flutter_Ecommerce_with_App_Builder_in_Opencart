import 'package:flutter/material.dart';

class DrawerItemWithLang extends StatefulWidget {
  final IconData icon;
  final dynamic item;
  final double horizonPadding;
  final bool isChecked;
  final String field;
  final Function(String) onTap;

  const DrawerItemWithLang({
    Key key,
    this.icon,
    this.item,
    this.field,
    this.horizonPadding = 10,
    this.onTap,
    this.isChecked,
  }) : super(key: key);

  @override
  _DrawerItemWithLangState createState() => _DrawerItemWithLangState();
}

class _DrawerItemWithLangState extends State<DrawerItemWithLang> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: widget.horizonPadding, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                widget.item['name'],
                style: TextStyle(fontSize: 14),
              ),
            ),
            widget.isChecked ? Icon(Icons.check) : Container(),
          ],
        ),
      ),
      onTap: () {
        widget.onTap(widget.item[widget.field]);
      },
    );
  }
}
