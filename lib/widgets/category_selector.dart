import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:onlala_shopping/screens/category_screen.dart';
import '../screens/all_products.dart';

class CategorySelector extends StatelessWidget {
  final List<dynamic> _categoriesList;

  CategorySelector(this._categoriesList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
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
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 120,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              shape: BoxShape.circle,
                              // image: DecorationImage(
                              //     image: CachedNetworkImageProvider(imageUrl),
                              //     fit: BoxFit.cover) // ENTER IMAGE LINK FOR CATEGORY
                            ),
                            child: Icon(
                              Icons.dashboard,
                              size: 40,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'All\nProducts',
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
                          builder: (ctx) => AllProductsScreen(),
                        ),
                      );
                    },
                  ),
                  ..._categoriesList.map(
                    (category) => CategorySelectorItem(
                      category['category_image'][0]["image"],
                      category['name'],
                      category['id'],
                    ),
                  )
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
  final String imageUrl, categoryName, id;
  CategorySelectorItem(this.imageUrl, this.categoryName, this.id);
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
                      image: CachedNetworkImageProvider(imageUrl),
                      fit: BoxFit.cover) // ENTER IMAGE LINK FOR CATEGORY
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              categoryName,
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
            builder: (ctx) => SubCategorySelectScreen(id, categoryName),
          ),
        );
      },
    );
  }
}
