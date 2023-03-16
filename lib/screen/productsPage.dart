import 'package:flutter/material.dart';
import 'package:lojinha/models/product_list.dart';
import 'package:provider/provider.dart';

import '../components/app_drawer.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Produtos',),
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: products.itemsCount,
          itemBuilder: (ctx, i) =>
              ElevatedButton(
                  onPressed: () {},
                  child: Text(products.items[i].title),
              ),
      ),
    );
  }
}
