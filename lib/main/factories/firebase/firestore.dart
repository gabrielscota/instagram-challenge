import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/firebase/firebase.dart';
import '../../../infra/firebase/firebase.dart';

CloudFirestore makeCloudFirestore() => Firestore(firestore: FirebaseFirestore.instance);