import 'package:flutter/material.dart';

class HttpException implements Exception {
  final String msg;
  final int statusCode;

  HttpException({
    required this.msg,
    required this.statusCode,
});

  @override
  String toString() {
    return msg;

  }
}

// if (response.statusCode >= 400) {
// _items.insert(index, product);
// notifyListeners();

