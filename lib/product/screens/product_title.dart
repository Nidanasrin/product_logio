
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logiology/product/model/product_model.dart';


class Producttile extends StatelessWidget {
  final Product product;
  Producttile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: CachedNetworkImage(
              imageUrl: product.thumbnail ?? '',
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 6,),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(product.title ?? 'No Title',
            style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold),
            maxLines: 2,
          ),
      Text('${product.price}'),
      Text('${product.rating}',style: TextStyle(fontSize: 15),
      ),

        ],

      ),
    ),
    ])
    );
  }
}
