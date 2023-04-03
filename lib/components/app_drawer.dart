import 'package:flutter/material.dart';
import 'package:lojinha/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        children: [
          AppBar(
            title: const Text(
              'Menu',
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
          ),
          // const Divider(),
          ListTile(
            leading: const Icon(
              Icons.shop,
              color: Colors.white,
            ),
            title: const Text(
              'Loja',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.homeROUTE,
              );
            },
          ),
          // const Divider(),
          ListTile(
            leading: const Icon(
              Icons.payment_sharp,
              color: Colors.white,
            ),
            title: const Text(
              'PC',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.ordersROUTE,
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.edit_note,
              color: Colors.white,
            ),
            title: const Text(
              'Gerenciar Produtos',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.productsPAGEROUTE,
              );
            },
          ),
        ],
      ),
    );
  }
}
