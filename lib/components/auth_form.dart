import 'package:flutter/material.dart';

enum AuthMode { Signup, Login }

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;


  AuthMode _authMode = AuthMode.Signup;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  void _switchAuthMode () {
    setState(() {
      if(_isLogin()) {
        _authMode = AuthMode.Signup;
      } else {
        _authMode = AuthMode.Login;
      }
    });
  }

  bool _isLogin() => _authMode == AuthMode.Login;

  bool _isSignup() => _authMode == AuthMode.Signup;

  void _subimit() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if(!isValid) {
      return ;
    }
    setState(() => _isLoading = true);

    _formKey.currentState?.save();

    if(_isLogin()) {

    } else {
      // login
    }
      // Registrar 

    setState(() => _isLoading = false);
  }

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
        height: _isLogin() ? 220 : 290,
        width: deviceSize.width * 0.85,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (email) => _authData['email'] = email ?? '',
                validator: (_email) {
                  final email = _email ?? '';
                  if (email.trim().isEmpty ||
                      !email.contains('@') ||
                      email.endsWith('.com' '.br') ||
                      email.length < 10) {
                    return 'Isso não é um e-mail, cara!';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Senha',
                ),
                keyboardType: TextInputType.visiblePassword,
                controller: _passwordController,
                onSaved: (password) => _authData['password'] = password ?? '',
                validator: (_password) {
                  final password = _password ?? '';
                  if (password.isEmpty || password.length < 5) {}
                  return null;
                },
              ),
              if (_isSignup())
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Confirmar senha',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    validator: _isLogin()
                        ? null
                        : (_password) {
                            final password = _password ?? '';
                            if (password != _passwordController.text) {
                              return 'As senhas devem ser iguais ';
                            }
                            return null;
                          }),
              const SizedBox(height: 20),
              if(_isLoading)
                const CircularProgressIndicator()
              else
              TextButton(
                onPressed: _subimit,
                child: Text(
                  _authMode == AuthMode.Login ? 'Enter' : 'Registrar',
                ),
              ),
              const Spacer(),
              TextButton(
                  onPressed: _switchAuthMode,
                  child: Text(
                    _isLogin() ? 'Deseja Registrar?' : 'Já possui uma conta?',
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
