import 'package:flutter/material.dart';

import '../widgets/image_slider.dart';

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Name'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ImageSlider(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  padding: EdgeInsets.all(20),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Product Name',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '\$ 300 EX-FACTORY',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          style:
                              Theme.of(context).textTheme.subtitle1.copyWith(),
                          children: [
                            TextSpan(
                              text: 'Minimum Order: ',
                            ),
                            TextSpan(
                              text: '60000 Piece',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  padding: EdgeInsets.all(20),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Sample Details',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Sample Price',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '0',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Order Lead Time',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '10 to 15 Days',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'HS Code',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          'HY7890',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sample Dimension (Courier)',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '10 x 5 x 7 cm',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sample Weight (Courier)',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '1500 g',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sample Policy',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          'Do velit consectetur culpa duis occaecat occaecat dolore eu amet ea consequat proident.',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  padding: EdgeInsets.all(20),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Quick Details',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          style:
                              Theme.of(context).textTheme.bodyText1.copyWith(),
                          children: [
                            TextSpan(
                              text: 'Model Number: ',
                            ),
                            TextSpan(
                              text: '9876HY',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Ut elit irure pariatur sit nostrud ut consectetur. Enim irure pariatur id ex in et magna ipsum exercitation. Tempor aliqua magna cupidatat adipisicing id et nulla non cillum. Sit fugiat anim nostrud enim dolore non amet incididunt. \n\nEa ullamco enim nostrud ea deserunt consectetur consequat incididunt quis. Sunt irure anim laboris et commodo exercitation duis commodo sunt consequat. Pariatur quis nulla proident anim cillum qui est sint nostrud veniam elit est reprehenderit veniam.',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  padding: EdgeInsets.all(20),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Bulk Details',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Price in \$ (Negotiable)',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '13/piece EX-FACTORY',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Order Lead Time',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '10 to 15 Days',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Units Per Carton',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '14',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Cart Dimension',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '10 x 5 x 7 inch',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sample Weight',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '325 Kg',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  padding: EdgeInsets.all(20),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Payment Details',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Payment Method',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          'Payment Method',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Port',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          'JLN Port (Mumbai)',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Tech Transfer',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          'Yes',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        spreadRadius: 2,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Disclaimer',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Excluding Shipping and Custom charges (Shipping and Custom charges will be calculated on checkout)',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 5, 2, 0),
                color: Theme.of(context).primaryColor,
                alignment: Alignment.center,
                child: Text(
                  'General Inquiry',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(2, 5, 2, 0),
                color: Theme.of(context).primaryColor,
                alignment: Alignment.center,
                child: Text(
                  'Add to Cart',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(2, 5, 0, 0),
                color: Theme.of(context).primaryColor,
                alignment: Alignment.center,
                child: Text(
                  'Bulk Inquiry',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
