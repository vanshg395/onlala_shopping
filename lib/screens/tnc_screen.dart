import 'package:flutter/material.dart';

class TNCScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Consitions'),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 20),
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
                      'Some Message',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Fugiat Lorem Lorem ad occaecat irure aliquip officia elit. Dolore reprehenderit ex sunt aliqua velit nostrud culpa magna. Ad esse voluptate id do nostrud enim reprehenderit veniam ullamco minim laborum nostrud. Sunt amet fugiat enim tempor labore fugiat consequat Lorem. Est laborum voluptate nulla incididunt ex. Aliqua sunt id ullamco esse consectetur voluptate dolor esse id mollit.',
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
    );
  }
}
