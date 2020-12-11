import 'package:flutter/material.dart';

class IconWithCounter extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback onTap;
  final int notificationCount;

  const IconWithCounter({
    Key key,
    this.onTap,
    @required this.text,
    @required this.iconData,
    this.notificationCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(iconData),
                text.length > 0
                    ? Text(text, overflow: TextOverflow.ellipsis)
                    : Container(),
              ],
            ),
            Positioned(
              top: 8,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                alignment: Alignment.center,
                child: Text(
                  '$notificationCount',
                  style: TextStyle(fontSize: 11),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
