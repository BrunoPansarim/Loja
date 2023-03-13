import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lojinha/models/product.dart';
import 'car_item.dart';

class Cart with ChangeNotifier {
  Map<String, CarItem> _items = {};

  Map<String, CarItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, carItem) {
      total += carItem.price * carItem.quantity;
    });
    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id,
              (existingItem) =>
              CarItem(id: existingItem.id,
                  productId: existingItem.productId,
                  title: existingItem.title,
                  quantity: existingItem.quantity +1,
                  price: existingItem.price)
      );
    } else {
      _items.putIfAbsent(
          product.id,
          () => CarItem(
          id: Random().nextDouble().toString(),
          productId: product.id,
          title: product.title,
          quantity: 1,
          price: product.price,
      ),
    );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}