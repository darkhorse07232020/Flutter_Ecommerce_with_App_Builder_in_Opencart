import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/helpers/operate_wishlist.dart';
import 'package:shop_app/models/Login.dart';
import 'package:shop_app/models/Wishlist.dart';
import 'package:shop_app/screens/details/details_screen.dart';

class WishlistScreen extends StatefulWidget {
  static String routeName = "/wishlist";

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> initialize() async {
    await getWishlist(loginVariable.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        iconTheme: IconThemeData(
          color: kBtnTxtColor,
        ),
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.all(0),
          child: Text(
            'Add to Wishlist',
            style: TextStyle(color: kBtnTxtColor),
          ),
        ),
      ),
      body: FutureBuilder(
        future: initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              color: kBGColor,
              child: ListView.builder(
                itemCount: wishlistVariable.wishlistProduct.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  dynamic item = wishlistVariable.wishlistProduct[index];
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
                      padding: EdgeInsets.only(left: 20),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 4.0,
                            child:
                                Image.network(item['images'], fit: BoxFit.fill),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.55,
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title'],
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  item['discount_percentage'] == 0
                                      ? ''
                                      : ' ${item['discount_price']} ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                Text(
                                  '${item['price']}',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.grey,
                              size: 24,
                            ),
                            onPressed: () {
                              removeToWishlist(
                                _scaffoldKey.currentContext,
                                item['product_id'].toString(),
                              );
                              setState(() {
                                wishlistVariable.wishlistProduct
                                    .removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
