import 'package:equatable/equatable.dart';

abstract class Authentication {
  Future<String?> auth(AuthenticationParams params);
}

class AuthenticationParams extends Equatable {
  final String email;
  final String password;

  List get props => [email, password];

  AuthenticationParams({required this.email, required this.password});
}
