import 'package:flutter/material.dart';

class DrawerItemWithLang extends StatefulWidget {
  final IconData icon;
  final String text;
  final double horizonPadding;
  final GestureTapCallback onTap;

  const DrawerItemWithLang(
      {Key key, this.icon, this.text, this.horizonPadding = 10, this.onTap})
      : super(key: key);

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
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                widget.text,
                style: TextStyle(fontSize: 14),
              ),
            ),
            Icon(Icons.check),
          ],
        ),
      ),
      onTap: widget.onTap,
    );
  }
}
