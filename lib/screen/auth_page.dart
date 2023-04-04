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
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.deepPurple,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 2,
                          color: Colors.deepPurple,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: const Text(
                      'Infinite Dreams',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Anton',
                        fontSize: 15,
                      ),
                    ),
                  ),
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
