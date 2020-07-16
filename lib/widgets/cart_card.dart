import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:onlala_shopping/providers/auth.dart';
import 'package:onlala_shopping/providers/cart.dart';
import 'package:provider/provider.dart';

class CartCard extends StatefulWidget {
  final String name;
  final String description;
  final String price;
  final String quantity;
  final String id;
  final Function refresh;
  final String image;

  CartCard(
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.id,
    this.refresh,
    this.image,
  );

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  bool _isLoading = false;

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
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              image: DecorationImage(
                image: CachedNetworkImageProvider(widget.image),
                fit: BoxFit.cover,
              ),
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
                    widget.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    widget.description ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText2.copyWith(),
                  ),
                  Text(
                    '€ ${widget.price}',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText1,
                      children: [
                        TextSpan(
                          text: 'Quantity: ',
                        ),
                        TextSpan(
                          text: widget.quantity,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 70,
            child: IconButton(
              icon: Icon(
                Icons.delete,
                size: 36,
                color: _isLoading ? Colors.grey : Colors.red,
              ),
              onPressed: _isLoading
                  ? () {}
                  : () async {
                      setState(() {
                        _isLoading = true;
                      });
                      await Provider.of<Cart>(context, listen: false)
                          .removeItem(
                              Provider.of<Auth>(context, listen: false).token,
                              widget.id,
                              widget.name);
                      setState(() {
                        _isLoading = false;
                      });
                      widget.refresh();
                    },
            ),
          ),
        ],
      ),
    );
  }
}
