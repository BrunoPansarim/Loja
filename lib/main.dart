import 'package:flutter/material.dart';
import 'package:lojinha/models/auth.dart';
import 'package:lojinha/models/cart.dart';
import 'package:lojinha/models/order_list.dart';
import 'package:lojinha/models/product_list.dart';
import 'package:lojinha/screen/auth_or_home_screen.dart';
import 'package:lojinha/screen/cart_page.dart';
import 'package:lojinha/screen/orders_screen.dart';
import 'package:lojinha/screen/product_detail_page.dart';
import 'package:lojinha/screen/product_form_page.dart';
import 'package:lojinha/screen/products_page.dart';
import 'package:lojinha/utils/app_routes.dart';
import 'package:lojinha/utils/custom_route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, ProductList>(
          create: (_) => ProductList(),
          update: (ctx, auth, previous) {
            return ProductList(
              auth.token ?? '',
              auth.userId ?? '',
              previous?.items ?? [],
            );
          },
        ),
        ChangeNotifierProxyProvider<Auth, OrderList>(
          create: (_) => OrderList(),
          update: (ctx, auth, previous) {
            return OrderList(
              auth.token ?? '',
              auth.userId ?? '',
              previous?.items ?? [],
            );
          },
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Lato',
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: CustomPageTransitionBuilder(),
            TargetPlatform.android: CustomPageTransitionBuilder(),
          }),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)
              .copyWith(background: Colors.black),
        ),
        // home: const ProductsOverviewPage(),
        routes: {
          AppRoutes.authOrHomeROUTE: (ctx) => const AuthOrHomeScreen(),
          AppRoutes.productDetailROUTE: (ctx) => const ProductDetailPage(),
          AppRoutes.productCartROUTE: (ctx) => const CartPage(),
          AppRoutes.ordersROUTE: (ctx) => const OrdersPage(),
          AppRoutes.productsPAGEROUTE: (ctx) => const ProductsPage(),
          AppRoutes.productFORMROUTE: (ctx) => const ProductForm(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
