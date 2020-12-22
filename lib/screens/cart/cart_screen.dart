import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/helpers/operate_cart.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Login.dart';
import 'package:shop_app/screens/cart/components/cart_app_bar.dart';
import 'package:shop_app/screens/cart/components/popup_menu.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";
  final bool isLeadingButton;

  const CartScreen({Key key, this.isLeadingButton = true}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _textController;
  String updatedQuantity;

  Future<void> initialize() async {
    await getCartDetails(loginVariable.email);
  }

  Future<void> changeQuantity(updatedQuantity, id, index) async {
    var res = await showTextInputDialog(
      context: _scaffoldKey.currentContext,
      textFields: [
        DialogTextField(initialText: updatedQuantity),
      ],
    );
    if (res == null) return;
    updateQuantity(
      _scaffoldKey.currentContext,
      id,
      res[0],
    );
    setState(() {
      cartVariable.products[index]['quantity'] = updatedQuantity;
    });
  }

  @override
  void initState() {
    _textController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CartAppBar(
        isLeadingButton: widget.isLeadingButton,
      ),
      body: FutureBuilder(
        future: initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              height: MediaQuery.of(context).size.height,
              color: kBGColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: cartVariable.products.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        dynamic item = cartVariable.products[index];
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.only(left: 20, right: 0),
                            margin: EdgeInsets.symmetric(vertical: 5),
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  child: PopupMenu(
                                    onTap: (int val) {
                                      if (val == 1) {
                                        changeQuantity(
                                          item['quantity'],
                                          item['product_id'],
                                          index,
                                        );
                                      } else if (val == 2) {
                                        removeToCart(
                                          _scaffoldKey.currentContext,
                                          item['product_id'],
                                          item['quantity'],
                                        );

                                        setState(() {
                                          cartVariable.products.removeAt(index);
                                        });
                                      }
                                    },
                                  ),
                                  right: 0,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          4.0,
                                      child: Image.network(item['images'],
                                          fit: BoxFit.fill),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item['title'],
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Quantity:',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Text(
                                                '${item['quantity']}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              SizedBox(width: 50),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                item['discount_percentage'] == 0
                                                    ? ''
                                                    : '${item['price']}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                ),
                                              ),
                                              Text(
                                                item['discount_percentage'] == 0
                                                    ? '${item['price']}'
                                                    : '${item['discount_price']}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.green,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(top: 5),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: [
                                Text(cartVariable.totals[0]['name']),
                                SizedBox(height: 10),
                                Text(cartVariable.totals[1]['name']),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text(cartVariable.totals[0]['value']),
                                SizedBox(height: 10),
                                Text(cartVariable.totals[1]['value']),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
