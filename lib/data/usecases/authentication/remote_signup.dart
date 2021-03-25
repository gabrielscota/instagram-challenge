import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../firebase/firebase.dart';
import '../../models/models.dart';

class RemoteSignUp implements UserSignUp {
  final FirebaseAuthentication firebaseAuthentication;
  final CloudFirestore cloudFirestore;

  RemoteSignUp({
    required this.firebaseAuthentication,
    required this.cloudFirestore,
  });

  Future<String?> signUp(SignUpParams params) async {
    try {
      UserCredential userCredential = await firebaseAuthentication.signUpWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      final CollectionReference users = cloudFirestore.getCollection(collectionName: 'users');
      Map<String, dynamic> remoteUser = RemoteUserModel(
        uid: userCredential.user!.uid,
        email: params.email,
        username: params.user.username,
        avatar: params.user.avatar,
        name: params.user.name,
        posts: params.user.posts.map((post) => RemotePostModel.fromEntity(post)).toList(),
        createdAt: params.user.createdAt,
        updatedAt: params.user.updatedAt,
        deletedAt: params.user.deletedAt,
      ).toJson();
      users.doc(userCredential.user?.uid).set(remoteUser);
      return userCredential.user?.uid;
    } on FirebaseAuthError catch (error) {
      switch (error) {
        case FirebaseAuthError.weakPassword:
          throw DomainError.weakPassword;
        case FirebaseAuthError.emailAlreadyInUse:
          throw DomainError.emailInUse;
        default:
          throw DomainError.unexpected;
      }
    }
  }
}
