import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Done";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return "weak-password";
      } else if (e.code == 'email-already-in-use') {
        return "email-used";
      }
    } catch (e) {
      print(e);
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Done";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "NoEmail";
      } else if (e.code == 'wrong-password') {
        return "WrongPass";
      }
    }
  }
}
