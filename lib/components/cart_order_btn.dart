import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/helpers/operate_cart.dart';

class CartOrderBtn extends StatefulWidget {
  final double width;
  final int currentCartNum;
  final productID;
  final Function(int) onTap;
  final parentContext;
  const CartOrderBtn({
    Key key,
    this.width,
    this.onTap,
    this.currentCartNum,
    this.productID,
    @required this.parentContext,
  }) : super(key: key);

  @override
  _CartOrderBtnState createState() => _CartOrderBtnState();
}

class _CartOrderBtnState extends State<CartOrderBtn> {
  int _cartNum = 0;

  @override
  void initState() {
    _cartNum = widget.currentCartNum;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
              if (_cartNum == 0) return;
              setState(() {
                _cartNum--;
              });
              if (_cartNum == 0) {
                removeToCart(widget.parentContext, widget.productID, '1');
              } else {
                updateQuantity(widget.parentContext, widget.productID,
                    _cartNum.toString());
              }
              widget.onTap(_cartNum);
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
              addToCart(context, widget.productID, '1');
              setState(() {
                _cartNum++;
              });
              widget.onTap(_cartNum);
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
