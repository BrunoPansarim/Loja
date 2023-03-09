import 'package:flutter/material.dart';
import 'package:lojinha/screen/product_detail_page.dart';
import 'package:lojinha/screen/products_overView_screen.dart';
import 'package:lojinha/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Lato',
        useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(background: Colors.black),
      ),
      home: ProductsOverViewScreen(),
      routes: {
        AppRoutes.product_detail: (ctx) => const ProductDetailPage(),

      },
    );
  }
}
