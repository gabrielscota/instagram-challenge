import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/firebase/firebase.dart';

class FirestoreAdapter extends CloudFirestore {
  final FirebaseFirestore firebaseFirestore;

  FirestoreAdapter({required this.firebaseFirestore});

  @override
  CollectionReference getCollection({required String collectionName}) {
    CollectionReference? collectionReference;
    try {
      collectionReference = firebaseFirestore.collection(collectionName);
    } catch (_) {}
    return collectionReference!;
  }

  @override
  Stream<QuerySnapshot> getStreamCollection({required String collectionName}) {
    Stream<QuerySnapshot>? collectionStream;
    try {
      collectionStream = firebaseFirestore.collection(collectionName).snapshots();
    } catch (_) {}
    return collectionStream!;
  }
}
