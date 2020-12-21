import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';

class ProductsHorizontal extends StatelessWidget {
  final products;
  final String title;

  const ProductsHorizontal({Key key, this.products, this.title})
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
            height: MediaQuery.of(context).size.width * 0.75,
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (context, index) => ProductCard(
                width: MediaQuery.of(context).size.width / 2.5,
                product: products[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
