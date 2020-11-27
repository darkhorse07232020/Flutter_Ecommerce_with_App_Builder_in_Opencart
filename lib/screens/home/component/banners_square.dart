import 'package:flutter/material.dart';

class BannerSquare extends StatelessWidget {
  final dynamic banner;
  final String title;
  const BannerSquare({Key key, this.banner, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          title.length > 0
              ? Center(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : Container(),
          Container(
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: banner.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  margin: EdgeInsets.all(5),
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
