import 'package:firebase_auth/firebase_auth.dart';

import 'package:yap/authentication/signup_email_password_failure.dart';

import 'package:yap/page/home_page.dart';


import '../page/welcome.dart';
import 'package:get/get.dart';

class Authentication extends GetxController {
  static Authentication get instance => Get.find();

  final  _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {

    firebaseUser =  Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever (firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => WelcomeScreen()) : Get.offAll(() => HomePage());
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => HomePage()) : Get.to(() => WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      // Handle specific Firebase Auth exceptions
    } catch (_) {
      // Handle other exceptions
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;

    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Auth exceptions
    } catch (_) {
      // Handle other exceptions
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
