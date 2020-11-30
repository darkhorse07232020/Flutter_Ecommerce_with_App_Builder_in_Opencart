import 'package:flutter/material.dart';

class ProductsGrid extends StatelessWidget {
  final dynamic products;
  final String title;
  const ProductsGrid({Key key, this.products, this.title}) : super(key: key);

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
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  margin: EdgeInsets.all(5),
                  child: Image.network(
                    products[index]['src'],
                    fit: products[index]['image_contentMode'] ==
                            'scaleAspectFill'
                        ? BoxFit.cover
                        : BoxFit.fitWidth,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
