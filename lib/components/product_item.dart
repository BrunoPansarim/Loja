import 'package:flutter/material.dart';
import 'package:lojinha/exception/http_exception.dart';
import 'package:lojinha/models/product_list.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(this.product, {Key? key}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    final msg = ScaffoldMessenger.of(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(
        product.name,
        style: const TextStyle(
          color: Colors.white,
        ),
        selectionColor: Colors.white,
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.productFORMROUTE,
                  arguments: product,
                );
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text(
                      'Deseja excluir?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    content: const Text(
                      'Está certo disso?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text('Não'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text('Sim'),
                      ),
                    ],
                  ),
                ).then((value) async {
                  if (value ?? false) {
                    if (value ?? false) {
                      try {
                        await Provider.of<ProductList>(
                          context,
                          listen: false,
                        ).removeProduct(product);
                      } on HttpException catch (error) {
                        msg.showSnackBar(SnackBar(
                          content: Text(error.toString()),
                        ));
                      }
                    }
                  }
                });
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
