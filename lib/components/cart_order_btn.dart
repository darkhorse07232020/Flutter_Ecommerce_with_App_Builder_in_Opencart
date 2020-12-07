import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class CartOrderBtn extends StatefulWidget {
  final double width;
  const CartOrderBtn({Key key, this.width}) : super(key: key);

  @override
  _CartOrderBtnState createState() => _CartOrderBtnState();
}

class _CartOrderBtnState extends State<CartOrderBtn> {
  int _cartNum = 0;

  @override
  void initState() {
    _cartNum = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
            minWidth: widget.width / 3.0,
            color: kButtonColor,
            textColor: kBtnTxtColor,
            padding: EdgeInsets.all(0),
            splashColor: Colors.blueAccent,
            onPressed: () {
              if (_cartNum == 1) return;
              setState(() {
                _cartNum--;
              });
            },
            child: Center(
              child: Text(
                "-",
                style: TextStyle(fontSize: 20.0, height: 1),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              _cartNum.toString(),
            ),
          ),
          FlatButton(
            minWidth: widget.width / 3.0,
            color: kButtonColor,
            textColor: kBtnTxtColor,
            padding: EdgeInsets.all(0),
            splashColor: Colors.blueAccent,
            onPressed: () {
              setState(() {
                _cartNum++;
              });
            },
            child: Center(
              child: Text(
                "+",
                style: TextStyle(fontSize: 20.0, height: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
