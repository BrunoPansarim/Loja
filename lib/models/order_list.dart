import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:lojinha/models/product.dart';
import '../utils/constants.dart';
import 'cart.dart';
import 'order.dart';

class OrderList with ChangeNotifier {
  final List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Future<void> loadOrders() async {
    _items.clear();

    final response = await http.get(Uri.parse('${Constants.order_base_url}.json'),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((orderId, orderData) {
      _items.add(
        Product(
          id: productId,
          name: productData['name'],
          description: productData['description'],
          price: productData['price'],
          imageUrl: productData['imageUrl'],
          isFavorite: productData['isFavorite'],
        ),
      );
    });
    notifyListeners();
  }




  Future<void> addOrder(Cart cart) async {
    final date = DateTime.now();

    final response = await http.post(
      Uri.parse('${Constants.order_base_url}.json'),
      body: jsonEncode(
        {
          'total': cart.totalAmount,
          'date': date.toIso8601String(),
          'products': cart.items.values
              .map(
                (cartItem) => {
                  'id': cartItem.id,
                  'productId': cartItem.productId,
                  'name': cartItem.title,
                  'quantity': cartItem.quantity,
                  'price': cartItem.price,
                },
              )
              .toList(),
        },
      ),
    );
    final id = jsonDecode(response.body)['name'];
    _items.insert(
      0,
      Order(
        id: id,
        total: cart.totalAmount,
        date: date,
        products: cart.items.values.toList(),
      ),
    );
    notifyListeners();
  }
}
