import 'package:flutter/material.dart';

class DrawerItemWithCheck extends StatelessWidget {
  final IconData icon;
  final String text;
  final double horizonPadding;
  final GestureTapCallback onTap;

  const DrawerItemWithCheck(
      {Key key, this.icon, this.text, this.horizonPadding = 10, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizonPadding, vertical: 10),
        child: Row(
          children: <Widget>[
            Icon(icon),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 14),
              ),
            )
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
