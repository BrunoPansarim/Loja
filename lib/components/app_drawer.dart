import 'package:flutter/material.dart';
import 'package:lojinha/utils/app_routes.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';

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
                AppRoutes.authOrHomeROUTE,
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
          ListTile(
            leading: const Icon(
              Icons.exit_to_app_outlined,
              color: Colors.white,
            ),
            title: const Text(
              'Sair',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              Provider.of<Auth>(
                context,
                listen: false,
              ).logout();
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.authOrHomeROUTE,
              );
            },
          ),
        ],
      ),
    );
  }
}
