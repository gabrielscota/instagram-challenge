import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

abstract class UserFacebookSignIn {
  Future<String?> authWithFacebook(FacebookSignUpParams params);
}

class FacebookSignUpParams extends Equatable {
  final UserEntity user;

  List get props => [user];

  FacebookSignUpParams({required this.user});
}
