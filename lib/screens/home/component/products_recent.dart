import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';

class ProductRecent extends StatelessWidget {
  final product;

  const ProductRecent({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(
        height: 100,
        child: ListView.builder(
          padding: EdgeInsets.all(0),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: product.length,
          itemBuilder: (context, index) => ProductCard(
            product: product[index],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.image,
    @required this.press,
  }) : super(key: key);

  final String image;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.network(
          image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
