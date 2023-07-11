import 'dart:developer';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:yap/models/chat_user.dart' as model;
import 'package:yap/resources/storage_methods.dart';
import '../../models/chat_user.dart';
import '../api/apis.dart';

class AuthMethods {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseMessaging fMessaging = FirebaseMessaging.instance;

  static User get user => auth.currentUser!;

  Future<model.ChatUser> getUserDetails() async {
    User currentUser = auth.currentUser!;
    DocumentSnapshot documentSnapshot =
    await firestore.collection('users').doc(currentUser.uid).get();
    return model.ChatUser.fromJson(documentSnapshot.data()! as Map<String, dynamic>);
  }
}
