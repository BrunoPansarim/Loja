import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'cart.dart';
import 'order.dart';

class OrderList with ChangeNotifier {
  final List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  void addOrder(Cart cart) {
    _items.insert(0,
      Order(id: Random().nextDouble().toString(),
        total: cart.totalAmount,
        date: DateTime.now(),
        products: cart.items.values.toList(),
    ),
    );
    notifyListeners();
  }
}