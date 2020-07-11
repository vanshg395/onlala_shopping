import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
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
              'Category',
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
                  CategorySelectorItem(),
                  CategorySelectorItem(),
                  CategorySelectorItem(),
                  CategorySelectorItem(),
                  CategorySelectorItem(),
                  CategorySelectorItem(),
                  CategorySelectorItem(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategorySelectorItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
                // image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)   // ENTER IMAGE LINK FOR CATEGORY
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Category 1'),
          ],
        ),
      ),
      onTap: () {
        print('item clicked');
      },
    );
  }
}
