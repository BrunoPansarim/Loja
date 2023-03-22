import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  late final String id;
  late final String name;
  late final String description;
  late final double price;
  late final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}