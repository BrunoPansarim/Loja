import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(this.product, {Key? key}) : super(key: key);
    final Product product;

  @override
  Widget build(BuildContext context) {

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.title,
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
                onPressed: () {},
                icon: const Icon(Icons.edit),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
