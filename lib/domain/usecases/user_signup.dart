import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

abstract class UserSignUp {
  Future<String?> signUp(SignUpParams params);
}

class SignUpParams extends Equatable {
  final String email;
  final String password;
  final UserEntity user;

  List get props => [email, user, password];

  SignUpParams({required this.email, required this.user, required this.password});
}
