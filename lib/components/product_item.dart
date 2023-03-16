import 'package:flutter/material.dart';

class ProductWidgetItem extends StatelessWidget {
  const ProductWidgetItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Produto'),
    );
  }
}
