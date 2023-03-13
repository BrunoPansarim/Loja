import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/product_grid.dart';
import '../models/product_list.dart';

  enum FilterOptions {
    Favorite,
    All,
  }


class ProductsOverViewScreen extends StatelessWidget {
  const ProductsOverViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'O lojinha',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.more_horiz_sharp),
                itemBuilder: (_) => [
                      const PopupMenuItem(
                        value: FilterOptions.Favorite,
                        child: Text('Favoritos'),
                      ),
                      const PopupMenuItem(
                        value: FilterOptions.All,
                        child: Text('Favoritos'),
                      ),
                    ],
              onSelected: (FilterOptions selectedValue) {
                if (selectedValue == FilterOptions.Favorite) {
                  provider.showFavoriteOnly();
                  } else {
                  provider.showFavoriteOnly();
                }
              },
            )
          ]),
      body: const ProductGrid(),
    );
  }
}
