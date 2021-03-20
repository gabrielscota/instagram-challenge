import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/firebase/firebase.dart';

class Firestore extends CloudFirestore {
  final FirebaseFirestore firestore;

  Firestore({required this.firestore});

  @override
  CollectionReference getCollection({required String collectionName}) {
    CollectionReference? collectionReference;
    try {
      collectionReference = firestore.collection(collectionName);
    } catch (_) {}
    return collectionReference!;
  }

  @override
  Stream<QuerySnapshot> getStreamCollection({required String collectionName}) {
    Stream<QuerySnapshot>? collectionStream;
    try {
      collectionStream = firestore.collection(collectionName).snapshots();
    } catch (_) {}
    return collectionStream!;
  }
}
