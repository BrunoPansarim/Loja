import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../exception/auth_exception.dart';

class Auth with ChangeNotifier {
  Future<void> _authenticate(String email, String password, String urlFragment) async {
    final url = 'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=AIzaSyCIbwjoS9KASS5xPza2Nftn8tqKTvhgaaY';
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
        }),
    );

    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      throw AuthException(body['error']['message']);
    }

    print(body);
  }
  Future<void> signup(String email, String password) async {
    _authenticate(email, password, 'signUp');

  }  Future<void> login(String email, String password) async {
    _authenticate(email, password, 'signInWithPassword');
  }
}
