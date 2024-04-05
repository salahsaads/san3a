import 'package:firebase_auth/firebase_auth.dart';

class Auth_client {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  // sign in with email and password
  static Future signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "yes";
    } on FirebaseAuthException catch (e) {
      return e;
    }
  }

  // sign up with email and password
  static Future signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "yes";
    } catch (e) {
      print(e.toString());
      return null;
    }
  }




}
