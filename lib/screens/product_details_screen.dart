import 'package:flutter/material.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  // final String title;
  // final String price;
  // ProductDetailsScreen(
  //   this.title,
  //   this.price,
  // );
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    ;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          loadedProduct.title,
        ),
      ),
    );
  }
}
