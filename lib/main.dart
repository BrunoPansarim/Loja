import 'package:flutter/material.dart';
import 'package:lojinha/models/product_list.dart';
import 'package:lojinha/screen/product_detail_page.dart';
import 'package:lojinha/screen/products_overView_screen.dart';
import 'package:lojinha/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductList(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Lato',
          useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(background: Colors.black),
        ),
        home: const ProductsOverViewScreen(),
        routes: {
          AppRoutes.product_detail: (ctx) => const ProductDetailPage(),

        },
      ),
    );
  }
}
