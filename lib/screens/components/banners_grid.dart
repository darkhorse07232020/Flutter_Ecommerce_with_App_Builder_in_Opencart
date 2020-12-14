import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/products/product_screen.dart';

class BannerGrid extends StatelessWidget {
  final dynamic banner;
  final String title;
  const BannerGrid({Key key, this.banner, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          title.length > 0
              ? Center(
                  child: Text(
                    title.toUpperCase(),
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : Container(),
          Container(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              padding: EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: banner.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    margin: EdgeInsets.all(5),
                    child: Image.network(
                      banner[index]['src'],
                      fit: banner[index]['image_contentMode'] ==
                              'scaleAspectFill'
                          ? BoxFit.fill
                          : BoxFit.contain,
                    ),
                  ),
                  onTap: banner[index]['click_target'] == 'category'
                      ? () => Navigator.pushNamed(
                            context,
                            ProductScreen.routeName,
                            arguments: ProductsArguments(
                              val: banner[index]['target_id'].toString(),
                              key: 'category_id',
                            ),
                          )
                      : (banner[index]['click_target'] == 'product'
                          ? () => Navigator.pushNamed(
                                context,
                                DetailsScreen.routeName,
                                arguments: ProductDetailsArguments(
                                  id: banner[index]['target_id'],
                                ),
                              )
                          : () {}),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
