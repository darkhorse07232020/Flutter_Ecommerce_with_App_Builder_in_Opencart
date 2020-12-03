import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/screens/components/products_grid.dart';
import 'package:shop_app/screens/components/products_square.dart';

import 'components/product_app_bar.dart';

class ProductScreen extends StatefulWidget {
  static String routeName = "/products";

  const ProductScreen({
    Key key,
  }) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool isGridView;

  Future<void> initialize(id) async {
    await getCategoryData(id);
  }

  @override
  void initState() {
    isGridView = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProductsArguments args = ModalRoute.of(context).settings.arguments;

    return FutureBuilder(
      future: initialize(args.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: ProductAppBar(categoryVariable.title),
            body: Container(
              color: kBGColor,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isGridView = !isGridView;
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 30,
                            color: kSecondaryColor,
                            child: Center(
                              child: isGridView
                                  ? Icon(Icons.view_list, color: Colors.white)
                                  : Icon(Icons.laptop_windows,
                                      color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 90) / 2.0,
                          height: 30,
                          color: kSecondaryColor,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.sort, color: Colors.white),
                                SizedBox(width: 5),
                                Text('Sort',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 90) / 2.0,
                          height: 30,
                          color: kSecondaryColor,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.filter_alt_outlined,
                                    color: Colors.white),
                                SizedBox(width: 2),
                                Text('Filter',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    color: Colors.black87,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        isGridView
                            ? ProductsGrid(
                                products: categoryVariable.products,
                              )
                            : ProductSquare(
                                products: categoryVariable.products,
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: ProductAppBar(args.title),
            body: Container(
              color: kBGColor,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isGridView = !isGridView;
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 30,
                            color: kSecondaryColor,
                            child: Center(
                              child: isGridView
                                  ? Icon(Icons.view_list, color: Colors.white)
                                  : Icon(Icons.laptop_windows,
                                      color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 90) / 2.0,
                          height: 30,
                          color: kSecondaryColor,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.sort, color: Colors.white),
                                SizedBox(width: 5),
                                Text('Sort',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 90) / 2.0,
                          height: 30,
                          color: kSecondaryColor,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.filter_alt_outlined,
                                    color: Colors.white),
                                SizedBox(width: 2),
                                Text('Filter',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                    color: Colors.black87,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                      ),
                      CircularProgressIndicator(),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

class ProductsArguments {
  final String id;
  final String title;

  ProductsArguments({@required this.id, this.title = ''});
}
