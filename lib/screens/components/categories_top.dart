import 'package:flutter/material.dart';
import 'package:shop_app/screens/products/product_screen.dart';

class CategoriesTop extends StatelessWidget {
  final categories;

  const CategoriesTop({Key key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(
        height: MediaQuery.of(context).size.width / 4.0,
        child: ListView.builder(
          padding: EdgeInsets.all(0),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: categories.length,
          itemBuilder: (context, index) => CategoryCard(
            image: categories[index]["image_src"],
            press: () {
              Navigator.pushNamed(
                context,
                ProductScreen.routeName,
                arguments: ProductsArguments(
                  val: categories[index]['id'].toString(),
                  key: 'category_id',
                ),
              );
            },
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
        height: MediaQuery.of(context).size.width / 4.0,
        width: MediaQuery.of(context).size.width / 4.0,
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
