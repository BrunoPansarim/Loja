import 'package:flutter/material.dart';
import 'package:lojinha/exception/auth_exception.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';

enum AuthMode { signup, login }

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm>
    with SingleTickerProviderStateMixin {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  AuthMode _authMode = AuthMode.login;
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  AnimationController? _controller;
  Animation<double>? _opacityAnimation;
  Animation<Offset>? _slideAnimation;

  bool _isLogin() => _authMode == AuthMode.login;

  bool _isSignup() => _authMode == AuthMode.signup;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 800,
        ));

    _opacityAnimation = Tween(
      begin: 0.0,
      end: 2.0,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeInOutQuint,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.linear,
      ),
    );

    // _opacityAnimation.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  void _switchAuthMode() {
    setState(() {
      if (_isLogin()) {
        _authMode = AuthMode.signup;
        _controller?.forward();
      } else {
        _authMode = AuthMode.login;
        _controller?.reverse();
      }
    });
  }

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Ocorreu um Erro'),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  final String emails = "bruno@gostosaodemiami.com";
  final emailValidator = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  Future<void> _subimit() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }
    setState(() => _isLoading = true);

    _formKey.currentState?.save();
    Auth auth = Provider.of(context, listen: false);

    try {
      if (_isLogin()) {
        await auth.login(
          _authData['email']!,
          _authData['password']!,
        );
      } else {
        await auth.signup(
          _authData['email']!,
          _authData['password']!,
        );
      }
    } on AuthException catch (error) {
      _showErrorDialog(error.toString());
    } catch (error) {
      _showErrorDialog('Ocorreu mais um erro!');
    }

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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeIn,
        color: Colors.black12,
        padding: const EdgeInsets.all(8.0),
        height: _isLogin() ? 310 : 350,
        // height: _opacityAnimation?.value.height ?? (_isLogin() ? 280 : 350),
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
                  final emailValidator = RegExp(
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                  if (!emailValidator.hasMatch(_email ?? '')) {
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
                obscureText: true,
                controller: _passwordController,
                onSaved: (password) => _authData['password'] = password ?? '',
                validator: (_password) {
                  final password = _password ?? '';
                  if (password.isEmpty || password.length < 5) {
                    return 'Senha invalida';
                  }
                  return null;
                },
              ),
              AnimatedContainer(
                constraints: BoxConstraints(
                  minHeight: _isLogin() ? 0 : 60,
                  maxHeight: _isLogin() ? 0 : 120,
                ),
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
                child: FadeTransition(
                  opacity: _opacityAnimation!,
                  child: SlideTransition(
                    position: _slideAnimation!,
                    textDirection: TextDirection.ltr,
                    child: TextFormField(
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
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                TextButton(
                  onPressed: _subimit,
                  child: Text(
                    _authMode == AuthMode.login ? 'Enter' : 'Registrar',
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
