import 'package:flutter/material.dart';
import 'package:flutter_multi_carousel/carousel.dart';
import 'package:shop_app/constants.dart';

class ImageViewer extends StatelessWidget {
  final dynamic images;

  const ImageViewer({Key key, this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Carousel(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      initialPage: 0,
      allowWrap: true,
      type: Types.simple,
      onCarouselTap: (i) {
        print("onTap $i");
      },
      indicatorType: IndicatorTypes.bar,
      indicatorBackgroundOpacity: 0,
      activeIndicatorColor: kPrimaryColor,
      unActiveIndicatorColor: Colors.grey,
      axis: Axis.horizontal,
      showArrow: true,
      arrowColor: kPrimaryColor,
      children: List.generate(
        images.length,
        (i) => Container(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            images[i]['src'],
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
