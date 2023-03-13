import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/product_grid.dart';
import '../models/product_list.dart';

  enum FilterOptions {
    Favorite,
    All,
  }


class ProductsOverViewScreen extends StatefulWidget {
  const ProductsOverViewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverViewScreen> createState() => _ProductsOverViewScreenState();
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {

   bool _showFavoriteOnly = false;

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
                        child: Text('Somente Favoritos'),
                      ),
                    ],
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorite) {
                    _showFavoriteOnly = true;
                  } else {
                    _showFavoriteOnly = false;
                  }
                  print(_showFavoriteOnly);
                });
              },
            )
          ]),
      body: ProductGrid(_showFavoriteOnly),
    );
  }
}
