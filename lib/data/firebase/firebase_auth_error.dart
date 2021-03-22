import 'package:flutter/foundation.dart';

enum FirebaseAuthError {
  emailAlreadyExists,
  internalError,
  invalidEmail,
  invalidPassword,
  userNotFound,
  wrongPassword,
}

extension FirebaseAuthErrorExtension on FirebaseAuthError {
  String get name => describeEnum(this);

  String get code {
    switch (this) {
      case FirebaseAuthError.userNotFound:
        return 'user-not-found';
      case FirebaseAuthError.wrongPassword:
        return 'wrong-password';
      default:
        return 'internal-error';
    }
  }
}
