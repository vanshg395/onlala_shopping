import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerWidget extends StatelessWidget {
  final List<dynamic> _banner;

  BannerWidget(this._banner);

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
          ..._banner.map(
            (pic) => Container(
              height: 250,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: pic['image'],
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
