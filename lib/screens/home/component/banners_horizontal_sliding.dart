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
        children: [
          Text(title),
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
                  height: 200,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.network(banner[index]['src']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
