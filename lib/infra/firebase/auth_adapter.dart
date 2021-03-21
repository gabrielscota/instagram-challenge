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
    UserCredential? userCredential;
    try {
      userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (_) {}
    return userCredential!;
  }
}
