import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lojinha/data/dummy_data.dart';
import 'package:lojinha/models/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];
  List<Product> get favoriteItems =>
      items.where((prod) => prod.isFavorite).toList();

  int get itemsCount {
    return _items.length;

  }  void addProductFromData(Map<String, Object>data) {
    final newProduct = Product(
      id: Random().nextDouble().toString(),
      title: data['title'] as String,
      description: data['description'] as String,
      price: data['price'] as double,
      imageUrl: data['imageUrl'] as String,
    );

    addProduct(newProduct);
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
  // bool _showFavoriteOnly = false;
  //
  //   if(_showFavoriteOnly) {
  //     return _items.where((prod) => prod.isFavorite).toList();
  //   }
  //   return [..._items];
  // }
  //
  // void showFavoriteOnly() {
  //   _showFavoriteOnly = true;
  //   notifyListeners();
  // }
  //
  // void _showAll() {
  //   _showFavoriteOnly = false;
  //   notifyListeners();
  // }
