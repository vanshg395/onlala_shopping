import 'package:flutter/material.dart';

class BulkInquiryStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bulk Inquiry Status'),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BulkInquiryStatusCard(),
              BulkInquiryStatusCard(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BulkInquiryStatusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      width: double.infinity,
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
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              children: [
                TextSpan(
                  text: 'Type of User: ',
                ),
                TextSpan(
                  text: 'Importer',
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              children: [
                TextSpan(
                  text: 'Technical Specification: ',
                ),
                TextSpan(
                  text:
                      'Eu magna tempor ea culpa eu anim minim eiusmod exercitation est qui do tempor.',
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              children: [
                TextSpan(
                  text: 'Payment Terms: ',
                ),
                TextSpan(
                  text: 'LC at site',
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              children: [
                TextSpan(
                  text: 'Additional Message: ',
                ),
                TextSpan(
                  text: 'Aliquip minim enim qui labore dolore fugiat sunt.',
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Call our Executive: ',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Icon(
                Icons.clear,
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Reports QC Stand: ',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Icon(
                Icons.clear,
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Admin Approval: ',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Icon(
                Icons.clear,
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Seller Approval: ',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Icon(
                Icons.clear,
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Admin Review: ',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Icon(
                Icons.clear,
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Manufacturer Review: ',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Icon(
                Icons.clear,
                color: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
