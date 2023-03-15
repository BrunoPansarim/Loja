import 'package:flutter/material.dart';
import 'package:lojinha/models/OrderList.dart';
import 'package:lojinha/models/cart.dart';
import 'package:lojinha/models/product_list.dart';
import 'package:lojinha/screen/CartPage.dart';
import 'package:lojinha/screen/orders_screen.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ), ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
          // ChangeNotifierProvider(
          // create: (_) => OrderList(),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Lato',
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)
              .copyWith(background: Colors.black),
        ),
        home: const ProductsOverviewPage(),
        routes: {
          AppRoutes.home: (ctx) => const ProductsOverviewPage(),
          AppRoutes.product_detail: (ctx) => const ProductDetailPage(),
          AppRoutes.product_cart: (ctx) => const CartPage(),
          AppRoutes.orders: (ctx) => const OrdersPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
