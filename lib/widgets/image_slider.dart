import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1,
          height: 250,
          autoPlay: true,
          enableInfiniteScroll: false,
        ),
        items: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              // image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)   // ENTER IMAGE LINK FOR CATEGORY
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              // image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)   // ENTER IMAGE LINK FOR CATEGORY
            ),
          ),
        ],
      ),
    );
  }
}
