import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthException implements Exception {
  static const Map<String, String> errors = {
    'EMAIL_EXISTS': 'E-mail já existe, parsa!',
    'OPERATION_NOT_ALLOWED': 'Operação não permitida, brow',
    'TOO_MANY_ATTEMPTS_TRY_LATER': 'Muitas tentativas, volte amanhã',
    'EMAIL_NOT_FOUND': 'Procurei, procurei e não achei',
    'INVALID_PASSWORD': 'digita certo aí, meu nobre',
    'USER_DISABLED': 'foi bloqueado kkkk',
  };


  final String key;

  AuthException(this.key);

  @override
  String toString() {
    return errors[key] ?? 'Deu ruim no processo de autenticação';
  }
}