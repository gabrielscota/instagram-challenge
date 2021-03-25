import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

abstract class UserGoogleSignIn {
  Future<String?> authWithGoogle(GoogleSignUpParams params);
}

class GoogleSignUpParams extends Equatable {
  final UserEntity user;

  List get props => [user];

  GoogleSignUpParams({required this.user});
}
