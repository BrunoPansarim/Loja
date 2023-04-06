import 'package:flutter/material.dart';
import 'package:lojinha/screen/auth_page.dart';
import 'package:lojinha/screen/products_overview_screen.dart';
import 'package:provider/provider.dart';
import '../models/auth.dart';


class AuthOrHomeScreen extends StatelessWidget {
  const AuthOrHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? ProductsOverviewPage() : AuthPage();
  }
}
