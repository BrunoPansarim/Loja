import 'package:flutter/material.dart';

enum AuthMode { Signup, Login }

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}


class _AuthFormState extends State<AuthForm> {
  AuthMode _authMode = AuthMode.Signup;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

 void _subimit () {}

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Container(
        color: Colors.black12,
        padding: const EdgeInsets.all(8.0),
        height: 250,
        width: deviceSize.width * 0.85,
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (email) => _authData['email'] = email ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Senha',
                ),
                keyboardType: TextInputType.visiblePassword,
                onSaved: (password) => _authData['email'] = password ?? '',
              ),
              if (_authMode == AuthMode.Signup)
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Confirmar senha',
                ),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
              ),
              TextButton(onPressed: _subimit,
                  child: Text( _authMode == AuthMode.Login ?
                 'Enter' : 'Registrar',
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
