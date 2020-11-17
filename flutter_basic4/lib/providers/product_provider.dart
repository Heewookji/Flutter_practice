import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../models/http_exception.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  ProductProvider({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  Future<void> toggleFavoriteStatus(String token, String userId) async {
    final url =
        'https://flutter-basic-5e0a0.firebaseio.com/userFavorites/$userId/$id.json?auth=$token';
    isFavorite = !isFavorite;
    notifyListeners();
    try {
      final response = await http.put(
        url,
        body: json.encode(this.isFavorite),
      );
      if (response.statusCode >= 400) {
        isFavorite = !isFavorite;
        notifyListeners();
        throw HttpException('Could not update product.');
      }
    } catch (error) {
      isFavorite = !isFavorite;
      notifyListeners();
      throw HttpException('Could not update product.');
    }
  }

  @override
  String toString() {
    return '{ ${this.id} : ${this.title} : ${this.description} : ${this.price} : ${this.imageUrl} }';
  }
}
