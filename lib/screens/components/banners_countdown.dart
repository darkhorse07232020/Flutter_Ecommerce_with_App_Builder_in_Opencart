import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop_app/models/HomeScreen.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/products/product_screen.dart';

class BannerCountdown extends StatelessWidget {
  final dynamic banner;
  final String title;
  const BannerCountdown({Key key, this.banner, this.title}) : super(key: key);

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
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: banner.length,
              itemBuilder: (context, index) {
                if (currentTime.length < banner.length) {
                  currentTime.add(int.parse(banner[index]['upto_time']));
                }
                return InkWell(
                  child: CountdownCard(
                    index: index,
                    image: banner[index]['src'],
                    imageMode: banner[index]['image_contentMode'],
                    bgColor: banner[index]['timer_background_color'],
                    textColor: banner[index]['timer_text_color'],
                  ),
                  onTap: banner[index]['click_target'] == 'category'
                      ? () => Navigator.pushNamed(
                            context,
                            ProductScreen.routeName,
                            arguments: ProductsArguments(
                              val: banner[index]['target_id'].toString(),
                              key: 'category_id',
                            ),
                          )
                      : (banner[index]['click_target'] == 'product'
                          ? () => Navigator.pushNamed(
                                context,
                                DetailsScreen.routeName,
                                arguments: ProductDetailsArguments(
                                  id: banner[index]['target_id'],
                                ),
                              )
                          : () {}),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CountdownCard extends StatefulWidget {
  final int index;
  final String image;
  final String imageMode;
  final String bgColor;
  final String textColor;

  CountdownCard({
    Key key,
    this.index,
    this.image,
    this.imageMode,
    this.bgColor,
    this.textColor,
  }) : super(key: key);

  @override
  _CountdownCardState createState() => _CountdownCardState();
}

class _CountdownCardState extends State<CountdownCard> {
  int _currentTime;
  Timer _timer;

  String getTimeString(int time) {
    int hour = time ~/ 3600;
    int min = (time % 3600) ~/ 60;
    int sec = (time % 3600) % 60;
    return hour.toString() +
        ' Hours ' +
        min.toString() +
        ' Minutes ' +
        sec.toString() +
        ' Seconds';
  }

  void startTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    } else {
      _timer = new Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) => setState(
          () {
            if (_currentTime < 1) {
              timer.cancel();
            } else {
              _currentTime -= 1;
              currentTime[widget.index] = _currentTime;
            }
          },
        ),
      );
    }
  }

  @override
  void initState() {
    _currentTime = currentTime[widget.index];
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.75,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.image),
          fit: widget.imageMode == 'scaleAspectFill'
              ? BoxFit.fill
              : BoxFit.contain,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: widget.bgColor.length > 0
                ? Color(
                    int.parse('0xFF' + widget.bgColor),
                  )
                : Colors.transparent,
          ),
          child: Text(
            getTimeString(_currentTime),
            style: TextStyle(
              fontSize: 20,
              color: Color(
                int.parse(
                  '0xFF' + widget.textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
