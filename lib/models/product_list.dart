import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lojinha/data/dummy_data.dart';
import 'package:lojinha/models/product.dart';

class ProductList with ChangeNotifier {
  final _Url =
      'https://e-commerce-camisetas-default-rtdb.firebaseio.com/products.json';
  final List<Product> _items = [];

  List<Product> get items => [..._items];

  List<Product> get favoriteItems =>
      items.where((prod) => prod.isFavorite).toList();

  int get itemsCount {
    return _items.length;
  }

  Future<void> loadProducts() async {
    final response = await http.get(Uri.parse(_Url));
    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((product, ProductData) {
      _items.add(
        Product(
          id: productId,
          name: productData['name'],
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl,
        ),
      );
    });
  }

  Future<void> saveProduct(Map<String, Object> data) async {
    bool hasId = data['id'] != null;

    final product = Product(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      name: data['name'] as String,
      description: data['description'] as String,
      price: data['price'] as double,
      imageUrl: data['imageUrl'] as String,
    );

    if (hasId) {
      return updateProduct(product);
    } else {
      return addProduct(product);
    }
  }

  Future<void> addProduct(Product product) async {
    final response = await http.post(
      Uri.parse('$_Url/products.json'),
      body: jsonEncode(
        {
          "name": product.name,
          "description": product.description,
          "price": product.price,
          "imageUrl": product.imageUrl,
          "isFavorite": product.isFavorite,
        },
      ),
    );

    final id = jsonDecode(response.body)['name'];
    _items.add(
      Product(
        id: id,
        name: product.name,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        isFavorite: product.isFavorite,
      ),
    );
    notifyListeners();
  }

  Future<void> updateProduct(Product product) async {
    int index = _items.indexWhere((p) => p.id == product.id);

    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
    return Future.value();
  }

  void removeProduct(Product product) {
    int index = _items.indexWhere((p) => p.id == product.id);

    if (index >= 0) {
      _items.removeWhere((p) => p.id == product.id);
      notifyListeners();
    }
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
