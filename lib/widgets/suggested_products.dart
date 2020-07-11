import 'package:flutter/material.dart';

class SuggestedProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              'Products you may like',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          SuggestedProductCard(),
          SuggestedProductCard(),
          SuggestedProductCard(),
          SuggestedProductCard()
        ],
      ),
    );
  }
}

class SuggestedProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            spreadRadius: 2,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 140,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              // image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)   // ENTER IMAGE LINK FOR CATEGORY
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Product Name',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(),
                  ),
                  Text(
                    'Cillum enim enim cupidatat ad in in ad qui minim cupidatat amet consequat.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subtitle2.copyWith(),
                  ),
                  Text(
                    '\$300',
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
