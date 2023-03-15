import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/order.dart';

class OrdersWidget extends StatefulWidget {
  const OrdersWidget({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  State<OrdersWidget> createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('R\$ ${widget.order.total.toStringAsFixed(2)}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.date),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.expand_more_sharp),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 4,
              ),
              height: (widget.order.products.length * 24) + 10,
              child: ListView(
                  children: widget.order.products.map(
                (product) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${product.quantity}x R\$ ${product.price}',
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                      )
                    ],
                  );
                },
              ).toList()),
            ),
        ],
      ),
    );
  }
}
