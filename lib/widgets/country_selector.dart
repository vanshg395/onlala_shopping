import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:onlala_shopping/screens/country_products_screen.dart';

class CountrySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              'Country-wise Products',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  CountrySelectorItem('assets/img/india.png', 'India'),
                  CountrySelectorItem(
                      'assets/img/bangladesh.png', 'Bangladesh'),
                  CountrySelectorItem('assets/img/iran.png', 'Iran'),
                  CountrySelectorItem('assets/img/nigeria.png', 'Nigeria'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CountrySelectorItem extends StatelessWidget {
  final String imageUrl, countryName;

  CountrySelectorItem(this.imageUrl, this.countryName);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: 120,
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              countryName,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => CountryProductsScreen(countryName),
          ),
        );
      },
    );
  }
}
