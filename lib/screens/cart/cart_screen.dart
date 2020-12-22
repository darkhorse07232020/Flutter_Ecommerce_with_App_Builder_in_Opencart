import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/icon_with_counter.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Login.dart';
import 'package:shop_app/models/Variable.dart';
import 'package:shop_app/providers/detail_state.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/wishlist/wishlist_screen.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  Future<void> initialize() async {
    await getCartDetails(loginVariable.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        iconTheme: IconThemeData(
          color: kBtnTxtColor,
        ),
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.all(0),
          child: Text(
            'Shopping Bag',
            style: TextStyle(color: kBtnTxtColor),
          ),
        ),
        actions: [
          loginState
              ? Consumer<DetailState>(
                  builder: (context, details, child) {
                    return IconWithCounter(
                      text: '',
                      iconData: Icons.favorite_outline,
                      notificationCount: details.wishlistCount,
                      onTap: () {
                        Navigator.pushNamed(context, WishlistScreen.routeName);
                      },
                    );
                  },
                )
              : Container(),
          loginState
              ? Consumer<DetailState>(
                  builder: (context, details, child) {
                    return IconWithCounter(
                      text: '',
                      iconData: Icons.card_travel,
                      notificationCount: details.cartCount,
                      onTap: () {},
                    );
                  },
                )
              : IconButton(
                  icon: Icon(Icons.card_travel),
                  onPressed: () {},
                ),
        ],
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
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              DetailsScreen.routeName,
                              arguments: ProductDetailsArguments(
                                id: item['product_id'].toString(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 20, right: 0),
                            margin: EdgeInsets.symmetric(vertical: 5),
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  child: myPopMenu(),
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

  Widget myPopMenu() {
    return PopupMenuButton(
      padding: EdgeInsets.all(0),
      elevation: 20,
      onSelected: (value) {
        print(value);
      },
      offset: Offset.lerp(Offset(0, 0), Offset(10, 10), 10),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                child: Icon(Icons.edit),
              ),
              Text('Update Quantity'),
            ],
          ),
        ),
        PopupMenuItem(
            value: 2,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                  child: Icon(Icons.delete),
                ),
                Text('Remove')
              ],
            )),
      ],
    );
  }
}
