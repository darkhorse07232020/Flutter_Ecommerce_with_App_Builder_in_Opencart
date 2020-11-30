import 'package:flutter/material.dart';

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
                return Container(
                  width: 400,
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Image.network(
                    banner[index]['src'],
                    fit: banner[index]['image_contentMode'] == 'scaleAspectFill'
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
