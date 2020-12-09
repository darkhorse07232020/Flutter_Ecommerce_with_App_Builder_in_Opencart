import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';

class ProductsGrid extends StatelessWidget {
  final dynamic products;
  final String title;
  const ProductsGrid({
    Key key,
    @required this.products,
    this.title = '',
  }) : super(key: key);

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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),
              padding: EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Container(
                  height: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  margin: EdgeInsets.all(5),
                  child: ProductCard(
                    product: products[index],
                    width: MediaQuery.of(context).size.width / 2.0,
                    incVal: 0,
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
