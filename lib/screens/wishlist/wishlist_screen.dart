import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Login.dart';
import 'package:shop_app/models/Wishlist.dart';
import 'package:shop_app/screens/details/details_screen.dart';

class WishlistScreen extends StatelessWidget {
  static String routeName = "/wishlist";

  Future<void> initialize() async {
    await getWishlist(loginVariable.email);
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      margin: EdgeInsets.symmetric(vertical: 10),
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
