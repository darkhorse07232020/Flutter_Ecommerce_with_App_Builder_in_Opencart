import 'package:flutter/material.dart';

import '../size_config.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key key,
    this.child,
    this.press,
    @required this.color,
  }) : super(key: key);
  final Widget child;
  final Function press;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: FlatButton(
        color: color,
        onPressed: press,
        child: child,
      ),
    );
  }
}
