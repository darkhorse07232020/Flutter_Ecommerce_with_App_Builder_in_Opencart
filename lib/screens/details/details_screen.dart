import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/details/components/details_app_bar.dart';

import '../../models/Product.dart';
import 'components/image_viewer.dart';

class DetailsScreen extends StatefulWidget {
  static String routeName = "/details";

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
            return Container(
              color: kBGColor,
              child: Column(
                children: [
                  ImageViewer(images: productVariable.product['images']),
                ],
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

class ProductDetailsArguments {
  final String id;

  ProductDetailsArguments({@required this.id});
}
