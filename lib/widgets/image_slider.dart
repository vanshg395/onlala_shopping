import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:onlala_shopping/widgets/video_preview.dart';

class ImageSlider extends StatelessWidget {
  final List<dynamic> images;
  final List<dynamic> videos;

  ImageSlider(this.images, this.videos);

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
          ...images
              .map(
                (pic) => Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(pic['product_image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
              .toList(),
          ...videos
              .map(
                (e) => VideoPreviewScreen(e['product_video']),
              )
              .toList(),
        ],
      ),
    );
  }
}
