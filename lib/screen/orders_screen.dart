import 'package:flutter/material.dart';
import 'package:lojinha/components/app_drawer.dart';
import 'package:lojinha/components/order.dart';
import 'package:lojinha/models/OrderList.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compras'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (ctx, i) => OrdersWidget(order: orders.items[i]),
      ),
    );
  }
}
