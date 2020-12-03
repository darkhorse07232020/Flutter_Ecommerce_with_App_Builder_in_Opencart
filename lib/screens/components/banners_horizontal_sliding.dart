import 'package:flutter/material.dart';
import 'package:shop_app/screens/products/product_screen.dart';

class BannersHorizontalSliding extends StatelessWidget {
  final dynamic banner;
  final String title;
  const BannersHorizontalSliding({Key key, this.banner, this.title})
      : super(key: key);

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
            height: 200,
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: banner.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 5),
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
                              id: banner[index]['target_id'].toString(),
                              title: banner[index]['title'],
                            ),
                          )
                      : () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
