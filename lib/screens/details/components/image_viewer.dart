import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  final dynamic images;

  const ImageViewer({Key key, this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController controller;
    return Stack(
      // height: MediaQuery.of(context).size.height * 0.6,
      children: [
        PageView.builder(
          controller: controller,
          itemCount: images.length,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(10),
              child: Image.network(
                images[index]['src'],
                fit: BoxFit.fill,
              ),
            );
          },
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(),
        ),
      ],
    );
  }
}
