import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import '../../../models/Variable.dart';

class CartNumBtn extends StatefulWidget {
  final double width;
  final int currentCartNum;
  // final Function(int) onTap;
  const CartNumBtn({Key key, this.width, this.currentCartNum})
      : super(key: key);

  @override
  _CartNumBtnState createState() => _CartNumBtnState();
}

class _CartNumBtnState extends State<CartNumBtn> {
  int _cartNum = 1;

  @override
  void initState() {
    _cartNum = widget.currentCartNum;
    tempCartNum = _cartNum;
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
              tempCartNum--;
              // widget.onTap(_cartNum);
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
              tempCartNum++;
              // widget.onTap(_cartNum);
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
