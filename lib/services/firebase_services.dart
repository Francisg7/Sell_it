import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  String getUserId() {
    return _firebaseAuth.currentUser.uid;
  }

  final CollectionReference productsRef =
      FirebaseFirestore.instance.collection("Products");
  final CollectionReference usersRef =
      // User -> UserId(document) -> cart -> ProductID(document)
      FirebaseFirestore.instance.collection("Users");
}