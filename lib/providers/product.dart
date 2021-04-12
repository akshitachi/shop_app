import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product with ChangeNotifier {
  final String id;
  final title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });
  Future<void> toggleisFavoriteStatus() async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = Uri.parse(
        'https://shop-app-8224c-default-rtdb.firebaseio.com/products/$id.json');
    try {
      await http.patch(url,
          body: json.encode({
            'isFavorite': isFavorite,
          }));
    } catch (error) {
      isFavorite = oldStatus;
      notifyListeners();
    }
  }
}
