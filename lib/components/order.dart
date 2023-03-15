import 'package:flutter/material.dart';

import '../models/order.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({Key? key, required this.order}) : super(key: key);
  
  final Order order;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('R\$ ${order.total.toStringAsFixed(2)}'),
      ),
    );
  }
}
