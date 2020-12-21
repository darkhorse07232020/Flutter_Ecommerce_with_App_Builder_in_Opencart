import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/add_button.dart';
import 'package:shop_app/components/cart_order_btn.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/helpers/operate_cart.dart';
import 'package:shop_app/helpers/operate_wishlist.dart';
import 'package:shop_app/models/Languages.dart';
import 'package:shop_app/models/Variable.dart';
import 'package:shop_app/providers/detail_state.dart';
import 'package:shop_app/screens/details/components/cart_num.dart';
import 'package:shop_app/screens/details/components/details_app_bar.dart';

import '../../models/Product.dart';
import 'components/image_viewer.dart';

class DetailsScreen extends StatefulWidget {
  static String routeName = "/details";

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _cartNum = 0;
  Future<void> initialize(id) async {
    await getProductData(id);
  }

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments args =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: DetailsAppBar(),
      body: FutureBuilder(
        future: initialize(args.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            dynamic temp = productVariable.product['product_info'][2];
            productVariable.product['product_info'][2] =
                productVariable.product['product_info'][0];
            productVariable.product['product_info'][0] = temp;

            return Column(
              children: [
                Flexible(
                  child: SingleChildScrollView(
                    child: Container(
                      color: kBGColor,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(10),
                            color: Colors.white,
                            child: Column(
                              children: [
                                ImageViewer(
                                  images: productVariable.product['images'],
                                ),
                                Divider(),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    productVariable.product['name'],
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    productVariable.product['price'],
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: 30,
                                    child: CartNumBtn(
                                      currentCartNum: 1,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  getWord(isoCode, 'product_info'),
                                  style: TextStyle(fontSize: 18),
                                ),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: productVariable
                                      .product['product_info'].length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.48,
                                          child: Text(
                                            productVariable
                                                    .product['product_info']
                                                [index]['name'],
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            productVariable.product[
                                                            'product_info']
                                                        [index]['value'] ==
                                                    null
                                                ? ''
                                                : productVariable
                                                        .product['product_info']
                                                    [index]['value'],
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                Html(
                                  data: productVariable.product['description'],
                                ),
                              ],
                            ),
                          ),
                          Text(
                            getWord(isoCode, 'related_products'),
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.width * 0.6,
                            child: ListView.builder(
                              itemCount: productVariable
                                  .product['related_products']
                                      ['related_products_items']
                                  .length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: MediaQuery.of(context).size.width,
                                  color: Colors.white,
                                  margin: EdgeInsets.all(5),
                                  child: ProductCard(
                                    product: productVariable
                                            .product['related_products']
                                        ['related_products_items'][index],
                                    incVal: 0,
                                    isCartButton: false,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.0,
                        child: AddButton(
                          color: Colors.white,
                          press: () {
                            if (productVariable.product['is_in_wishlist'] ==
                                false) {
                              addToWishlist(
                                context,
                                productVariable.product['id_product'],
                              );
                              setState(() {
                                productVariable.product['is_in_wishlist'] =
                                    true;
                              });
                            } else {
                              removeToWishlist(
                                context,
                                productVariable.product['id_product'],
                              );
                              setState(() {
                                productVariable.product['is_in_wishlist'] =
                                    false;
                              });
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.favorite,
                                color:
                                    productVariable.product['is_in_wishlist'] ==
                                            true
                                        ? Colors.pink
                                        : Colors.grey,
                              ),
                              SizedBox(width: 20),
                              Text(
                                'Add to Wishlist',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.0,
                        child: AddButton(
                          press: () {
                            addToCart(
                                context,
                                productVariable.product['id_product'],
                                tempCartNum.toString());
                          },
                          color: kButtonColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_cart,
                                color: kBtnTxtColor,
                              ),
                              SizedBox(width: 20),
                              Text(
                                // getWord(isoCode, 'add_to_cart'),
                                'Add to Cart',
                                style: TextStyle(
                                  color: kBtnTxtColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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

class ProductDetailsArguments {
  final String id;

  ProductDetailsArguments({@required this.id});
}
