import 'package:flutter/material.dart';

import '../components/auth_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromRGBO(200, 100, 250, 0.8),
                Color.fromRGBO(125, 150, 150, 0.10),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(5),
                  //   border: Border.all(
                  //     color: Colors.lightGreen,
                  //   ),
                  //   boxShadow: const [
                  //     BoxShadow(
                  //       blurRadius: 8,
                  //       color: Colors.lightGreen,
                  //       offset: Offset(1, 4),
                  //     )
                  //   ],
                  // ),
                  // child: const Text(
                  //   'Acessar com um usuário',
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontFamily: 'Anton',
                  //     fontSize: 25,
                  //   ),
                  ),
                const AuthForm(),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
