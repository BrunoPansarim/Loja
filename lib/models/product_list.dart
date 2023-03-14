import 'package:flutter/material.dart';
import 'package:lojinha/data/dummy_data.dart';
import 'package:lojinha/models/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];
  List<Product> get favoriteItems =>
      items.where((prod) => prod.isFavorite).toList();

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
