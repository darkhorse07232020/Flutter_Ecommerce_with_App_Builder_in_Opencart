import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:shop_app/models/Product.dart';
// import 'package:shop_app/screens/details/details_screen.dart';

import '../constants.dart';
// import '../size_config.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.product,
    @required this.incVal,
  }) : super(key: key);

  final double width, aspectRetio;
  final dynamic product;
  final int incVal;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int _cartNum;

  @override
  void initState() {
    _cartNum = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: SizedBox(
        width: widget.width,
        child: GestureDetector(
          // onTap: () => Navigator.pushNamed(
          //   context,
          //   DetailsScreen.routeName,
          //   arguments: ProductDetailsArguments(product: product),
          // ),
          onTap: () {},
          child: Container(
            color: Colors.white70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1.02,
                  child: Container(
                    padding: EdgeInsets.all(0),
                    child: Hero(
                      tag: widget.product['id'].toString(),
                      child: Image.network(
                        widget.product['src'],
                        fit: widget.product['image_contentMode'] ==
                                'scaleAspectFill'
                            ? BoxFit.fill
                            : BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.product['name'],
                  style: TextStyle(color: Colors.black),
                  maxLines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.product['price']}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {},
                      child: Container(
                        height: 28,
                        width: 28,
                        child: widget.product['is_in_wishlist']
                            ? Icon(Icons.favorite)
                            : Icon(Icons.favorite_outline),
                      ),
                    ),
                  ],
                ),
                _cartNum == 0
                    ? FlatButton(
                        minWidth: widget.width,
                        color: kButtonColor,
                        textColor: kBtnTxtColor,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blueAccent,
                        onPressed: () {
                          if (widget.incVal > 0) {
                            setState(() {
                              _cartNum = widget.incVal;
                            });
                          }
                        },
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                            minWidth: widget.width / 3.0,
                            color: kButtonColor,
                            textColor: kBtnTxtColor,
                            padding: EdgeInsets.all(8.0),
                            splashColor: Colors.blueAccent,
                            onPressed: () {
                              setState(() {
                                _cartNum -= widget.incVal;
                              });
                            },
                            child: Text(
                              "-",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          Container(
                            // width: MediaQuery.of(context).size.width / 4.0,
                            alignment: Alignment.center,
                            child: Text(
                              _cartNum.toString(),
                            ),
                          ),
                          FlatButton(
                            minWidth: widget.width / 3.0,
                            color: kButtonColor,
                            textColor: kBtnTxtColor,
                            padding: EdgeInsets.all(8.0),
                            splashColor: Colors.blueAccent,
                            onPressed: () {
                              setState(() {
                                _cartNum += widget.incVal;
                              });
                            },
                            child: Text(
                              "+",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
