import 'package:firebase_auth/firebase_auth.dart';

import '../../data/firebase/firebase.dart';

class AuthAdapter extends FirebaseAuthentication {
  final FirebaseAuth firebaseAuth;

  AuthAdapter({required this.firebaseAuth});

  @override
  Future<UserCredential> authWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (error) {
      if (error.code == FirebaseAuthError.userNotFound.code) {
        throw FirebaseAuthError.userNotFound;
      } else if (error.code == FirebaseAuthError.wrongPassword.code) {
        throw FirebaseAuthError.wrongPassword;
      } else {
        throw FirebaseAuthError.internalError;
      }
    }
  }
}
