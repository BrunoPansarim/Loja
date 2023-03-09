import 'package:flutter/material.dart';
import 'package:lojinha/components/product_item.dart';
import 'package:lojinha/data/dummy_data.dart';
import '../models/product.dart';


class ProductsOverViewScreen extends StatelessWidget {
  ProductsOverViewScreen({Key? key}) : super(key: key);

  final List<Product> loadedProducts = dummyProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'O lojinha',
          style: TextStyle(color: Colors.white,
          ),
        ),
    ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: loadedProducts.length,
          itemBuilder: (ctx, i) => ProductItem(product: loadedProducts[i]),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ),
      )
    );
  }
}

